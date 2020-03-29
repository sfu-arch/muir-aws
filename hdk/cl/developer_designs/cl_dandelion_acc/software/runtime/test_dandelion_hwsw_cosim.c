// Amazon FPGA Hardware Development Kit
//
// Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.

#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <malloc.h>
#include <poll.h>

#include <utils/sh_dpi_tasks.h>

#ifdef SV_TEST
# include <fpga_pci_sv.h>
#else
# include <fpga_pci.h>
# include <fpga_mgmt.h>
# include "fpga_dma.h"
# include <utils/lcd.h>
#endif

#include "test_dram_dma_common.h"

#define MEM_16G              (1ULL << 34)

void usage(const char* program_name);
int dma_example_hwsw_cosim(int slot_id, size_t buffer_size);

static inline int do_dma_read(int fd, uint8_t *buffer, size_t size,
    uint64_t address, int channel, int slot_id);
static inline int do_dma_write(int fd, uint8_t *buffer, size_t size,
    uint64_t address, int channel, int slot_id);

int dandelion_access(int slot_id);

#if !defined(SV_TEST)
/* use the stdout logger */
const struct logger *logger = &logger_stdout;
#else
# define log_error(...) printf(__VA_ARGS__); printf("\n")
# define log_info(...) printf(__VA_ARGS__); printf("\n")
#endif

/* Main will be different for different simulators and also for C. The
 * definition is in sdk/userspace/utils/include/sh_dpi_tasks.h file */
#if defined(SV_TEST) && defined(INT_MAIN)
/* For cadence and questa simulators main has to return some value */
int test_main(uint32_t *exit_code)

#elif defined(SV_TEST)
void test_main(uint32_t *exit_code)

#else 
int main(int argc, char **argv)

#endif
{
    size_t buffer_size;
#if defined(SV_TEST)
    buffer_size = 128;
#else
    buffer_size = 1ULL << 24;
#endif

    /* The statements within SCOPE ifdef below are needed for HW/SW
     * co-simulation with VCS */
#if defined(SCOPE)
    svScope scope;
    scope = svGetScopeFromName("tb");
    svSetScope(scope);
#endif

    int rc;
    int slot_id = 0;

#if !defined(SV_TEST)
    switch (argc) {
    case 1:
        break;
    case 3:
        sscanf(argv[2], "%x", &slot_id);
        break;
    default:
        usage(argv[0]);
        return 1;
    }

    /* setup logging to print to stdout */
    rc = log_init("test_dram_dma_hwsw_cosim");
    fail_on(rc, out, "Unable to initialize the log.");
    rc = log_attach(logger, NULL, 0);
    fail_on(rc, out, "%s", "Unable to attach to the log.");

    /* initialize the fpga_plat library */
    rc = fpga_mgmt_init();
    fail_on(rc, out, "Unable to initialize the fpga_mgmt library");

#endif

    /*rc = dma_example_hwsw_cosim(slot_id, buffer_size);*/
    /*fail_on(rc, out, "DMA example failed");*/

    rc = dandelion_access(slot_id);
    fail_on(rc, out, "Dandelion example failed");
out:

#if !defined(SV_TEST)
    return rc;
#else
    if (rc != 0) {
        printf("TEST FAILED \n");
    }
    else {
        printf("TEST PASSED \n");
    }
    /* For cadence and questa simulators main has to return some value */
    #ifdef INT_MAIN
    *exit_code = 0;
    return 0;
    #else
    *exit_code = 0;
    #endif
#endif
}

void usage(const char* program_name) {
    printf("usage: %s [--slot <slot>]\n", program_name);
}

/**
 * Write 4 identical buffers to the 4 different DRAM channels of the AFI
 */
int dma_example_hwsw_cosim(int slot_id, size_t buffer_size)
{
    int write_fd, read_fd, dimm, rc;

    write_fd = -1;
    read_fd = -1;

    uint8_t *write_buffer = malloc(buffer_size);
    uint8_t *read_buffer = malloc(buffer_size);
    if (write_buffer == NULL || read_buffer == NULL) {
        rc = -ENOMEM;
        goto out;
    }

    printf("Memory has been allocated, initializing DMA and filling the buffer...\n");
#if !defined(SV_TEST)
    read_fd = fpga_dma_open_queue(FPGA_DMA_XDMA, slot_id,
        /*channel*/ 0, /*is_read*/ true);
    fail_on((rc = (read_fd < 0) ? -1 : 0), out, "unable to open read dma queue");

    write_fd = fpga_dma_open_queue(FPGA_DMA_XDMA, slot_id,
        /*channel*/ 0, /*is_read*/ false);
    fail_on((rc = (write_fd < 0) ? -1 : 0), out, "unable to open write dma queue");
#else
    setup_send_rdbuf_to_c(read_buffer, buffer_size);
    printf("Starting DDR init...\n");
    init_ddr();
    deselect_atg_hw();
    printf("Done DDR init...\n");
#endif
    printf("filling buffer with  random data...\n") ;

    rc = fill_buffer_urandom(write_buffer, buffer_size);
    fail_on(rc, out, "unable to initialize buffer");

    printf("Now performing the DMA transactions...\n");
    for (dimm = 0; dimm < 4; dimm++) {
        rc = do_dma_write(write_fd, write_buffer, buffer_size,
            dimm * MEM_16G, dimm, slot_id);
        fail_on(rc, out, "DMA write failed on DIMM: %d", dimm);
    }

    bool passed = true;
    for (dimm = 0; dimm < 4; dimm++) {
        rc = do_dma_read(read_fd, read_buffer, buffer_size,
            dimm * MEM_16G, dimm, slot_id);
        fail_on(rc, out, "DMA read failed on DIMM: %d", dimm);
        uint64_t differ = buffer_compare(read_buffer, write_buffer, buffer_size);
        if (differ != 0) {
            log_error("DIMM %d failed with %lu bytes which differ", dimm, differ);
            passed = false;
        } else {
            log_info("DIMM %d passed!", dimm);
        }
    }
    rc = (passed) ? 0 : 1;

out:
    if (write_buffer != NULL) {
        free(write_buffer);
    }
    if (read_buffer != NULL) {
        free(read_buffer);
    }
#if !defined(SV_TEST)
    if (write_fd >= 0) {
        close(write_fd);
    }
    if (read_fd >= 0) {
        close(read_fd);
    }
#endif
    /* if there is an error code, exit with status 1 */
    return (rc != 0 ? 1 : 0);
}

int dandelion_access(int slot_id) {

    int rc_control;
    int rc_memory;
    pci_bar_handle_t pci_bar_handle = PCI_BAR_HANDLE_INIT;
    int pf_id = 0;
    int bar_id = 0;
    int fpga_attach_flags = 0;
    uint32_t in_hi_addr, in_lo_addr;
    uint32_t out_hi_addr, out_lo_addr;
    uint32_t vector_len   = 0;
    uint32_t constant_val = 0;
    uint32_t cycle_count = 0;
    uint32_t control_reg = 0;
    int write_fd, read_fd, dimm, rc;
    //int buffer_size = (1ULL << 20); // 1MB data
    int buffer_size = 256; // 1MB data

    /**
     * Dandelion memory mapped address space BAR1
     */
    /*pf_id = FPGA_APP_PF;*/
    /*bar_id = APP_PF_BAR1;*/
#ifndef SV_TEST
    rc_control = fpga_pci_attach(slot_id, pf_id, bar_id, fpga_attach_flags, &pci_bar_handle);
    fail_on(rc_control, out, "Unable to attach to the AFI on slot id %d", slot_id);
#endif

    dimm = 0;

    write_fd = -1;
    read_fd = -1;

    uint8_t *write_buffer = malloc(buffer_size);
    uint8_t *read_buffer = malloc(buffer_size);
    if (write_buffer == NULL || read_buffer == NULL) {
        rc = -ENOMEM;
        goto out;
    }


    printf("Memory has been allocated, initializing DMA and filling the buffer...\n");
#if !defined(SV_TEST)
    read_fd = fpga_dma_open_queue(FPGA_DMA_XDMA, slot_id,
        /*channel*/ 0, /*is_read*/ true);
    fail_on((rc_memory = (read_fd < 0) ? -1 : 0), out, "unable to open read dma queue");

    write_fd = fpga_dma_open_queue(FPGA_DMA_XDMA, slot_id,
        /*channel*/ 0, /*is_read*/ false);
    fail_on((rc_memory = (write_fd < 0) ? -1 : 0), out, "unable to open write dma queue");
#else
    setup_send_rdbuf_to_c(read_buffer, buffer_size);
    printf("Starting DDR init...\n");
    init_ddr();
    deselect_atg_hw();
    printf("Done DDR init...\n");
#endif
    printf("filling buffer with  random data...\n") ;

    rc_memory = fill_buffer_urandom(write_buffer, buffer_size);
    fail_on(rc_memory, out, "unable to initialize buffer");

    printf("Now performing the DMA transactions...\n");
    rc_memory = do_dma_write(write_fd, write_buffer, buffer_size, 0 /*begining address */, dimm, slot_id);
    fail_on(rc_memory, out, "DMA write failed on DIMM: %d", dimm);

    bool passed = true;
    rc_memory = do_dma_read(read_fd, read_buffer, buffer_size,
        0 /* Begining address */, dimm, slot_id);
    fail_on(rc_memory, out, "DMA read failed");
    uint64_t differ = buffer_compare(read_buffer, write_buffer, buffer_size);
    if (differ != 0) {
        log_error("Failed with %lu bytes which differ", differ);
        passed = false;
    } else {
        log_info("Initilization passed!");
    }
    rc_memory = (passed) ? 0 : 1;

    log_info("Starting AXI Master to DDR test");

    /* Initializing dandelion control registers
     * Register File.
     * Six 32-bit register file.
     *
     * -------------------------------
     * Register description    | addr
     * ------------------------|-----
     * Control status register | 0x500
     * Cycle counter           | 0x504
     * Constant value          | 0x508
     * Vector length           | 0x50c
     * Input pointer lsb       | 0x510
     * Input pointer msb       | 0x514
     * Output pointer lsb      | 0x518
     * Output pointer msb      | 0x51c
     * -------------------------------
     *
     * ------------------------------
     * Control status register | bit
     * ------------------------------
     * Launch                  | 0
     * Finish                  | 1
     * ------------------------------
    */

    static uint64_t ccr_control  = 0x500;
    static uint64_t ccr_cycle    = 0x504;
    static uint64_t ccr_cnst     = 0x508;
    static uint64_t ccr_len      = 0x50C;
    static uint64_t ccr_in_lsb   = 0x510;
    static uint64_t ccr_in_msb   = 0x514;
    static uint64_t ccr_out_lsb  = 0x518;
    static uint64_t ccr_out_msb  = 0x51C;


    in_hi_addr = 0x00000000;
    in_lo_addr = 0x00000001;

    out_hi_addr = 0x00000000;
    out_lo_addr = 0x00000800;

    constant_val = 5;
    vector_len = 10;

    //write a value into the mapped address space
    printf("Initializing dandelion accelerator:\n");

    printf("Writing 0x%08x to Dandelion const register (0x%016lx)\n\n", constant_val, ccr_cnst);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_cnst, constant_val);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    printf("Writing 0x%08x to Dandelion vector len register (0x%016lx)\n\n", vector_len, ccr_len);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_len, vector_len);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    printf("Writing 0x%08x to Dandelion in lsb register (0x%016lx)\n\n", in_lo_addr, ccr_in_lsb);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_in_lsb, in_lo_addr);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    printf("Writing 0x%08x to Dandelion in msb register (0x%016lx)\n\n", in_hi_addr, ccr_in_msb);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_in_msb, in_hi_addr);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    printf("Writing 0x%08x to Dandelion out lsb register (0x%016lx)\n\n", out_lo_addr, ccr_out_lsb);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_out_lsb, out_lo_addr);
    fail_on(rc_control, out, "Unable to write to the fpga !");


    printf("Writing 0x%08x to Dandelion out msb register (0x%016lx)\n\n", out_hi_addr, ccr_out_msb);
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_out_msb, out_hi_addr);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    printf("Lunching -- Writing 0x1 to dandelion ctrl register:\n");
    rc_control = fpga_pci_poke(pci_bar_handle, ccr_control, 0x1);
    fail_on(rc_control, out, "Unable to write to the fpga !");

    do{
        rc_control = fpga_pci_peek(pci_bar_handle, ccr_control, &control_reg);
        fail_on(rc_control, out, "Unable to read read from the fpga !");
    } while(control_reg != 2);

    /* read it back and print it out; you should expect the byte order to be
     * reversed (That's what this CL does) */
    printf("Reading from 0x%016lx to cycle count\n\n", ccr_cycle);
    rc_control = fpga_pci_peek(pci_bar_handle, ccr_cycle, &cycle_count);
    fail_on(rc_control, out, "Unable to read read from the fpga !");

    rc_memory = do_dma_read(read_fd, read_buffer, buffer_size, 0x800, 0, slot_id);
    fail_on(rc_memory, out, "DMA read failed on reading form out buffer.");

    printf("Execution finished in [ %d ] cycle\n", cycle_count);

    printf("Checking memory output\n");
    for(uint32_t i = 0; i < buffer_size; i++){
        if(read_buffer[i] != write_buffer[i])
            printf("Write Buffer [%d]: %d -- Read Buffer [%d]: %d\n", i, write_buffer[i], i, read_buffer[i]);
    }

out:
    if (write_buffer != NULL) {
        free(write_buffer);
    }
    if (read_buffer != NULL) {
        free(read_buffer);
    }
    if (write_fd >= 0) {
        close(write_fd);
    }
    if (read_fd >= 0) {
        close(read_fd);
    }
    /* if there is an error code, exit with status 1 */
    /*return (rc_control != 0 ? (rc_memory != 0 ? 1 : 0) : 0);*/
    return (rc_memory != 0 ? 1 : 0);

}




static inline int do_dma_read(int fd, uint8_t *buffer, size_t size,
    uint64_t address, int channel, int slot_id)
{
#if defined(SV_TEST)
    sv_fpga_start_cl_to_buffer(slot_id, channel, size, (uint64_t) buffer, address);
    return 0;
#else
    return fpga_dma_burst_read(fd, buffer, size, address);
#endif
}

static inline int do_dma_write(int fd, uint8_t *buffer, size_t size,
    uint64_t address, int channel, int slot_id)
{
#if defined(SV_TEST)
    sv_fpga_start_buffer_to_cl(slot_id, channel, size, (uint64_t) buffer, address);
    return 0;
#else
    return fpga_dma_burst_write(fd, buffer, size, address);
#endif
}
