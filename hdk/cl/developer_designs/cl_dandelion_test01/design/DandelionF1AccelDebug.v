module DCRF1(
  input         clock,
  input         reset,
  input  [31:0] io_host_addr,
  input  [31:0] io_host_wdata,
  input         io_host_wr,
  input         io_host_rd,
  output        io_host_ack,
  output [31:0] io_host_rdata,
  output        io_dcr_launch,
  input         io_dcr_finish,
  input         io_dcr_ecnt_0_valid,
  input  [31:0] io_dcr_ecnt_0_bits,
  input         io_dcr_ecnt_1_valid,
  input  [31:0] io_dcr_ecnt_1_bits,
  output [31:0] io_dcr_vals_0,
  output [31:0] io_dcr_vals_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] waddr; // @[DCRF1.scala 65:22]
  reg [1:0] wstate; // @[DCRF1.scala 68:23]
  reg [1:0] rstate; // @[DCRF1.scala 72:23]
  reg [31:0] rdata; // @[DCRF1.scala 73:22]
  reg [31:0] reg_0; // @[DCRF1.scala 79:37]
  reg [31:0] reg_1; // @[DCRF1.scala 79:37]
  reg [31:0] reg_2; // @[DCRF1.scala 79:37]
  reg [31:0] reg_3; // @[DCRF1.scala 79:37]
  reg [31:0] reg_4; // @[DCRF1.scala 79:37]
  wire  isWriteData = wstate == 2'h1; // @[DCRF1.scala 89:28]
  wire  _T = 2'h0 == wstate; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  wire  _GEN_5 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T ? 1'h0 : _GEN_5; // @[Conditional.scala 40:58]
  wire  _T_3 = 2'h0 == rstate; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h1 == rstate; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h2 == rstate; // @[Conditional.scala 37:30]
  wire  _GEN_11 = _T_5 | _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_4 ? _GEN_8 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _T_6 = 32'h500 == waddr; // @[DCRF1.scala 125:38]
  wire  _T_7 = io_host_wr & _T_6; // @[DCRF1.scala 125:25]
  wire  _T_8 = _T_7 & isWriteData; // @[DCRF1.scala 125:48]
  wire  _T_9 = 32'h504 == waddr; // @[DCRF1.scala 132:45]
  wire  _T_10 = io_host_wr & _T_9; // @[DCRF1.scala 132:27]
  wire  _T_11 = 32'h508 == waddr; // @[DCRF1.scala 132:45]
  wire  _T_12 = io_host_wr & _T_11; // @[DCRF1.scala 132:27]
  wire  _T_13 = 32'h50c == waddr; // @[DCRF1.scala 138:39]
  wire  _T_14 = io_host_wr & _T_13; // @[DCRF1.scala 138:21]
  wire  _T_15 = _T_14 & isWriteData; // @[DCRF1.scala 138:49]
  wire  _T_17 = ~reset; // @[DCRF1.scala 139:13]
  wire  _T_18 = 32'h510 == waddr; // @[DCRF1.scala 138:39]
  wire  _T_19 = io_host_wr & _T_18; // @[DCRF1.scala 138:21]
  wire  _T_20 = _T_19 & isWriteData; // @[DCRF1.scala 138:49]
  wire  _T_23 = 32'h500 == io_host_addr; // @[Mux.scala 80:60]
  wire  _T_25 = 32'h504 == io_host_addr; // @[Mux.scala 80:60]
  wire  _T_27 = 32'h508 == io_host_addr; // @[Mux.scala 80:60]
  wire  _T_29 = 32'h50c == io_host_addr; // @[Mux.scala 80:60]
  wire  _T_31 = 32'h510 == io_host_addr; // @[Mux.scala 80:60]
  assign io_host_ack = _T_3 ? _GEN_8 : _GEN_13; // @[DCRF1.scala 86:15 DCRF1.scala 104:19 DCRF1.scala 119:19]
  assign io_host_rdata = rdata; // @[DCRF1.scala 87:17]
  assign io_dcr_launch = reg_0[0]; // @[DCRF1.scala 148:17]
  assign io_dcr_vals_0 = reg_3; // @[DCRF1.scala 151:20]
  assign io_dcr_vals_1 = reg_4; // @[DCRF1.scala 151:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  waddr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  wstate = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rstate = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  rdata = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_4 = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      waddr <= 32'hffff;
    end else if (_T) begin
      if (io_host_wr) begin
        waddr <= io_host_addr;
      end
    end
    if (reset) begin
      wstate <= 2'h0;
    end else if (_T) begin
      if (io_host_wr) begin
        wstate <= 2'h1;
      end
    end else if (_T_1) begin
      wstate <= 2'h2;
    end else if (_T_2) begin
      wstate <= 2'h0;
    end
    if (reset) begin
      rstate <= 2'h0;
    end else if (_T_3) begin
      if (io_host_rd) begin
        rstate <= 2'h1;
      end
    end else if (_T_4) begin
      rstate <= 2'h2;
    end else if (_T_5) begin
      rstate <= 2'h0;
    end
    if (reset) begin
      rdata <= 32'h0;
    end else if (io_host_rd) begin
      if (_T_31) begin
        rdata <= reg_4;
      end else if (_T_29) begin
        rdata <= reg_3;
      end else if (_T_27) begin
        rdata <= reg_2;
      end else if (_T_25) begin
        rdata <= reg_1;
      end else if (_T_23) begin
        rdata <= reg_0;
      end else begin
        rdata <= 32'h0;
      end
    end
    if (reset) begin
      reg_0 <= 32'h0;
    end else if (io_dcr_finish) begin
      reg_0 <= 32'h2;
    end else if (_T_8) begin
      reg_0 <= io_host_wdata;
    end
    if (reset) begin
      reg_1 <= 32'h0;
    end else if (io_dcr_ecnt_0_valid) begin
      reg_1 <= io_dcr_ecnt_0_bits;
    end else if (_T_10) begin
      reg_1 <= io_host_wdata;
    end
    if (reset) begin
      reg_2 <= 32'h0;
    end else if (io_dcr_ecnt_1_valid) begin
      reg_2 <= io_dcr_ecnt_1_bits;
    end else if (_T_12) begin
      reg_2 <= io_host_wdata;
    end
    if (reset) begin
      reg_3 <= 32'h0;
    end else if (_T_15) begin
      reg_3 <= io_host_wdata;
    end
    if (reset) begin
      reg_4 <= 32'h0;
    end else if (_T_20) begin
      reg_4 <= io_host_wdata;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_15 & _T_17) begin
          $fwrite(32'h80000002,"Write add: %d : %d\n",waddr,io_host_wdata); // @[DCRF1.scala 139:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_20 & _T_17) begin
          $fwrite(32'h80000002,"Write add: %d : %d\n",waddr,io_host_wdata); // @[DCRF1.scala 139:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_addr,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_addr
);
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:14]
  assign io_out_valid = io_in_0_valid; // @[Arbiter.scala 135:16]
  assign io_out_bits_addr = io_in_0_bits_addr; // @[Arbiter.scala 124:15]
endmodule
module DME(
  input          clock,
  input          reset,
  input          io_mem_aw_ready,
  output         io_mem_aw_valid,
  output [63:0]  io_mem_aw_bits_addr,
  input          io_mem_w_ready,
  output         io_mem_w_valid,
  output [511:0] io_mem_w_bits_data,
  output         io_mem_w_bits_last,
  output         io_mem_b_ready,
  input          io_mem_b_valid,
  input          io_mem_ar_ready,
  output         io_mem_ar_valid,
  output [63:0]  io_mem_ar_bits_addr,
  output         io_mem_r_ready,
  input          io_mem_r_valid,
  input  [511:0] io_mem_r_bits_data,
  input          io_mem_r_bits_last,
  output         io_dme_rd_0_cmd_ready,
  input          io_dme_rd_0_cmd_valid,
  input          io_dme_rd_0_data_ready,
  output         io_dme_rd_0_data_valid,
  output [511:0] io_dme_rd_0_data_bits,
  output         io_dme_wr_0_cmd_ready,
  input          io_dme_wr_0_cmd_valid,
  input  [63:0]  io_dme_wr_0_cmd_bits_addr,
  output         io_dme_wr_0_data_ready,
  input          io_dme_wr_0_data_valid,
  input  [511:0] io_dme_wr_0_data_bits,
  output         io_dme_wr_0_ack
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  rd_arb_io_in_0_ready; // @[DME.scala 130:22]
  wire  rd_arb_io_in_0_valid; // @[DME.scala 130:22]
  wire [63:0] rd_arb_io_in_0_bits_addr; // @[DME.scala 130:22]
  wire  rd_arb_io_out_ready; // @[DME.scala 130:22]
  wire  rd_arb_io_out_valid; // @[DME.scala 130:22]
  wire [63:0] rd_arb_io_out_bits_addr; // @[DME.scala 130:22]
  wire  wr_arb_io_in_0_ready; // @[DME.scala 160:22]
  wire  wr_arb_io_in_0_valid; // @[DME.scala 160:22]
  wire [63:0] wr_arb_io_in_0_bits_addr; // @[DME.scala 160:22]
  wire  wr_arb_io_out_ready; // @[DME.scala 160:22]
  wire  wr_arb_io_out_valid; // @[DME.scala 160:22]
  wire [63:0] wr_arb_io_out_bits_addr; // @[DME.scala 160:22]
  wire  _T = rd_arb_io_out_ready & rd_arb_io_out_valid; // @[Decoupled.scala 40:37]
  reg [1:0] rstate; // @[DME.scala 138:23]
  wire  _T_1 = 2'h0 == rstate; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h1 == rstate; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h2 == rstate; // @[Conditional.scala 37:30]
  wire  _T_4 = io_mem_r_ready & io_mem_r_valid; // @[Decoupled.scala 40:37]
  wire  _T_5 = _T_4 & io_mem_r_bits_last; // @[DME.scala 152:28]
  wire  _T_6 = wr_arb_io_out_ready & wr_arb_io_out_valid; // @[Decoupled.scala 40:37]
  reg [1:0] wstate; // @[DME.scala 168:23]
  reg [7:0] wr_cnt; // @[DME.scala 171:23]
  wire  _T_7 = wstate == 2'h0; // @[DME.scala 174:15]
  wire  _T_8 = io_mem_w_ready & io_mem_w_valid; // @[Decoupled.scala 40:37]
  wire [7:0] _T_10 = wr_cnt + 8'h1; // @[DME.scala 177:22]
  wire  _T_11 = 2'h0 == wstate; // @[Conditional.scala 37:30]
  wire  _T_12 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  wire  _T_13 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  wire  _T_14 = io_dme_wr_0_data_valid & io_mem_w_ready; // @[DME.scala 193:45]
  wire  _T_15 = wr_cnt == 8'h0; // @[DME.scala 193:73]
  wire  _T_16 = _T_14 & _T_15; // @[DME.scala 193:63]
  wire  _T_17 = 2'h3 == wstate; // @[Conditional.scala 37:30]
  reg [63:0] rd_addr; // @[Reg.scala 27:20]
  reg [63:0] wr_addr; // @[Reg.scala 27:20]
  wire  _T_30 = wstate == 2'h2; // @[DME.scala 222:67]
  wire  _T_39 = rstate == 2'h2; // @[DME.scala 240:28]
  Arbiter rd_arb ( // @[DME.scala 130:22]
    .io_in_0_ready(rd_arb_io_in_0_ready),
    .io_in_0_valid(rd_arb_io_in_0_valid),
    .io_in_0_bits_addr(rd_arb_io_in_0_bits_addr),
    .io_out_ready(rd_arb_io_out_ready),
    .io_out_valid(rd_arb_io_out_valid),
    .io_out_bits_addr(rd_arb_io_out_bits_addr)
  );
  Arbiter wr_arb ( // @[DME.scala 160:22]
    .io_in_0_ready(wr_arb_io_in_0_ready),
    .io_in_0_valid(wr_arb_io_in_0_valid),
    .io_in_0_bits_addr(wr_arb_io_in_0_bits_addr),
    .io_out_ready(wr_arb_io_out_ready),
    .io_out_valid(wr_arb_io_out_valid),
    .io_out_bits_addr(wr_arb_io_out_bits_addr)
  );
  assign io_mem_aw_valid = wstate == 2'h1; // @[DME.scala 226:19]
  assign io_mem_aw_bits_addr = wr_addr; // @[DME.scala 227:23]
  assign io_mem_w_valid = _T_30 & io_dme_wr_0_data_valid; // @[DME.scala 230:18]
  assign io_mem_w_bits_data = io_dme_wr_0_data_bits; // @[DME.scala 231:22]
  assign io_mem_w_bits_last = wr_cnt == 8'h0; // @[DME.scala 232:22]
  assign io_mem_b_ready = wstate == 2'h3; // @[DME.scala 234:18]
  assign io_mem_ar_valid = rstate == 2'h1; // @[DME.scala 236:19]
  assign io_mem_ar_bits_addr = rd_addr; // @[DME.scala 237:23]
  assign io_mem_r_ready = _T_39 & io_dme_rd_0_data_ready; // @[DME.scala 240:18]
  assign io_dme_rd_0_cmd_ready = rd_arb_io_in_0_ready; // @[DME.scala 134:21]
  assign io_dme_rd_0_data_valid = io_mem_r_valid; // @[DME.scala 215:29]
  assign io_dme_rd_0_data_bits = io_mem_r_bits_data; // @[DME.scala 216:28]
  assign io_dme_wr_0_cmd_ready = wr_arb_io_in_0_ready; // @[DME.scala 164:21]
  assign io_dme_wr_0_data_ready = _T_30 & io_mem_w_ready; // @[DME.scala 222:29]
  assign io_dme_wr_0_ack = io_mem_b_ready & io_mem_b_valid; // @[DME.scala 221:22]
  assign rd_arb_io_in_0_valid = io_dme_rd_0_cmd_valid; // @[DME.scala 134:21]
  assign rd_arb_io_in_0_bits_addr = 64'h0; // @[DME.scala 134:21]
  assign rd_arb_io_out_ready = rstate == 2'h0; // @[DME.scala 210:23]
  assign wr_arb_io_in_0_valid = io_dme_wr_0_cmd_valid; // @[DME.scala 164:21]
  assign wr_arb_io_in_0_bits_addr = io_dme_wr_0_cmd_bits_addr; // @[DME.scala 164:21]
  assign wr_arb_io_out_ready = wstate == 2'h0; // @[DME.scala 211:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rstate = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  wstate = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  wr_cnt = _RAND_2[7:0];
  _RAND_3 = {2{`RANDOM}};
  rd_addr = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  wr_addr = _RAND_4[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      rstate <= 2'h0;
    end else if (_T_1) begin
      if (rd_arb_io_out_valid) begin
        rstate <= 2'h1;
      end
    end else if (_T_2) begin
      if (io_mem_ar_ready) begin
        rstate <= 2'h2;
      end
    end else if (_T_3) begin
      if (_T_5) begin
        rstate <= 2'h0;
      end
    end
    if (reset) begin
      wstate <= 2'h0;
    end else if (_T_11) begin
      if (wr_arb_io_out_valid) begin
        wstate <= 2'h1;
      end
    end else if (_T_12) begin
      if (io_mem_aw_ready) begin
        wstate <= 2'h2;
      end
    end else if (_T_13) begin
      if (_T_16) begin
        wstate <= 2'h3;
      end
    end else if (_T_17) begin
      if (io_mem_b_valid) begin
        wstate <= 2'h0;
      end
    end
    if (reset) begin
      wr_cnt <= 8'h0;
    end else if (_T_7) begin
      wr_cnt <= 8'h0;
    end else if (_T_8) begin
      wr_cnt <= _T_10;
    end
    if (reset) begin
      rd_addr <= 64'h0;
    end else if (_T) begin
      rd_addr <= rd_arb_io_out_bits_addr;
    end
    if (reset) begin
      wr_addr <= 64'h0;
    end else if (_T_6) begin
      wr_addr <= wr_arb_io_out_bits_addr;
    end
  end
endmodule
module DMECache(
  input          clock,
  input          reset,
  input          io_cpu_flush,
  output         io_cpu_flush_done,
  input          io_mem_rd_cmd_ready,
  output         io_mem_rd_cmd_valid,
  output         io_mem_rd_data_ready,
  input          io_mem_rd_data_valid,
  input  [511:0] io_mem_rd_data_bits,
  input          io_mem_wr_cmd_ready,
  output         io_mem_wr_cmd_valid,
  output [63:0]  io_mem_wr_cmd_bits_addr,
  input          io_mem_wr_data_ready,
  output         io_mem_wr_data_valid,
  output [511:0] io_mem_wr_data_bits,
  input          io_mem_wr_ack
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [255:0] _RAND_6;
  reg [255:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [511:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [50:0] metaMem_tag [0:255]; // @[AXICache.scala 720:28]
  wire [50:0] metaMem_tag_rmeta_data; // @[AXICache.scala 720:28]
  wire [7:0] metaMem_tag_rmeta_addr; // @[AXICache.scala 720:28]
  wire [50:0] metaMem_tag__T_238_data; // @[AXICache.scala 720:28]
  wire [7:0] metaMem_tag__T_238_addr; // @[AXICache.scala 720:28]
  wire [50:0] metaMem_tag__T_145_data; // @[AXICache.scala 720:28]
  wire [7:0] metaMem_tag__T_145_addr; // @[AXICache.scala 720:28]
  wire  metaMem_tag__T_145_mask; // @[AXICache.scala 720:28]
  wire  metaMem_tag__T_145_en; // @[AXICache.scala 720:28]
  reg  metaMem_tag__T_238_en_pipe_0;
  reg [7:0] metaMem_tag__T_238_addr_pipe_0;
  reg [2:0] state; // @[AXICache.scala 711:22]
  reg [2:0] flush_state; // @[AXICache.scala 714:28]
  reg  flush_mode; // @[AXICache.scala 715:27]
  reg [255:0] v; // @[AXICache.scala 718:18]
  reg [255:0] d; // @[AXICache.scala 719:18]
  wire  read_wrap_out = io_mem_rd_data_ready & io_mem_rd_data_valid; // @[Decoupled.scala 40:37]
  wire  write_wrap_out = io_mem_wr_data_ready & io_mem_wr_data_valid; // @[Decoupled.scala 40:37]
  wire  _T_2 = flush_state == 3'h1; // @[AXICache.scala 734:51]
  reg [7:0] set_count; // @[Counter.scala 29:33]
  wire  _T_3 = set_count == 8'hff; // @[Counter.scala 38:24]
  wire [7:0] _T_5 = set_count + 8'h1; // @[Counter.scala 39:22]
  wire  set_wrap = _T_2 & _T_3; // @[Counter.scala 67:17]
  wire [7:0] _T_7 = set_count - 8'h1; // @[AXICache.scala 735:62]
  reg [50:0] block_rmeta_tag; // @[AXICache.scala 736:24]
  wire  is_write = state == 3'h2; // @[AXICache.scala 742:24]
  wire  _T_48 = state == 3'h6; // @[AXICache.scala 743:24]
  wire  is_alloc = _T_48 & read_wrap_out; // @[AXICache.scala 743:37]
  reg  is_alloc_reg; // @[AXICache.scala 744:29]
  wire  _T_108 = metaMem_tag_rmeta_data == 51'h0; // @[AXICache.scala 763:34]
  wire  hit = v[0] & _T_108; // @[AXICache.scala 763:21]
  wire  _T_49 = hit | is_alloc_reg; // @[AXICache.scala 747:30]
  wire  _T_50 = is_write & _T_49; // @[AXICache.scala 747:22]
  wire  wen = _T_50 | is_alloc; // @[AXICache.scala 747:64]
  reg [511:0] refill_buf_0; // @[AXICache.scala 760:23]
  wire  _T_125 = ~is_alloc; // @[AXICache.scala 788:19]
  wire [255:0] _T_133 = v | 256'h1; // @[AXICache.scala 793:18]
  wire [255:0] _T_140 = d | 256'h1; // @[AXICache.scala 794:18]
  wire [255:0] _T_141 = ~d; // @[AXICache.scala 794:18]
  wire [255:0] _T_142 = _T_141 | 256'h1; // @[AXICache.scala 794:18]
  wire [255:0] _T_143 = ~_T_142; // @[AXICache.scala 794:18]
  wire [255:0] _T_226 = v >> set_count; // @[AXICache.scala 823:25]
  wire [255:0] _T_228 = d >> set_count; // @[AXICache.scala 823:41]
  wire  is_block_dirty = _T_226[0] & _T_228[0]; // @[AXICache.scala 823:37]
  wire [58:0] _T_232 = {block_rmeta_tag,_T_7}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_238 = {_T_232, 5'h0}; // @[AXICache.scala 824:58]
  wire [65:0] block_addr = {{2'd0}, _GEN_238}; // @[AXICache.scala 824:58]
  wire [58:0] _T_239 = {metaMem_tag_rmeta_data,8'h0}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_239 = {_T_239, 5'h0}; // @[AXICache.scala 835:82]
  wire [65:0] _T_240 = {{2'd0}, _GEN_239}; // @[AXICache.scala 835:82]
  wire [65:0] _T_241 = flush_mode ? block_addr : _T_240; // @[AXICache.scala 835:33]
  wire  is_dirty = v[0] & d[0]; // @[AXICache.scala 851:29]
  wire  _T_248 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_251 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_254 = ~is_dirty; // @[AXICache.scala 867:32]
  wire  _T_255 = io_mem_wr_cmd_ready & io_mem_wr_cmd_valid; // @[Decoupled.scala 40:37]
  wire  _T_256 = io_mem_rd_cmd_ready & io_mem_rd_cmd_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_175 = hit ? 1'h0 : is_dirty; // @[AXICache.scala 859:17]
  wire  _GEN_176 = hit ? 1'h0 : _T_254; // @[AXICache.scala 859:17]
  wire  _T_257 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _GEN_180 = _T_49 ? 1'h0 : is_dirty; // @[AXICache.scala 876:49]
  wire  _GEN_181 = _T_49 ? 1'h0 : _T_254; // @[AXICache.scala 876:49]
  wire  _T_263 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire  _T_264 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_265 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_267 = 3'h6 == state; // @[Conditional.scala 37:30]
  wire  _GEN_190 = _T_264 ? 1'h0 : _T_265; // @[Conditional.scala 39:67]
  wire  _GEN_193 = _T_263 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_257 & _GEN_180; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_257 ? _GEN_181 : _GEN_193; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_257 ? 1'h0 : _T_263; // @[Conditional.scala 39:67]
  wire  _GEN_199 = _T_251 ? _GEN_175 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_251 ? _GEN_176 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_201 = _T_251 ? 1'h0 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_203 = _T_248 ? 1'h0 : _GEN_199; // @[Conditional.scala 40:58]
  wire  _GEN_204 = _T_248 ? 1'h0 : _GEN_200; // @[Conditional.scala 40:58]
  wire  _GEN_205 = _T_248 ? 1'h0 : _GEN_201; // @[Conditional.scala 40:58]
  wire  _T_270 = 3'h0 == flush_state; // @[Conditional.scala 37:30]
  wire  _GEN_207 = io_cpu_flush | flush_mode; // @[AXICache.scala 915:26]
  wire  _T_271 = 3'h1 == flush_state; // @[Conditional.scala 37:30]
  wire  _T_272 = 3'h2 == flush_state; // @[Conditional.scala 37:30]
  wire  _T_273 = 3'h3 == flush_state; // @[Conditional.scala 37:30]
  wire  _T_275 = 3'h4 == flush_state; // @[Conditional.scala 37:30]
  wire  _T_276 = 3'h5 == flush_state; // @[Conditional.scala 37:30]
  wire  _GEN_216 = _T_275 | _GEN_205; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_273 | _GEN_203; // @[Conditional.scala 39:67]
  wire  _GEN_219 = _T_273 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  _GEN_221 = _T_273 ? _GEN_205 : _GEN_216; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_272 ? _GEN_203 : _GEN_218; // @[Conditional.scala 39:67]
  wire  _GEN_224 = _T_272 ? _GEN_204 : _GEN_219; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_272 ? _GEN_205 : _GEN_221; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_271 & set_wrap; // @[Conditional.scala 39:67]
  wire  _GEN_229 = _T_271 ? _GEN_203 : _GEN_223; // @[Conditional.scala 39:67]
  wire  _GEN_230 = _T_271 ? _GEN_204 : _GEN_224; // @[Conditional.scala 39:67]
  wire  _GEN_231 = _T_271 ? _GEN_205 : _GEN_225; // @[Conditional.scala 39:67]
  assign metaMem_tag_rmeta_addr = 8'h0;
  assign metaMem_tag_rmeta_data = metaMem_tag[metaMem_tag_rmeta_addr]; // @[AXICache.scala 720:28]
  assign metaMem_tag__T_238_addr = metaMem_tag__T_238_addr_pipe_0;
  assign metaMem_tag__T_238_data = metaMem_tag[metaMem_tag__T_238_addr]; // @[AXICache.scala 720:28]
  assign metaMem_tag__T_145_data = 51'h0;
  assign metaMem_tag__T_145_addr = 8'h0;
  assign metaMem_tag__T_145_mask = 1'h1;
  assign metaMem_tag__T_145_en = wen & is_alloc;
  assign io_cpu_flush_done = _T_270 ? 1'h0 : _GEN_226; // @[AXICache.scala 848:21 AXICache.scala 922:27]
  assign io_mem_rd_cmd_valid = _T_270 ? _GEN_204 : _GEN_230; // @[AXICache.scala 814:23 AXICache.scala 867:29 AXICache.scala 880:29 AXICache.scala 900:27 AXICache.scala 954:27]
  assign io_mem_rd_data_ready = state == 3'h6; // @[AXICache.scala 817:24]
  assign io_mem_wr_cmd_valid = _T_270 ? _GEN_203 : _GEN_229; // @[AXICache.scala 837:23 AXICache.scala 866:29 AXICache.scala 879:29 AXICache.scala 953:27]
  assign io_mem_wr_cmd_bits_addr = _T_241[63:0]; // @[AXICache.scala 835:27]
  assign io_mem_wr_data_valid = _T_270 ? _GEN_205 : _GEN_231; // @[AXICache.scala 845:24 AXICache.scala 889:28 AXICache.scala 964:28]
  assign io_mem_wr_data_bits = is_alloc_reg ? refill_buf_0 : 512'h0; // @[AXICache.scala 844:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaMem_tag[initvar] = _RAND_0[50:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  metaMem_tag__T_238_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  metaMem_tag__T_238_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  flush_state = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  flush_mode = _RAND_5[0:0];
  _RAND_6 = {8{`RANDOM}};
  v = _RAND_6[255:0];
  _RAND_7 = {8{`RANDOM}};
  d = _RAND_7[255:0];
  _RAND_8 = {1{`RANDOM}};
  set_count = _RAND_8[7:0];
  _RAND_9 = {2{`RANDOM}};
  block_rmeta_tag = _RAND_9[50:0];
  _RAND_10 = {1{`RANDOM}};
  is_alloc_reg = _RAND_10[0:0];
  _RAND_11 = {16{`RANDOM}};
  refill_buf_0 = _RAND_11[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(metaMem_tag__T_145_en & metaMem_tag__T_145_mask) begin
      metaMem_tag[metaMem_tag__T_145_addr] <= metaMem_tag__T_145_data; // @[AXICache.scala 720:28]
    end
    metaMem_tag__T_238_en_pipe_0 <= is_block_dirty & _T_2;
    if (is_block_dirty & _T_2) begin
      metaMem_tag__T_238_addr_pipe_0 <= set_count;
    end
    if (reset) begin
      state <= 3'h0;
    end else if (!(_T_248)) begin
      if (_T_251) begin
        if (hit) begin
          state <= 3'h0;
        end else if (_T_255) begin
          state <= 3'h3;
        end else if (_T_256) begin
          state <= 3'h6;
        end
      end else if (_T_257) begin
        if (_T_49) begin
          state <= 3'h0;
        end else if (_T_255) begin
          state <= 3'h3;
        end else if (_T_256) begin
          state <= 3'h6;
        end
      end else if (_T_263) begin
        if (write_wrap_out) begin
          state <= 3'h4;
        end
      end else if (_T_264) begin
        if (io_mem_wr_ack) begin
          state <= 3'h5;
        end
      end else if (_T_265) begin
        if (_T_256) begin
          state <= 3'h6;
        end
      end else if (_T_267) begin
        if (read_wrap_out) begin
          state <= 3'h0;
        end
      end
    end
    if (reset) begin
      flush_state <= 3'h0;
    end else if (_T_270) begin
      if (io_cpu_flush) begin
        flush_state <= 3'h1;
      end
    end else if (_T_271) begin
      if (set_wrap) begin
        flush_state <= 3'h0;
      end else if (is_block_dirty) begin
        flush_state <= 3'h2;
      end
    end else if (_T_272) begin
      flush_state <= 3'h3;
    end else if (_T_273) begin
      if (_T_255) begin
        flush_state <= 3'h4;
      end
    end else if (_T_275) begin
      if (write_wrap_out) begin
        flush_state <= 3'h5;
      end
    end else if (_T_276) begin
      if (io_mem_wr_ack) begin
        flush_state <= 3'h1;
      end
    end
    if (reset) begin
      flush_mode <= 1'h0;
    end else if (_T_270) begin
      flush_mode <= _GEN_207;
    end else if (_T_271) begin
      if (set_wrap) begin
        flush_mode <= 1'h0;
      end
    end
    if (reset) begin
      v <= 256'h0;
    end else if (wen) begin
      v <= _T_133;
    end
    if (reset) begin
      d <= 256'h0;
    end else if (wen) begin
      if (_T_125) begin
        d <= _T_140;
      end else begin
        d <= _T_143;
      end
    end
    if (reset) begin
      set_count <= 8'h0;
    end else if (_T_2) begin
      set_count <= _T_5;
    end
    block_rmeta_tag <= metaMem_tag__T_238_data;
    is_alloc_reg <= _T_48 & read_wrap_out;
    if (read_wrap_out) begin
      refill_buf_0 <= io_mem_rd_data_bits;
    end
  end
endmodule
module SplitCallDCR(
  input         clock,
  input         reset,
  output        io_In_ready,
  input         io_In_valid,
  input  [63:0] io_In_bits_dataVals_field1_data,
  input  [63:0] io_In_bits_dataVals_field0_data,
  input         io_Out_enable_ready,
  output        io_Out_enable_valid,
  output        io_Out_enable_bits_control,
  input         io_Out_dataVals_field1_0_ready,
  output        io_Out_dataVals_field1_0_valid,
  output [63:0] io_Out_dataVals_field1_0_bits_data,
  input         io_Out_dataVals_field0_0_ready,
  output        io_Out_dataVals_field0_0_valid,
  output [63:0] io_Out_dataVals_field0_0_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  inputReg_enable_control; // @[SplitDecoupled.scala 220:26]
  reg [63:0] inputReg_dataVals_field1_data; // @[SplitDecoupled.scala 220:26]
  reg [63:0] inputReg_dataVals_field0_data; // @[SplitDecoupled.scala 220:26]
  reg  enableValidReg; // @[SplitDecoupled.scala 222:31]
  reg  outputValsValidReg_0_0; // @[SplitDecoupled.scala 230:53]
  reg  outputValsValidReg_1_0; // @[SplitDecoupled.scala 230:53]
  reg  state; // @[SplitDecoupled.scala 260:22]
  wire  _T_1 = ~state; // @[SplitDecoupled.scala 262:24]
  wire  _T_3 = io_In_ready & io_In_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_0 = _T_3 | state; // @[SplitDecoupled.scala 266:27]
  wire  _GEN_2 = _T_3 | inputReg_enable_control; // @[SplitDecoupled.scala 266:27]
  wire  _T_5 = outputValsValidReg_0_0 & outputValsValidReg_1_0; // @[SplitDecoupled.scala 254:31]
  wire  _T_6 = ~_T_5; // @[SplitDecoupled.scala 254:7]
  wire  _T_8 = ~enableValidReg; // @[SplitDecoupled.scala 272:43]
  wire  _T_9 = _T_6 & _T_8; // @[SplitDecoupled.scala 272:40]
  wire  _T_11 = io_In_valid & _T_1; // @[SplitDecoupled.scala 293:24]
  wire  _GEN_22 = _T_11 | outputValsValidReg_0_0; // @[SplitDecoupled.scala 293:45]
  wire  _T_13 = state & io_Out_dataVals_field0_0_ready; // @[SplitDecoupled.scala 296:32]
  wire  _GEN_24 = _T_11 | outputValsValidReg_1_0; // @[SplitDecoupled.scala 293:45]
  wire  _T_17 = state & io_Out_dataVals_field1_0_ready; // @[SplitDecoupled.scala 296:32]
  wire  _GEN_26 = _T_11 | enableValidReg; // @[SplitDecoupled.scala 305:41]
  wire  _T_21 = state & io_Out_enable_ready; // @[SplitDecoupled.scala 308:28]
  assign io_In_ready = ~state; // @[SplitDecoupled.scala 262:15]
  assign io_Out_enable_valid = enableValidReg; // @[SplitDecoupled.scala 312:23]
  assign io_Out_enable_bits_control = inputReg_enable_control; // @[SplitDecoupled.scala 313:22]
  assign io_Out_dataVals_field1_0_valid = outputValsValidReg_1_0; // @[SplitDecoupled.scala 299:44]
  assign io_Out_dataVals_field1_0_bits_data = inputReg_dataVals_field1_data; // @[SplitDecoupled.scala 300:43]
  assign io_Out_dataVals_field0_0_valid = outputValsValidReg_0_0; // @[SplitDecoupled.scala 299:44]
  assign io_Out_dataVals_field0_0_bits_data = inputReg_dataVals_field0_data; // @[SplitDecoupled.scala 300:43]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inputReg_enable_control = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  inputReg_dataVals_field1_data = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  inputReg_dataVals_field0_data = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  enableValidReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  outputValsValidReg_0_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  outputValsValidReg_1_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      inputReg_enable_control <= 1'h0;
    end else if (_T_1) begin
      inputReg_enable_control <= _GEN_2;
    end
    if (reset) begin
      inputReg_dataVals_field1_data <= 64'h0;
    end else if (_T_1) begin
      if (_T_3) begin
        inputReg_dataVals_field1_data <= io_In_bits_dataVals_field1_data;
      end
    end
    if (reset) begin
      inputReg_dataVals_field0_data <= 64'h0;
    end else if (_T_1) begin
      if (_T_3) begin
        inputReg_dataVals_field0_data <= io_In_bits_dataVals_field0_data;
      end
    end
    if (reset) begin
      enableValidReg <= 1'h0;
    end else if (_T_21) begin
      enableValidReg <= 1'h0;
    end else begin
      enableValidReg <= _GEN_26;
    end
    if (reset) begin
      outputValsValidReg_0_0 <= 1'h0;
    end else if (_T_13) begin
      outputValsValidReg_0_0 <= 1'h0;
    end else begin
      outputValsValidReg_0_0 <= _GEN_22;
    end
    if (reset) begin
      outputValsValidReg_1_0 <= 1'h0;
    end else if (_T_17) begin
      outputValsValidReg_1_0 <= 1'h0;
    end else begin
      outputValsValidReg_1_0 <= _GEN_24;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_1) begin
      state <= _GEN_0;
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
  end
endmodule
module BasicBlockNoMaskFastNode(
  input   clock,
  input   reset,
  output  io_predicateIn_0_ready,
  input   io_predicateIn_0_valid,
  input   io_predicateIn_0_bits_control,
  input   io_Out_0_ready,
  output  io_Out_0_valid,
  output  io_Out_0_bits_control,
  input   io_Out_1_ready,
  output  io_Out_1_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  wire [14:0] _T_3 = cycleCount + 15'h1; // @[Counter.scala 39:22]
  reg  in_data_R_0_control; // @[BasicBlock.scala 224:46]
  reg  in_data_valid_R_0; // @[BasicBlock.scala 225:52]
  reg  output_valid_R_0; // @[BasicBlock.scala 228:49]
  reg  output_valid_R_1; // @[BasicBlock.scala 228:49]
  reg  output_fire_R_0; // @[BasicBlock.scala 229:48]
  reg  output_fire_R_1; // @[BasicBlock.scala 229:48]
  wire  _T_7 = io_predicateIn_0_ready & io_predicateIn_0_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_3 = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 234:36]
  wire  _GEN_5 = _T_7 | in_data_valid_R_0; // @[BasicBlock.scala 234:36]
  wire  _T_8 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_6 = _T_8 | output_fire_R_0; // @[BasicBlock.scala 246:28]
  wire  _T_9 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_8 = _T_9 | output_fire_R_1; // @[BasicBlock.scala 246:28]
  wire  out_fire_mask_0 = output_fire_R_0 | _T_8; // @[BasicBlock.scala 258:85]
  wire  out_fire_mask_1 = output_fire_R_1 | _T_9; // @[BasicBlock.scala 258:85]
  reg  state; // @[BasicBlock.scala 289:22]
  wire  _T_18 = ~state; // @[Conditional.scala 37:30]
  wire  _T_21 = _T_8 ^ 1'h1; // @[BasicBlock.scala 306:81]
  wire  _T_22 = _T_9 ^ 1'h1; // @[BasicBlock.scala 306:81]
  wire  _T_24 = ~reset; // @[BasicBlock.scala 311:17]
  wire  _GEN_10 = _GEN_5 | output_valid_R_0; // @[BasicBlock.scala 301:9]
  wire  _GEN_11 = _GEN_5 | output_valid_R_1; // @[BasicBlock.scala 301:9]
  wire  _GEN_14 = _GEN_5 | state; // @[BasicBlock.scala 301:9]
  wire  _T_26 = out_fire_mask_0 & out_fire_mask_1; // @[BasicBlock.scala 317:35]
  wire  _GEN_40 = _T_18 & _GEN_5; // @[BasicBlock.scala 311:17]
  assign io_predicateIn_0_ready = ~in_data_valid_R_0; // @[BasicBlock.scala 233:29]
  assign io_Out_0_valid = _T_18 ? _GEN_10 : output_valid_R_0; // @[BasicBlock.scala 284:21 BasicBlock.scala 303:34]
  assign io_Out_0_bits_control = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 279:22]
  assign io_Out_1_valid = _T_18 ? _GEN_11 : output_valid_R_1; // @[BasicBlock.scala 284:21 BasicBlock.scala 303:34]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cycleCount = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  in_data_R_0_control = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  output_valid_R_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  output_valid_R_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  output_fire_R_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  output_fire_R_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_3;
    end
    if (reset) begin
      in_data_R_0_control <= 1'h0;
    end else if (_T_18) begin
      if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (state) begin
      if (_T_26) begin
        in_data_R_0_control <= 1'h0;
      end else if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (_T_7) begin
      in_data_R_0_control <= io_predicateIn_0_bits_control;
    end
    if (reset) begin
      in_data_valid_R_0 <= 1'h0;
    end else if (_T_18) begin
      in_data_valid_R_0 <= _GEN_5;
    end else if (state) begin
      if (_T_26) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_5;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_5;
    end
    if (reset) begin
      output_valid_R_0 <= 1'h0;
    end else if (_T_18) begin
      if (_GEN_5) begin
        output_valid_R_0 <= _T_21;
      end else if (_T_8) begin
        output_valid_R_0 <= 1'h0;
      end
    end else if (_T_8) begin
      output_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      output_valid_R_1 <= 1'h0;
    end else if (_T_18) begin
      if (_GEN_5) begin
        output_valid_R_1 <= _T_22;
      end else if (_T_9) begin
        output_valid_R_1 <= 1'h0;
      end
    end else if (_T_9) begin
      output_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      output_fire_R_0 <= 1'h0;
    end else if (_T_18) begin
      output_fire_R_0 <= _GEN_6;
    end else if (state) begin
      if (_T_26) begin
        output_fire_R_0 <= 1'h0;
      end else begin
        output_fire_R_0 <= _GEN_6;
      end
    end else begin
      output_fire_R_0 <= _GEN_6;
    end
    if (reset) begin
      output_fire_R_1 <= 1'h0;
    end else if (_T_18) begin
      output_fire_R_1 <= _GEN_8;
    end else if (state) begin
      if (_T_26) begin
        output_fire_R_1 <= 1'h0;
      end else begin
        output_fire_R_1 <= _GEN_8;
      end
    end else begin
      output_fire_R_1 <= _GEN_8;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_18) begin
      state <= _GEN_14;
    end else if (state) begin
      if (_T_26) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_40 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID: %d] [BB] [bb_entry0] [Out: %d] [Cycle: %d]\n",5'h0,_GEN_3,cycleCount); // @[BasicBlock.scala 311:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UALU(
  input  [63:0] io_in1,
  input  [63:0] io_in2,
  output [63:0] io_out
);
  wire [127:0] _T_24 = io_in1 * io_in2; // @[Alu.scala 194:32]
  assign io_out = _T_24[63:0]; // @[Alu.scala 235:10]
endmodule
module ComputeNode(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [63:0] io_Out_0_bits_data,
  output        io_LeftIO_ready,
  input         io_LeftIO_valid,
  input  [63:0] io_LeftIO_bits_data,
  output        io_RightIO_ready,
  input         io_RightIO_valid,
  input  [63:0] io_RightIO_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] FU_io_in1; // @[ComputeNode.scala 61:18]
  wire [63:0] FU_io_in2; // @[ComputeNode.scala 61:18]
  wire [63:0] FU_io_out; // @[ComputeNode.scala 61:18]
  reg  enable_R_control; // @[HandShaking.scala 181:31]
  reg  enable_valid_R; // @[HandShaking.scala 182:31]
  reg  out_ready_R_0; // @[HandShaking.scala 185:46]
  reg  out_valid_R_0; // @[HandShaking.scala 186:46]
  wire  _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  wire  _T_3 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  wire [14:0] _T_7 = cycleCount + 15'h1; // @[Counter.scala 39:22]
  reg [63:0] left_R_data; // @[ComputeNode.scala 53:23]
  reg  left_valid_R; // @[ComputeNode.scala 54:29]
  reg [63:0] right_R_data; // @[ComputeNode.scala 57:24]
  reg  right_valid_R; // @[ComputeNode.scala 58:30]
  reg  state; // @[ComputeNode.scala 64:22]
  reg [63:0] out_data_R; // @[ComputeNode.scala 89:27]
  wire  _T_12 = io_LeftIO_ready & io_LeftIO_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_11 = _T_12 | left_valid_R; // @[ComputeNode.scala 105:26]
  wire  _T_14 = io_RightIO_ready & io_RightIO_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_15 = _T_14 | right_valid_R; // @[ComputeNode.scala 111:27]
  wire  _T_22 = ~state; // @[ComputeNode.scala 75:67]
  wire  _T_27 = enable_valid_R & left_valid_R; // @[ComputeNode.scala 144:27]
  wire  _T_28 = _T_27 & right_valid_R; // @[ComputeNode.scala 144:43]
  wire  _T_32 = _T_1 ^ 1'h1; // @[HandShaking.scala 274:72]
  wire  _T_34 = ~reset; // @[ComputeNode.scala 174:17]
  wire [63:0] _T_30_data = FU_io_out; // @[interfaces.scala 289:20 interfaces.scala 290:15]
  wire [63:0] _GEN_17 = _T_28 ? _T_30_data : out_data_R; // @[ComputeNode.scala 144:81]
  wire  _GEN_20 = _T_28 | out_valid_R_0; // @[ComputeNode.scala 144:81]
  wire  _GEN_24 = _T_28 | state; // @[ComputeNode.scala 144:81]
  wire  _T_37 = out_ready_R_0 | _T_1; // @[HandShaking.scala 251:83]
  wire  _GEN_47 = _T_22 & _T_28; // @[ComputeNode.scala 174:17]
  UALU FU ( // @[ComputeNode.scala 61:18]
    .io_in1(FU_io_in1),
    .io_in2(FU_io_in2),
    .io_out(FU_io_out)
  );
  assign io_enable_ready = ~enable_valid_R; // @[HandShaking.scala 205:19]
  assign io_Out_0_valid = _T_22 ? _GEN_20 : out_valid_R_0; // @[HandShaking.scala 194:21 ComputeNode.scala 168:32]
  assign io_Out_0_bits_data = _T_22 ? _GEN_17 : out_data_R; // @[ComputeNode.scala 137:25 ComputeNode.scala 166:33]
  assign io_LeftIO_ready = ~left_valid_R; // @[ComputeNode.scala 104:19]
  assign io_RightIO_ready = ~right_valid_R; // @[ComputeNode.scala 110:20]
  assign FU_io_in1 = left_R_data; // @[ComputeNode.scala 101:13]
  assign FU_io_in2 = right_R_data; // @[ComputeNode.scala 102:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  enable_R_control = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  enable_valid_R = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cycleCount = _RAND_4[14:0];
  _RAND_5 = {2{`RANDOM}};
  left_R_data = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  left_valid_R = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  right_R_data = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  right_valid_R = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  out_data_R = _RAND_10[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_3) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_22) begin
      if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_37) begin
        enable_valid_R <= 1'h0;
      end else if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_3) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_22) begin
      if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_37) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_1) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_22) begin
      if (_T_28) begin
        out_valid_R_0 <= _T_32;
      end else if (_T_1) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_1) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_7;
    end
    if (reset) begin
      left_R_data <= 64'h0;
    end else if (_T_12) begin
      left_R_data <= io_LeftIO_bits_data;
    end
    if (reset) begin
      left_valid_R <= 1'h0;
    end else if (_T_22) begin
      if (_T_28) begin
        left_valid_R <= 1'h0;
      end else begin
        left_valid_R <= _GEN_11;
      end
    end else begin
      left_valid_R <= _GEN_11;
    end
    if (reset) begin
      right_R_data <= 64'h0;
    end else if (_T_14) begin
      right_R_data <= io_RightIO_bits_data;
    end
    if (reset) begin
      right_valid_R <= 1'h0;
    end else if (_T_22) begin
      if (_T_28) begin
        right_valid_R <= 1'h0;
      end else begin
        right_valid_R <= _GEN_15;
      end
    end else begin
      right_valid_R <= _GEN_15;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_22) begin
      state <= _GEN_24;
    end else if (state) begin
      if (_T_37) begin
        state <= 1'h0;
      end
    end
    if (reset) begin
      out_data_R <= 64'h0;
    end else if (_T_22) begin
      if (enable_R_control) begin
        out_data_R <= FU_io_out;
      end else begin
        out_data_R <= 64'h0;
      end
    end else if (state) begin
      if (_T_37) begin
        out_data_R <= 64'h0;
      end else if (enable_R_control) begin
        out_data_R <= FU_io_out;
      end else begin
        out_data_R <= 64'h0;
      end
    end else if (enable_R_control) begin
      out_data_R <= FU_io_out;
    end else begin
      out_data_R <= 64'h0;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_47 & _T_34) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID: %d] [COMPUTE] [binaryOp_mul0] [Pred: %d] [In(0): 0x%x] [In(1) 0x%x] [Out: 0x%x] [OpCode: mul] [Cycle: %d]\n",5'h0,enable_R_control,left_R_data,right_R_data,FU_io_out,cycleCount); // @[ComputeNode.scala 174:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module RetNode2(
  input         clock,
  input         reset,
  output        io_In_enable_ready,
  input         io_In_enable_valid,
  output        io_In_data_field0_ready,
  input         io_In_data_field0_valid,
  input  [31:0] io_In_data_field0_bits_data,
  input         io_Out_ready,
  output        io_Out_valid,
  output [31:0] io_Out_bits_data_field0_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  wire [14:0] _T_3 = cycleCount + 15'h1; // @[Counter.scala 39:22]
  reg  state; // @[RetNode.scala 141:22]
  reg  enable_valid_R; // @[RetNode.scala 144:31]
  reg  in_data_valid_R_0; // @[RetNode.scala 147:58]
  reg [31:0] output_R_data_field0_data; // @[RetNode.scala 150:25]
  reg  out_ready_R; // @[RetNode.scala 151:28]
  reg  out_valid_R; // @[RetNode.scala 152:28]
  wire  _T_6 = io_In_enable_ready & io_In_enable_valid; // @[Decoupled.scala 40:37]
  wire  _T_8 = io_In_data_field0_ready & io_In_data_field0_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_9 = _T_8 | in_data_valid_R_0; // @[RetNode.scala 172:41]
  wire  _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_12 = _T_9 ? 1'h0 : out_valid_R; // @[RetNode.scala 194:23]
  wire  _T_10 = ~state; // @[Conditional.scala 37:30]
  wire  _GEN_13 = in_data_valid_R_0 | _GEN_12; // @[RetNode.scala 203:27]
  wire  _GEN_14 = in_data_valid_R_0 | state; // @[RetNode.scala 203:27]
  wire  _T_13 = ~reset; // @[RetNode.scala 221:17]
  wire  _GEN_32 = ~_T_10; // @[RetNode.scala 221:17]
  wire  _GEN_33 = _GEN_32 & state; // @[RetNode.scala 221:17]
  wire  _GEN_34 = _GEN_33 & out_ready_R; // @[RetNode.scala 221:17]
  assign io_In_enable_ready = ~enable_valid_R; // @[RetNode.scala 163:22]
  assign io_In_data_field0_ready = ~in_data_valid_R_0; // @[RetNode.scala 171:34]
  assign io_Out_valid = out_valid_R; // @[RetNode.scala 180:16]
  assign io_Out_bits_data_field0_data = output_R_data_field0_data; // @[RetNode.scala 179:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cycleCount = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  output_R_data_field0_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  out_ready_R = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  out_valid_R = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_3;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_10) begin
      if (enable_valid_R) begin
        state <= _GEN_14;
      end
    end else if (state) begin
      if (out_ready_R) begin
        state <= 1'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_10) begin
      if (_T_6) begin
        enable_valid_R <= io_In_enable_valid;
      end
    end else if (state) begin
      if (out_ready_R) begin
        enable_valid_R <= 1'h0;
      end else if (_T_6) begin
        enable_valid_R <= io_In_enable_valid;
      end
    end else if (_T_6) begin
      enable_valid_R <= io_In_enable_valid;
    end
    if (reset) begin
      in_data_valid_R_0 <= 1'h0;
    end else if (_T_10) begin
      in_data_valid_R_0 <= _GEN_9;
    end else if (state) begin
      if (out_ready_R) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_9;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_9;
    end
    if (reset) begin
      output_R_data_field0_data <= 32'h0;
    end else if (_T_8) begin
      output_R_data_field0_data <= io_In_data_field0_bits_data;
    end
    if (reset) begin
      out_ready_R <= 1'h0;
    end else if (_T_10) begin
      if (_T_9) begin
        out_ready_R <= io_Out_ready;
      end
    end else if (state) begin
      if (out_ready_R) begin
        out_ready_R <= 1'h0;
      end else if (_T_9) begin
        out_ready_R <= io_Out_ready;
      end
    end else if (_T_9) begin
      out_ready_R <= io_Out_ready;
    end
    if (reset) begin
      out_valid_R <= 1'h0;
    end else if (_T_10) begin
      if (enable_valid_R) begin
        out_valid_R <= _GEN_13;
      end else if (_T_9) begin
        out_valid_R <= 1'h0;
      end
    end else if (state) begin
      if (out_ready_R) begin
        out_valid_R <= 1'h0;
      end else if (_T_9) begin
        out_valid_R <= 1'h0;
      end
    end else if (_T_9) begin
      out_valid_R <= 1'h0;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_34 & _T_13) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID: %d] [ret_1] [Cycle: %d]\n",5'h0,cycleCount); // @[RetNode.scala 221:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module test01DF(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_dataVals_field1_data,
  input  [63:0] io_in_bits_dataVals_field0_data,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_data_field0_data
);
  wire  ArgSplitter_clock; // @[test01.scala 38:27]
  wire  ArgSplitter_reset; // @[test01.scala 38:27]
  wire  ArgSplitter_io_In_ready; // @[test01.scala 38:27]
  wire  ArgSplitter_io_In_valid; // @[test01.scala 38:27]
  wire [63:0] ArgSplitter_io_In_bits_dataVals_field1_data; // @[test01.scala 38:27]
  wire [63:0] ArgSplitter_io_In_bits_dataVals_field0_data; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_enable_ready; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_enable_valid; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_enable_bits_control; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_dataVals_field1_0_ready; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_dataVals_field1_0_valid; // @[test01.scala 38:27]
  wire [63:0] ArgSplitter_io_Out_dataVals_field1_0_bits_data; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_dataVals_field0_0_ready; // @[test01.scala 38:27]
  wire  ArgSplitter_io_Out_dataVals_field0_0_valid; // @[test01.scala 38:27]
  wire [63:0] ArgSplitter_io_Out_dataVals_field0_0_bits_data; // @[test01.scala 38:27]
  wire  bb_entry0_clock; // @[test01.scala 53:25]
  wire  bb_entry0_reset; // @[test01.scala 53:25]
  wire  bb_entry0_io_predicateIn_0_ready; // @[test01.scala 53:25]
  wire  bb_entry0_io_predicateIn_0_valid; // @[test01.scala 53:25]
  wire  bb_entry0_io_predicateIn_0_bits_control; // @[test01.scala 53:25]
  wire  bb_entry0_io_Out_0_ready; // @[test01.scala 53:25]
  wire  bb_entry0_io_Out_0_valid; // @[test01.scala 53:25]
  wire  bb_entry0_io_Out_0_bits_control; // @[test01.scala 53:25]
  wire  bb_entry0_io_Out_1_ready; // @[test01.scala 53:25]
  wire  bb_entry0_io_Out_1_valid; // @[test01.scala 53:25]
  wire  binaryOp_mul0_clock; // @[test01.scala 62:29]
  wire  binaryOp_mul0_reset; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_enable_ready; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_enable_valid; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_enable_bits_control; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_Out_0_ready; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_Out_0_valid; // @[test01.scala 62:29]
  wire [63:0] binaryOp_mul0_io_Out_0_bits_data; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_LeftIO_ready; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_LeftIO_valid; // @[test01.scala 62:29]
  wire [63:0] binaryOp_mul0_io_LeftIO_bits_data; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_RightIO_ready; // @[test01.scala 62:29]
  wire  binaryOp_mul0_io_RightIO_valid; // @[test01.scala 62:29]
  wire [63:0] binaryOp_mul0_io_RightIO_bits_data; // @[test01.scala 62:29]
  wire  ret_1_clock; // @[test01.scala 65:21]
  wire  ret_1_reset; // @[test01.scala 65:21]
  wire  ret_1_io_In_enable_ready; // @[test01.scala 65:21]
  wire  ret_1_io_In_enable_valid; // @[test01.scala 65:21]
  wire  ret_1_io_In_data_field0_ready; // @[test01.scala 65:21]
  wire  ret_1_io_In_data_field0_valid; // @[test01.scala 65:21]
  wire [31:0] ret_1_io_In_data_field0_bits_data; // @[test01.scala 65:21]
  wire  ret_1_io_Out_ready; // @[test01.scala 65:21]
  wire  ret_1_io_Out_valid; // @[test01.scala 65:21]
  wire [31:0] ret_1_io_Out_bits_data_field0_data; // @[test01.scala 65:21]
  SplitCallDCR ArgSplitter ( // @[test01.scala 38:27]
    .clock(ArgSplitter_clock),
    .reset(ArgSplitter_reset),
    .io_In_ready(ArgSplitter_io_In_ready),
    .io_In_valid(ArgSplitter_io_In_valid),
    .io_In_bits_dataVals_field1_data(ArgSplitter_io_In_bits_dataVals_field1_data),
    .io_In_bits_dataVals_field0_data(ArgSplitter_io_In_bits_dataVals_field0_data),
    .io_Out_enable_ready(ArgSplitter_io_Out_enable_ready),
    .io_Out_enable_valid(ArgSplitter_io_Out_enable_valid),
    .io_Out_enable_bits_control(ArgSplitter_io_Out_enable_bits_control),
    .io_Out_dataVals_field1_0_ready(ArgSplitter_io_Out_dataVals_field1_0_ready),
    .io_Out_dataVals_field1_0_valid(ArgSplitter_io_Out_dataVals_field1_0_valid),
    .io_Out_dataVals_field1_0_bits_data(ArgSplitter_io_Out_dataVals_field1_0_bits_data),
    .io_Out_dataVals_field0_0_ready(ArgSplitter_io_Out_dataVals_field0_0_ready),
    .io_Out_dataVals_field0_0_valid(ArgSplitter_io_Out_dataVals_field0_0_valid),
    .io_Out_dataVals_field0_0_bits_data(ArgSplitter_io_Out_dataVals_field0_0_bits_data)
  );
  BasicBlockNoMaskFastNode bb_entry0 ( // @[test01.scala 53:25]
    .clock(bb_entry0_clock),
    .reset(bb_entry0_reset),
    .io_predicateIn_0_ready(bb_entry0_io_predicateIn_0_ready),
    .io_predicateIn_0_valid(bb_entry0_io_predicateIn_0_valid),
    .io_predicateIn_0_bits_control(bb_entry0_io_predicateIn_0_bits_control),
    .io_Out_0_ready(bb_entry0_io_Out_0_ready),
    .io_Out_0_valid(bb_entry0_io_Out_0_valid),
    .io_Out_0_bits_control(bb_entry0_io_Out_0_bits_control),
    .io_Out_1_ready(bb_entry0_io_Out_1_ready),
    .io_Out_1_valid(bb_entry0_io_Out_1_valid)
  );
  ComputeNode binaryOp_mul0 ( // @[test01.scala 62:29]
    .clock(binaryOp_mul0_clock),
    .reset(binaryOp_mul0_reset),
    .io_enable_ready(binaryOp_mul0_io_enable_ready),
    .io_enable_valid(binaryOp_mul0_io_enable_valid),
    .io_enable_bits_control(binaryOp_mul0_io_enable_bits_control),
    .io_Out_0_ready(binaryOp_mul0_io_Out_0_ready),
    .io_Out_0_valid(binaryOp_mul0_io_Out_0_valid),
    .io_Out_0_bits_data(binaryOp_mul0_io_Out_0_bits_data),
    .io_LeftIO_ready(binaryOp_mul0_io_LeftIO_ready),
    .io_LeftIO_valid(binaryOp_mul0_io_LeftIO_valid),
    .io_LeftIO_bits_data(binaryOp_mul0_io_LeftIO_bits_data),
    .io_RightIO_ready(binaryOp_mul0_io_RightIO_ready),
    .io_RightIO_valid(binaryOp_mul0_io_RightIO_valid),
    .io_RightIO_bits_data(binaryOp_mul0_io_RightIO_bits_data)
  );
  RetNode2 ret_1 ( // @[test01.scala 65:21]
    .clock(ret_1_clock),
    .reset(ret_1_reset),
    .io_In_enable_ready(ret_1_io_In_enable_ready),
    .io_In_enable_valid(ret_1_io_In_enable_valid),
    .io_In_data_field0_ready(ret_1_io_In_data_field0_ready),
    .io_In_data_field0_valid(ret_1_io_In_data_field0_valid),
    .io_In_data_field0_bits_data(ret_1_io_In_data_field0_bits_data),
    .io_Out_ready(ret_1_io_Out_ready),
    .io_Out_valid(ret_1_io_Out_valid),
    .io_Out_bits_data_field0_data(ret_1_io_Out_bits_data_field0_data)
  );
  assign io_in_ready = ArgSplitter_io_In_ready; // @[test01.scala 39:21]
  assign io_out_valid = ret_1_io_Out_valid; // @[test01.scala 195:10]
  assign io_out_bits_data_field0_data = {{32'd0}, ret_1_io_Out_bits_data_field0_data}; // @[test01.scala 195:10]
  assign ArgSplitter_clock = clock;
  assign ArgSplitter_reset = reset;
  assign ArgSplitter_io_In_valid = io_in_valid; // @[test01.scala 39:21]
  assign ArgSplitter_io_In_bits_dataVals_field1_data = io_in_bits_dataVals_field1_data; // @[test01.scala 39:21]
  assign ArgSplitter_io_In_bits_dataVals_field0_data = io_in_bits_dataVals_field0_data; // @[test01.scala 39:21]
  assign ArgSplitter_io_Out_enable_ready = bb_entry0_io_predicateIn_0_ready; // @[test01.scala 79:31]
  assign ArgSplitter_io_Out_dataVals_field1_0_ready = binaryOp_mul0_io_LeftIO_ready; // @[test01.scala 181:27]
  assign ArgSplitter_io_Out_dataVals_field0_0_ready = binaryOp_mul0_io_RightIO_ready; // @[test01.scala 179:28]
  assign bb_entry0_clock = clock;
  assign bb_entry0_reset = reset;
  assign bb_entry0_io_predicateIn_0_valid = ArgSplitter_io_Out_enable_valid; // @[test01.scala 79:31]
  assign bb_entry0_io_predicateIn_0_bits_control = ArgSplitter_io_Out_enable_bits_control; // @[test01.scala 79:31]
  assign bb_entry0_io_Out_0_ready = binaryOp_mul0_io_enable_ready; // @[test01.scala 147:27]
  assign bb_entry0_io_Out_1_ready = ret_1_io_In_enable_ready; // @[test01.scala 150:22]
  assign binaryOp_mul0_clock = clock;
  assign binaryOp_mul0_reset = reset;
  assign binaryOp_mul0_io_enable_valid = bb_entry0_io_Out_0_valid; // @[test01.scala 147:27]
  assign binaryOp_mul0_io_enable_bits_control = bb_entry0_io_Out_0_bits_control; // @[test01.scala 147:27]
  assign binaryOp_mul0_io_Out_0_ready = ret_1_io_In_data_field0_ready; // @[test01.scala 177:30]
  assign binaryOp_mul0_io_LeftIO_valid = ArgSplitter_io_Out_dataVals_field1_0_valid; // @[test01.scala 181:27]
  assign binaryOp_mul0_io_LeftIO_bits_data = ArgSplitter_io_Out_dataVals_field1_0_bits_data; // @[test01.scala 181:27]
  assign binaryOp_mul0_io_RightIO_valid = ArgSplitter_io_Out_dataVals_field0_0_valid; // @[test01.scala 179:28]
  assign binaryOp_mul0_io_RightIO_bits_data = ArgSplitter_io_Out_dataVals_field0_0_bits_data; // @[test01.scala 179:28]
  assign ret_1_clock = clock;
  assign ret_1_reset = reset;
  assign ret_1_io_In_enable_valid = bb_entry0_io_Out_1_valid; // @[test01.scala 150:22]
  assign ret_1_io_In_data_field0_valid = binaryOp_mul0_io_Out_0_valid; // @[test01.scala 177:30]
  assign ret_1_io_In_data_field0_bits_data = binaryOp_mul0_io_Out_0_bits_data[31:0]; // @[test01.scala 177:30]
  assign ret_1_io_Out_ready = io_out_ready; // @[test01.scala 195:10]
endmodule
module test01RootDF(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_dataVals_field1_data,
  input  [63:0] io_in_bits_dataVals_field0_data,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_data_field0_data
);
  wire  test01_clock; // @[test01_root.scala 21:23]
  wire  test01_reset; // @[test01_root.scala 21:23]
  wire  test01_io_in_ready; // @[test01_root.scala 21:23]
  wire  test01_io_in_valid; // @[test01_root.scala 21:23]
  wire [63:0] test01_io_in_bits_dataVals_field1_data; // @[test01_root.scala 21:23]
  wire [63:0] test01_io_in_bits_dataVals_field0_data; // @[test01_root.scala 21:23]
  wire  test01_io_out_ready; // @[test01_root.scala 21:23]
  wire  test01_io_out_valid; // @[test01_root.scala 21:23]
  wire [63:0] test01_io_out_bits_data_field0_data; // @[test01_root.scala 21:23]
  test01DF test01 ( // @[test01_root.scala 21:23]
    .clock(test01_clock),
    .reset(test01_reset),
    .io_in_ready(test01_io_in_ready),
    .io_in_valid(test01_io_in_valid),
    .io_in_bits_dataVals_field1_data(test01_io_in_bits_dataVals_field1_data),
    .io_in_bits_dataVals_field0_data(test01_io_in_bits_dataVals_field0_data),
    .io_out_ready(test01_io_out_ready),
    .io_out_valid(test01_io_out_valid),
    .io_out_bits_data_field0_data(test01_io_out_bits_data_field0_data)
  );
  assign io_in_ready = test01_io_in_ready; // @[test01_root.scala 23:16]
  assign io_out_valid = test01_io_out_valid; // @[test01_root.scala 24:10]
  assign io_out_bits_data_field0_data = test01_io_out_bits_data_field0_data; // @[test01_root.scala 24:10]
  assign test01_clock = clock;
  assign test01_reset = reset;
  assign test01_io_in_valid = io_in_valid; // @[test01_root.scala 23:16]
  assign test01_io_in_bits_dataVals_field1_data = io_in_bits_dataVals_field1_data; // @[test01_root.scala 23:16]
  assign test01_io_in_bits_dataVals_field0_data = io_in_bits_dataVals_field0_data; // @[test01_root.scala 23:16]
  assign test01_io_out_ready = io_out_ready; // @[test01_root.scala 24:10]
endmodule
module DandelionF1DebugShell(
  input          clock,
  input          reset,
  input  [31:0]  io_host_addr,
  input  [31:0]  io_host_wdata,
  input          io_host_wr,
  input          io_host_rd,
  output         io_host_ack,
  output [31:0]  io_host_rdata,
  input          io_mem_aw_ready,
  output         io_mem_aw_valid,
  output [63:0]  io_mem_aw_bits_addr,
  input          io_mem_w_ready,
  output         io_mem_w_valid,
  output [511:0] io_mem_w_bits_data,
  output         io_mem_w_bits_last,
  input          io_mem_b_valid,
  input          io_mem_ar_ready,
  output         io_mem_ar_valid,
  output [63:0]  io_mem_ar_bits_addr,
  output         io_mem_r_ready,
  input          io_mem_r_valid,
  input  [511:0] io_mem_r_bits_data,
  input          io_mem_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  dcr_clock; // @[DandelionShell.scala 1016:19]
  wire  dcr_reset; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_host_addr; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_host_wdata; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_host_wr; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_host_rd; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_host_ack; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_host_rdata; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_dcr_launch; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_dcr_finish; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_dcr_ecnt_0_valid; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_dcr_ecnt_0_bits; // @[DandelionShell.scala 1016:19]
  wire  dcr_io_dcr_ecnt_1_valid; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_dcr_ecnt_1_bits; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_dcr_vals_0; // @[DandelionShell.scala 1016:19]
  wire [31:0] dcr_io_dcr_vals_1; // @[DandelionShell.scala 1016:19]
  wire  dmem_clock; // @[DandelionShell.scala 1017:20]
  wire  dmem_reset; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_aw_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_aw_valid; // @[DandelionShell.scala 1017:20]
  wire [63:0] dmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_w_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_w_valid; // @[DandelionShell.scala 1017:20]
  wire [511:0] dmem_io_mem_w_bits_data; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_w_bits_last; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_b_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_b_valid; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_ar_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_ar_valid; // @[DandelionShell.scala 1017:20]
  wire [63:0] dmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_r_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_r_valid; // @[DandelionShell.scala 1017:20]
  wire [511:0] dmem_io_mem_r_bits_data; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_mem_r_bits_last; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_rd_0_cmd_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_rd_0_cmd_valid; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_rd_0_data_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_rd_0_data_valid; // @[DandelionShell.scala 1017:20]
  wire [511:0] dmem_io_dme_rd_0_data_bits; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_wr_0_cmd_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_wr_0_cmd_valid; // @[DandelionShell.scala 1017:20]
  wire [63:0] dmem_io_dme_wr_0_cmd_bits_addr; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_wr_0_data_ready; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_wr_0_data_valid; // @[DandelionShell.scala 1017:20]
  wire [511:0] dmem_io_dme_wr_0_data_bits; // @[DandelionShell.scala 1017:20]
  wire  dmem_io_dme_wr_0_ack; // @[DandelionShell.scala 1017:20]
  wire  cache_clock; // @[DandelionShell.scala 1018:21]
  wire  cache_reset; // @[DandelionShell.scala 1018:21]
  wire  cache_io_cpu_flush; // @[DandelionShell.scala 1018:21]
  wire  cache_io_cpu_flush_done; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_rd_cmd_ready; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_rd_cmd_valid; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_rd_data_ready; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_rd_data_valid; // @[DandelionShell.scala 1018:21]
  wire [511:0] cache_io_mem_rd_data_bits; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_wr_cmd_ready; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_wr_cmd_valid; // @[DandelionShell.scala 1018:21]
  wire [63:0] cache_io_mem_wr_cmd_bits_addr; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_wr_data_ready; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_wr_data_valid; // @[DandelionShell.scala 1018:21]
  wire [511:0] cache_io_mem_wr_data_bits; // @[DandelionShell.scala 1018:21]
  wire  cache_io_mem_wr_ack; // @[DandelionShell.scala 1018:21]
  wire  accel_clock; // @[DandelionShell.scala 1021:21]
  wire  accel_reset; // @[DandelionShell.scala 1021:21]
  wire  accel_io_in_ready; // @[DandelionShell.scala 1021:21]
  wire  accel_io_in_valid; // @[DandelionShell.scala 1021:21]
  wire [63:0] accel_io_in_bits_dataVals_field1_data; // @[DandelionShell.scala 1021:21]
  wire [63:0] accel_io_in_bits_dataVals_field0_data; // @[DandelionShell.scala 1021:21]
  wire  accel_io_out_ready; // @[DandelionShell.scala 1021:21]
  wire  accel_io_out_valid; // @[DandelionShell.scala 1021:21]
  wire [63:0] accel_io_out_bits_data_field0_data; // @[DandelionShell.scala 1021:21]
  reg [1:0] state; // @[DandelionShell.scala 1042:22]
  reg [31:0] cycles; // @[DandelionShell.scala 1043:23]
  wire  _T = state == 2'h0; // @[DandelionShell.scala 1048:14]
  wire  _T_1 = state != 2'h2; // @[DandelionShell.scala 1050:20]
  wire [31:0] _T_3 = cycles + 32'h1; // @[DandelionShell.scala 1051:22]
  reg [63:0] vals_0; // @[Reg.scala 27:20]
  reg [63:0] vals_1; // @[Reg.scala 27:20]
  wire  _T_9 = state == 2'h2; // @[DandelionShell.scala 1099:31]
  reg  cache_done; // @[DandelionShell.scala 1125:27]
  wire  _GEN_4 = cache_io_cpu_flush_done | cache_done; // @[DandelionShell.scala 1127:35]
  wire  _T_11 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_13 = ~reset; // @[DandelionShell.scala 1135:15]
  wire  _T_22 = accel_io_in_ready & accel_io_in_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_7 = dcr_io_dcr_launch; // @[DandelionShell.scala 1134:31]
  wire  _T_23 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_24 = accel_io_out_ready & accel_io_out_valid; // @[Decoupled.scala 40:37]
  wire  _T_25 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_27 = 2'h3 == state; // @[Conditional.scala 37:30]
  wire  _GEN_16 = _T_11 & dcr_io_dcr_launch; // @[DandelionShell.scala 1135:15]
  DCRF1 dcr ( // @[DandelionShell.scala 1016:19]
    .clock(dcr_clock),
    .reset(dcr_reset),
    .io_host_addr(dcr_io_host_addr),
    .io_host_wdata(dcr_io_host_wdata),
    .io_host_wr(dcr_io_host_wr),
    .io_host_rd(dcr_io_host_rd),
    .io_host_ack(dcr_io_host_ack),
    .io_host_rdata(dcr_io_host_rdata),
    .io_dcr_launch(dcr_io_dcr_launch),
    .io_dcr_finish(dcr_io_dcr_finish),
    .io_dcr_ecnt_0_valid(dcr_io_dcr_ecnt_0_valid),
    .io_dcr_ecnt_0_bits(dcr_io_dcr_ecnt_0_bits),
    .io_dcr_ecnt_1_valid(dcr_io_dcr_ecnt_1_valid),
    .io_dcr_ecnt_1_bits(dcr_io_dcr_ecnt_1_bits),
    .io_dcr_vals_0(dcr_io_dcr_vals_0),
    .io_dcr_vals_1(dcr_io_dcr_vals_1)
  );
  DME dmem ( // @[DandelionShell.scala 1017:20]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .io_mem_aw_ready(dmem_io_mem_aw_ready),
    .io_mem_aw_valid(dmem_io_mem_aw_valid),
    .io_mem_aw_bits_addr(dmem_io_mem_aw_bits_addr),
    .io_mem_w_ready(dmem_io_mem_w_ready),
    .io_mem_w_valid(dmem_io_mem_w_valid),
    .io_mem_w_bits_data(dmem_io_mem_w_bits_data),
    .io_mem_w_bits_last(dmem_io_mem_w_bits_last),
    .io_mem_b_ready(dmem_io_mem_b_ready),
    .io_mem_b_valid(dmem_io_mem_b_valid),
    .io_mem_ar_ready(dmem_io_mem_ar_ready),
    .io_mem_ar_valid(dmem_io_mem_ar_valid),
    .io_mem_ar_bits_addr(dmem_io_mem_ar_bits_addr),
    .io_mem_r_ready(dmem_io_mem_r_ready),
    .io_mem_r_valid(dmem_io_mem_r_valid),
    .io_mem_r_bits_data(dmem_io_mem_r_bits_data),
    .io_mem_r_bits_last(dmem_io_mem_r_bits_last),
    .io_dme_rd_0_cmd_ready(dmem_io_dme_rd_0_cmd_ready),
    .io_dme_rd_0_cmd_valid(dmem_io_dme_rd_0_cmd_valid),
    .io_dme_rd_0_data_ready(dmem_io_dme_rd_0_data_ready),
    .io_dme_rd_0_data_valid(dmem_io_dme_rd_0_data_valid),
    .io_dme_rd_0_data_bits(dmem_io_dme_rd_0_data_bits),
    .io_dme_wr_0_cmd_ready(dmem_io_dme_wr_0_cmd_ready),
    .io_dme_wr_0_cmd_valid(dmem_io_dme_wr_0_cmd_valid),
    .io_dme_wr_0_cmd_bits_addr(dmem_io_dme_wr_0_cmd_bits_addr),
    .io_dme_wr_0_data_ready(dmem_io_dme_wr_0_data_ready),
    .io_dme_wr_0_data_valid(dmem_io_dme_wr_0_data_valid),
    .io_dme_wr_0_data_bits(dmem_io_dme_wr_0_data_bits),
    .io_dme_wr_0_ack(dmem_io_dme_wr_0_ack)
  );
  DMECache cache ( // @[DandelionShell.scala 1018:21]
    .clock(cache_clock),
    .reset(cache_reset),
    .io_cpu_flush(cache_io_cpu_flush),
    .io_cpu_flush_done(cache_io_cpu_flush_done),
    .io_mem_rd_cmd_ready(cache_io_mem_rd_cmd_ready),
    .io_mem_rd_cmd_valid(cache_io_mem_rd_cmd_valid),
    .io_mem_rd_data_ready(cache_io_mem_rd_data_ready),
    .io_mem_rd_data_valid(cache_io_mem_rd_data_valid),
    .io_mem_rd_data_bits(cache_io_mem_rd_data_bits),
    .io_mem_wr_cmd_ready(cache_io_mem_wr_cmd_ready),
    .io_mem_wr_cmd_valid(cache_io_mem_wr_cmd_valid),
    .io_mem_wr_cmd_bits_addr(cache_io_mem_wr_cmd_bits_addr),
    .io_mem_wr_data_ready(cache_io_mem_wr_data_ready),
    .io_mem_wr_data_valid(cache_io_mem_wr_data_valid),
    .io_mem_wr_data_bits(cache_io_mem_wr_data_bits),
    .io_mem_wr_ack(cache_io_mem_wr_ack)
  );
  test01RootDF accel ( // @[DandelionShell.scala 1021:21]
    .clock(accel_clock),
    .reset(accel_reset),
    .io_in_ready(accel_io_in_ready),
    .io_in_valid(accel_io_in_valid),
    .io_in_bits_dataVals_field1_data(accel_io_in_bits_dataVals_field1_data),
    .io_in_bits_dataVals_field0_data(accel_io_in_bits_dataVals_field0_data),
    .io_out_ready(accel_io_out_ready),
    .io_out_valid(accel_io_out_valid),
    .io_out_bits_data_field0_data(accel_io_out_bits_data_field0_data)
  );
  assign io_host_ack = dcr_io_host_ack; // @[DandelionShell.scala 1169:11]
  assign io_host_rdata = dcr_io_host_rdata; // @[DandelionShell.scala 1169:11]
  assign io_mem_aw_valid = dmem_io_mem_aw_valid; // @[DandelionShell.scala 1168:10]
  assign io_mem_aw_bits_addr = dmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 1168:10]
  assign io_mem_w_valid = dmem_io_mem_w_valid; // @[DandelionShell.scala 1168:10]
  assign io_mem_w_bits_data = dmem_io_mem_w_bits_data; // @[DandelionShell.scala 1168:10]
  assign io_mem_w_bits_last = dmem_io_mem_w_bits_last; // @[DandelionShell.scala 1168:10]
  assign io_mem_ar_valid = dmem_io_mem_ar_valid; // @[DandelionShell.scala 1168:10]
  assign io_mem_ar_bits_addr = dmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 1168:10]
  assign io_mem_r_ready = dmem_io_mem_r_ready; // @[DandelionShell.scala 1168:10]
  assign dcr_clock = clock;
  assign dcr_reset = reset;
  assign dcr_io_host_addr = io_host_addr; // @[DandelionShell.scala 1169:11]
  assign dcr_io_host_wdata = io_host_wdata; // @[DandelionShell.scala 1169:11]
  assign dcr_io_host_wr = io_host_wr; // @[DandelionShell.scala 1169:11]
  assign dcr_io_host_rd = io_host_rd; // @[DandelionShell.scala 1169:11]
  assign dcr_io_dcr_finish = state == 2'h3; // @[DandelionShell.scala 1166:21]
  assign dcr_io_dcr_ecnt_0_valid = state == 2'h3; // @[DandelionShell.scala 1058:28]
  assign dcr_io_dcr_ecnt_0_bits = cycles; // @[DandelionShell.scala 1059:27]
  assign dcr_io_dcr_ecnt_1_valid = accel_io_out_valid; // @[DandelionShell.scala 1063:30]
  assign dcr_io_dcr_ecnt_1_bits = accel_io_out_bits_data_field0_data[31:0]; // @[DandelionShell.scala 1062:29]
  assign dmem_clock = clock;
  assign dmem_reset = reset;
  assign dmem_io_mem_aw_ready = io_mem_aw_ready; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_w_ready = io_mem_w_ready; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_b_valid = io_mem_b_valid; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_ar_ready = io_mem_ar_ready; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_r_valid = io_mem_r_valid; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_r_bits_data = io_mem_r_bits_data; // @[DandelionShell.scala 1168:10]
  assign dmem_io_mem_r_bits_last = io_mem_r_bits_last; // @[DandelionShell.scala 1168:10]
  assign dmem_io_dme_rd_0_cmd_valid = cache_io_mem_rd_cmd_valid; // @[DandelionShell.scala 1032:21]
  assign dmem_io_dme_rd_0_data_ready = cache_io_mem_rd_data_ready; // @[DandelionShell.scala 1032:21]
  assign dmem_io_dme_wr_0_cmd_valid = cache_io_mem_wr_cmd_valid; // @[DandelionShell.scala 1033:21]
  assign dmem_io_dme_wr_0_cmd_bits_addr = cache_io_mem_wr_cmd_bits_addr; // @[DandelionShell.scala 1033:21]
  assign dmem_io_dme_wr_0_data_valid = cache_io_mem_wr_data_valid; // @[DandelionShell.scala 1033:21]
  assign dmem_io_dme_wr_0_data_bits = cache_io_mem_wr_data_bits; // @[DandelionShell.scala 1033:21]
  assign cache_clock = clock;
  assign cache_reset = reset;
  assign cache_io_cpu_flush = state == 2'h2; // @[DandelionShell.scala 1099:22]
  assign cache_io_mem_rd_cmd_ready = dmem_io_dme_rd_0_cmd_ready; // @[DandelionShell.scala 1032:21]
  assign cache_io_mem_rd_data_valid = dmem_io_dme_rd_0_data_valid; // @[DandelionShell.scala 1032:21]
  assign cache_io_mem_rd_data_bits = dmem_io_dme_rd_0_data_bits; // @[DandelionShell.scala 1032:21]
  assign cache_io_mem_wr_cmd_ready = dmem_io_dme_wr_0_cmd_ready; // @[DandelionShell.scala 1033:21]
  assign cache_io_mem_wr_data_ready = dmem_io_dme_wr_0_data_ready; // @[DandelionShell.scala 1033:21]
  assign cache_io_mem_wr_ack = dmem_io_dme_wr_0_ack; // @[DandelionShell.scala 1033:21]
  assign accel_clock = clock;
  assign accel_reset = reset;
  assign accel_io_in_valid = _T_11 & _GEN_7; // @[DandelionShell.scala 1096:21 DandelionShell.scala 1144:27]
  assign accel_io_in_bits_dataVals_field1_data = vals_1; // @[DandelionShell.scala 1090:45]
  assign accel_io_in_bits_dataVals_field0_data = vals_0; // @[DandelionShell.scala 1090:45]
  assign accel_io_out_ready = state == 2'h1; // @[DandelionShell.scala 1097:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cycles = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  vals_0 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  vals_1 = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  cache_done = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_11) begin
      if (dcr_io_dcr_launch) begin
        if (_T_22) begin
          state <= 2'h1;
        end
      end
    end else if (_T_23) begin
      if (_T_24) begin
        state <= 2'h2;
      end
    end else if (_T_25) begin
      if (cache_done) begin
        state <= 2'h3;
      end
    end else if (_T_27) begin
      state <= 2'h0;
    end
    if (reset) begin
      cycles <= 32'h0;
    end else if (_T) begin
      cycles <= 32'h0;
    end else if (_T_1) begin
      cycles <= _T_3;
    end
    if (reset) begin
      vals_0 <= 64'h0;
    end else if (_T) begin
      vals_0 <= {{32'd0}, dcr_io_dcr_vals_0};
    end
    if (reset) begin
      vals_1 <= 64'h0;
    end else if (_T) begin
      vals_1 <= {{32'd0}, dcr_io_dcr_vals_1};
    end
    if (reset) begin
      cache_done <= 1'h0;
    end else if (_T_9) begin
      cache_done <= _GEN_4;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_13) begin
          $fwrite(32'h80000002,"Ptrs: "); // @[DandelionShell.scala 1135:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_13) begin
          $fwrite(32'h80000002,"\nVals: "); // @[DandelionShell.scala 1137:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_13) begin
          $fwrite(32'h80000002,"val(0): 0x%x, ",vals_0); // @[DandelionShell.scala 1139:48]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_13) begin
          $fwrite(32'h80000002,"val(1): 0x%x, ",vals_1); // @[DandelionShell.scala 1139:48]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_13) begin
          $fwrite(32'h80000002,"\n"); // @[DandelionShell.scala 1143:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module DandelionF1AccelDebug(
  input          ap_clk,
  input          ap_rst_n,
  output         cl_axi_mstr_bus_AWVALID,
  input          cl_axi_mstr_bus_AWREADY,
  output [63:0]  cl_axi_mstr_bus_AWADDR,
  output [15:0]  cl_axi_mstr_bus_AWID,
  output [9:0]   cl_axi_mstr_bus_AWUSER,
  output [7:0]   cl_axi_mstr_bus_AWLEN,
  output [2:0]   cl_axi_mstr_bus_AWSIZE,
  output [1:0]   cl_axi_mstr_bus_AWBURST,
  output [1:0]   cl_axi_mstr_bus_AWLOCK,
  output [3:0]   cl_axi_mstr_bus_AWCACHE,
  output [2:0]   cl_axi_mstr_bus_AWPROT,
  output [3:0]   cl_axi_mstr_bus_AWQOS,
  output [3:0]   cl_axi_mstr_bus_AWREGION,
  output         cl_axi_mstr_bus_WVALID,
  input          cl_axi_mstr_bus_WREADY,
  output [511:0] cl_axi_mstr_bus_WDATA,
  output [63:0]  cl_axi_mstr_bus_WSTRB,
  output         cl_axi_mstr_bus_WLAST,
  output [15:0]  cl_axi_mstr_bus_WID,
  output [9:0]   cl_axi_mstr_bus_WUSER,
  input          cl_axi_mstr_bus_BVALID,
  output         cl_axi_mstr_bus_BREADY,
  input  [1:0]   cl_axi_mstr_bus_BRESP,
  input  [15:0]  cl_axi_mstr_bus_BID,
  input  [9:0]   cl_axi_mstr_bus_BUSER,
  output         cl_axi_mstr_bus_ARVALID,
  input          cl_axi_mstr_bus_ARREADY,
  output [63:0]  cl_axi_mstr_bus_ARADDR,
  output [15:0]  cl_axi_mstr_bus_ARID,
  output [9:0]   cl_axi_mstr_bus_ARUSER,
  output [7:0]   cl_axi_mstr_bus_ARLEN,
  output [2:0]   cl_axi_mstr_bus_ARSIZE,
  output [1:0]   cl_axi_mstr_bus_ARBURST,
  output [1:0]   cl_axi_mstr_bus_ARLOCK,
  output [3:0]   cl_axi_mstr_bus_ARCACHE,
  output [2:0]   cl_axi_mstr_bus_ARPROT,
  output [3:0]   cl_axi_mstr_bus_ARQOS,
  output [3:0]   cl_axi_mstr_bus_ARREGION,
  input          cl_axi_mstr_bus_RVALID,
  output         cl_axi_mstr_bus_RREADY,
  input  [511:0] cl_axi_mstr_bus_RDATA,
  input  [1:0]   cl_axi_mstr_bus_RRESP,
  input          cl_axi_mstr_bus_RLAST,
  input  [15:0]  cl_axi_mstr_bus_RID,
  input  [9:0]   cl_axi_mstr_bus_RUSER,
  input  [31:0]  axi_mstr_cfg_bus_addr,
  input  [31:0]  axi_mstr_cfg_bus_wdata,
  input          axi_mstr_cfg_bus_wr,
  input          axi_mstr_cfg_bus_rd,
  output         axi_mstr_cfg_bus_ack,
  output [31:0]  axi_mstr_cfg_bus_rdata
);
  wire  shell_clock; // @[XilinxShell.scala 107:11]
  wire  shell_reset; // @[XilinxShell.scala 107:11]
  wire [31:0] shell_io_host_addr; // @[XilinxShell.scala 107:11]
  wire [31:0] shell_io_host_wdata; // @[XilinxShell.scala 107:11]
  wire  shell_io_host_wr; // @[XilinxShell.scala 107:11]
  wire  shell_io_host_rd; // @[XilinxShell.scala 107:11]
  wire  shell_io_host_ack; // @[XilinxShell.scala 107:11]
  wire [31:0] shell_io_host_rdata; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_aw_ready; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_aw_valid; // @[XilinxShell.scala 107:11]
  wire [63:0] shell_io_mem_aw_bits_addr; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_w_ready; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_w_valid; // @[XilinxShell.scala 107:11]
  wire [511:0] shell_io_mem_w_bits_data; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_w_bits_last; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_b_valid; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_ar_ready; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_ar_valid; // @[XilinxShell.scala 107:11]
  wire [63:0] shell_io_mem_ar_bits_addr; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_r_ready; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_r_valid; // @[XilinxShell.scala 107:11]
  wire [511:0] shell_io_mem_r_bits_data; // @[XilinxShell.scala 107:11]
  wire  shell_io_mem_r_bits_last; // @[XilinxShell.scala 107:11]
  DandelionF1DebugShell shell ( // @[XilinxShell.scala 107:11]
    .clock(shell_clock),
    .reset(shell_reset),
    .io_host_addr(shell_io_host_addr),
    .io_host_wdata(shell_io_host_wdata),
    .io_host_wr(shell_io_host_wr),
    .io_host_rd(shell_io_host_rd),
    .io_host_ack(shell_io_host_ack),
    .io_host_rdata(shell_io_host_rdata),
    .io_mem_aw_ready(shell_io_mem_aw_ready),
    .io_mem_aw_valid(shell_io_mem_aw_valid),
    .io_mem_aw_bits_addr(shell_io_mem_aw_bits_addr),
    .io_mem_w_ready(shell_io_mem_w_ready),
    .io_mem_w_valid(shell_io_mem_w_valid),
    .io_mem_w_bits_data(shell_io_mem_w_bits_data),
    .io_mem_w_bits_last(shell_io_mem_w_bits_last),
    .io_mem_b_valid(shell_io_mem_b_valid),
    .io_mem_ar_ready(shell_io_mem_ar_ready),
    .io_mem_ar_valid(shell_io_mem_ar_valid),
    .io_mem_ar_bits_addr(shell_io_mem_ar_bits_addr),
    .io_mem_r_ready(shell_io_mem_r_ready),
    .io_mem_r_valid(shell_io_mem_r_valid),
    .io_mem_r_bits_data(shell_io_mem_r_bits_data),
    .io_mem_r_bits_last(shell_io_mem_r_bits_last)
  );
  assign cl_axi_mstr_bus_AWVALID = shell_io_mem_aw_valid; // @[XilinxShell.scala 112:27]
  assign cl_axi_mstr_bus_AWADDR = shell_io_mem_aw_bits_addr; // @[XilinxShell.scala 114:26]
  assign cl_axi_mstr_bus_AWID = 16'h0; // @[XilinxShell.scala 115:24]
  assign cl_axi_mstr_bus_AWUSER = 10'h0; // @[XilinxShell.scala 116:26]
  assign cl_axi_mstr_bus_AWLEN = 8'h0; // @[XilinxShell.scala 117:25]
  assign cl_axi_mstr_bus_AWSIZE = 3'h6; // @[XilinxShell.scala 118:26]
  assign cl_axi_mstr_bus_AWBURST = 2'h1; // @[XilinxShell.scala 119:27]
  assign cl_axi_mstr_bus_AWLOCK = 2'h0; // @[XilinxShell.scala 120:26]
  assign cl_axi_mstr_bus_AWCACHE = 4'h3; // @[XilinxShell.scala 121:27]
  assign cl_axi_mstr_bus_AWPROT = 3'h0; // @[XilinxShell.scala 122:26]
  assign cl_axi_mstr_bus_AWQOS = 4'h0; // @[XilinxShell.scala 123:25]
  assign cl_axi_mstr_bus_AWREGION = 4'h0; // @[XilinxShell.scala 124:28]
  assign cl_axi_mstr_bus_WVALID = shell_io_mem_w_valid; // @[XilinxShell.scala 126:26]
  assign cl_axi_mstr_bus_WDATA = shell_io_mem_w_bits_data; // @[XilinxShell.scala 128:25]
  assign cl_axi_mstr_bus_WSTRB = 64'hffffffffffffffff; // @[XilinxShell.scala 129:25]
  assign cl_axi_mstr_bus_WLAST = shell_io_mem_w_bits_last; // @[XilinxShell.scala 130:25]
  assign cl_axi_mstr_bus_WID = 16'h0; // @[XilinxShell.scala 131:23]
  assign cl_axi_mstr_bus_WUSER = 10'h0; // @[XilinxShell.scala 132:25]
  assign cl_axi_mstr_bus_BREADY = shell_io_mem_b_valid; // @[XilinxShell.scala 135:26]
  assign cl_axi_mstr_bus_ARVALID = shell_io_mem_ar_valid; // @[XilinxShell.scala 140:27]
  assign cl_axi_mstr_bus_ARADDR = shell_io_mem_ar_bits_addr; // @[XilinxShell.scala 142:26]
  assign cl_axi_mstr_bus_ARID = 16'h0; // @[XilinxShell.scala 143:24]
  assign cl_axi_mstr_bus_ARUSER = 10'h0; // @[XilinxShell.scala 144:26]
  assign cl_axi_mstr_bus_ARLEN = 8'h0; // @[XilinxShell.scala 145:25]
  assign cl_axi_mstr_bus_ARSIZE = 3'h6; // @[XilinxShell.scala 146:26]
  assign cl_axi_mstr_bus_ARBURST = 2'h1; // @[XilinxShell.scala 147:27]
  assign cl_axi_mstr_bus_ARLOCK = 2'h0; // @[XilinxShell.scala 148:26]
  assign cl_axi_mstr_bus_ARCACHE = 4'h3; // @[XilinxShell.scala 149:27]
  assign cl_axi_mstr_bus_ARPROT = 3'h0; // @[XilinxShell.scala 150:26]
  assign cl_axi_mstr_bus_ARQOS = 4'h0; // @[XilinxShell.scala 151:25]
  assign cl_axi_mstr_bus_ARREGION = 4'h0; // @[XilinxShell.scala 152:28]
  assign cl_axi_mstr_bus_RREADY = shell_io_mem_r_ready; // @[XilinxShell.scala 155:26]
  assign axi_mstr_cfg_bus_ack = shell_io_host_ack; // @[XilinxShell.scala 167:24]
  assign axi_mstr_cfg_bus_rdata = shell_io_host_rdata; // @[XilinxShell.scala 168:26]
  assign shell_clock = ap_clk;
  assign shell_reset = ~ap_rst_n;
  assign shell_io_host_addr = axi_mstr_cfg_bus_addr; // @[XilinxShell.scala 163:22]
  assign shell_io_host_wdata = axi_mstr_cfg_bus_wdata; // @[XilinxShell.scala 164:23]
  assign shell_io_host_wr = axi_mstr_cfg_bus_wr; // @[XilinxShell.scala 165:20]
  assign shell_io_host_rd = axi_mstr_cfg_bus_rd; // @[XilinxShell.scala 166:20]
  assign shell_io_mem_aw_ready = cl_axi_mstr_bus_AWREADY; // @[XilinxShell.scala 113:25]
  assign shell_io_mem_w_ready = cl_axi_mstr_bus_WREADY; // @[XilinxShell.scala 127:24]
  assign shell_io_mem_b_valid = cl_axi_mstr_bus_BVALID; // @[XilinxShell.scala 134:24]
  assign shell_io_mem_ar_ready = cl_axi_mstr_bus_ARREADY; // @[XilinxShell.scala 141:25]
  assign shell_io_mem_r_valid = cl_axi_mstr_bus_RVALID; // @[XilinxShell.scala 154:24]
  assign shell_io_mem_r_bits_data = cl_axi_mstr_bus_RDATA; // @[XilinxShell.scala 156:28]
  assign shell_io_mem_r_bits_last = cl_axi_mstr_bus_RLAST; // @[XilinxShell.scala 158:28]
endmodule
