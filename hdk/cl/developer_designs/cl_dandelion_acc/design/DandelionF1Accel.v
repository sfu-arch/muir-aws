module VCR(
  input         clock,
  input         reset,
  output        io_host_aw_ready,
  input         io_host_aw_valid,
  input  [31:0] io_host_aw_bits_addr,
  output        io_host_w_ready,
  input         io_host_w_valid,
  input  [31:0] io_host_w_bits_data,
  input         io_host_b_ready,
  output        io_host_b_valid,
  output        io_host_ar_ready,
  input         io_host_ar_valid,
  input  [31:0] io_host_ar_bits_addr,
  input         io_host_r_ready,
  output        io_host_r_valid,
  output [31:0] io_host_r_bits_data,
  output        io_vcr_launch,
  input         io_vcr_finish,
  input         io_vcr_ecnt_0_valid,
  input  [31:0] io_vcr_ecnt_0_bits,
  output [31:0] io_vcr_vals_0,
  output [31:0] io_vcr_vals_1,
  output [63:0] io_vcr_ptrs_0,
  output [63:0] io_vcr_ptrs_2
);
  reg [31:0] waddr; // @[VCR.scala 62:22]
  reg [31:0] _RAND_0;
  reg [1:0] wstate; // @[VCR.scala 65:23]
  reg [31:0] _RAND_1;
  reg  rstate; // @[VCR.scala 69:23]
  reg [31:0] _RAND_2;
  reg [31:0] rdata; // @[VCR.scala 70:22]
  reg [31:0] _RAND_3;
  reg [31:0] reg_0; // @[VCR.scala 76:37]
  reg [31:0] _RAND_4;
  reg [31:0] reg_1; // @[VCR.scala 76:37]
  reg [31:0] _RAND_5;
  reg [31:0] reg_2; // @[VCR.scala 76:37]
  reg [31:0] _RAND_6;
  reg [31:0] reg_3; // @[VCR.scala 76:37]
  reg [31:0] _RAND_7;
  reg [31:0] reg_4; // @[VCR.scala 76:37]
  reg [31:0] _RAND_8;
  reg [31:0] reg_5; // @[VCR.scala 76:37]
  reg [31:0] _RAND_9;
  reg [31:0] reg_6; // @[VCR.scala 76:37]
  reg [31:0] _RAND_10;
  reg [31:0] reg_7; // @[VCR.scala 76:37]
  reg [31:0] _RAND_11;
  reg [31:0] reg_8; // @[VCR.scala 76:37]
  reg [31:0] _RAND_12;
  reg [31:0] reg_9; // @[VCR.scala 76:37]
  reg [31:0] _RAND_13;
  reg [31:0] reg_10; // @[VCR.scala 76:37]
  reg [31:0] _RAND_14;
  reg [31:0] reg_11; // @[VCR.scala 76:37]
  reg [31:0] _RAND_15;
  wire  _T; // @[Conditional.scala 37:30]
  wire  _T_1; // @[Conditional.scala 37:30]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Decoupled.scala 40:37]
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _GEN_7; // @[VCR.scala 110:30]
  wire  _T_11; // @[Decoupled.scala 40:37]
  wire  _T_12; // @[VCR.scala 128:44]
  wire  _T_13; // @[VCR.scala 128:31]
  wire  _T_15; // @[VCR.scala 135:51]
  wire  _T_16; // @[VCR.scala 135:33]
  wire  _T_18; // @[VCR.scala 141:45]
  wire  _T_19; // @[VCR.scala 141:27]
  wire  _T_21; // @[VCR.scala 141:45]
  wire  _T_22; // @[VCR.scala 141:27]
  wire  _T_24; // @[VCR.scala 141:45]
  wire  _T_25; // @[VCR.scala 141:27]
  wire  _T_27; // @[VCR.scala 141:45]
  wire  _T_28; // @[VCR.scala 141:27]
  wire  _T_30; // @[VCR.scala 141:45]
  wire  _T_31; // @[VCR.scala 141:27]
  wire  _T_33; // @[VCR.scala 141:45]
  wire  _T_34; // @[VCR.scala 141:27]
  wire  _T_36; // @[VCR.scala 141:45]
  wire  _T_37; // @[VCR.scala 141:27]
  wire  _T_39; // @[VCR.scala 141:45]
  wire  _T_40; // @[VCR.scala 141:27]
  wire  _T_42; // @[VCR.scala 141:45]
  wire  _T_43; // @[VCR.scala 141:27]
  wire  _T_45; // @[VCR.scala 141:45]
  wire  _T_46; // @[VCR.scala 141:27]
  wire  _T_47; // @[Decoupled.scala 40:37]
  wire  _T_48; // @[Mux.scala 80:60]
  wire  _T_50; // @[Mux.scala 80:60]
  wire  _T_52; // @[Mux.scala 80:60]
  wire  _T_54; // @[Mux.scala 80:60]
  wire  _T_56; // @[Mux.scala 80:60]
  wire  _T_58; // @[Mux.scala 80:60]
  wire  _T_60; // @[Mux.scala 80:60]
  wire  _T_62; // @[Mux.scala 80:60]
  wire  _T_64; // @[Mux.scala 80:60]
  wire  _T_66; // @[Mux.scala 80:60]
  wire  _T_68; // @[Mux.scala 80:60]
  wire  _T_70; // @[Mux.scala 80:60]
  assign _T = 2'h0 == wstate; // @[Conditional.scala 37:30]
  assign _T_1 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  assign _T_2 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  assign _T_3 = io_host_aw_ready & io_host_aw_valid; // @[Decoupled.scala 40:37]
  assign _T_7 = 1'h0 == rstate; // @[Conditional.scala 37:30]
  assign _GEN_7 = io_host_ar_valid | rstate; // @[VCR.scala 110:30]
  assign _T_11 = io_host_w_ready & io_host_w_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = 32'h0 == waddr; // @[VCR.scala 128:44]
  assign _T_13 = _T_11 & _T_12; // @[VCR.scala 128:31]
  assign _T_15 = 32'h4 == waddr; // @[VCR.scala 135:51]
  assign _T_16 = _T_11 & _T_15; // @[VCR.scala 135:33]
  assign _T_18 = 32'h8 == waddr; // @[VCR.scala 141:45]
  assign _T_19 = _T_11 & _T_18; // @[VCR.scala 141:27]
  assign _T_21 = 32'hc == waddr; // @[VCR.scala 141:45]
  assign _T_22 = _T_11 & _T_21; // @[VCR.scala 141:27]
  assign _T_24 = 32'h10 == waddr; // @[VCR.scala 141:45]
  assign _T_25 = _T_11 & _T_24; // @[VCR.scala 141:27]
  assign _T_27 = 32'h14 == waddr; // @[VCR.scala 141:45]
  assign _T_28 = _T_11 & _T_27; // @[VCR.scala 141:27]
  assign _T_30 = 32'h18 == waddr; // @[VCR.scala 141:45]
  assign _T_31 = _T_11 & _T_30; // @[VCR.scala 141:27]
  assign _T_33 = 32'h1c == waddr; // @[VCR.scala 141:45]
  assign _T_34 = _T_11 & _T_33; // @[VCR.scala 141:27]
  assign _T_36 = 32'h20 == waddr; // @[VCR.scala 141:45]
  assign _T_37 = _T_11 & _T_36; // @[VCR.scala 141:27]
  assign _T_39 = 32'h24 == waddr; // @[VCR.scala 141:45]
  assign _T_40 = _T_11 & _T_39; // @[VCR.scala 141:27]
  assign _T_42 = 32'h28 == waddr; // @[VCR.scala 141:45]
  assign _T_43 = _T_11 & _T_42; // @[VCR.scala 141:27]
  assign _T_45 = 32'h2c == waddr; // @[VCR.scala 141:45]
  assign _T_46 = _T_11 & _T_45; // @[VCR.scala 141:27]
  assign _T_47 = io_host_ar_ready & io_host_ar_valid; // @[Decoupled.scala 40:37]
  assign _T_48 = 32'h0 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_50 = 32'h4 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_52 = 32'h8 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_54 = 32'hc == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_56 = 32'h10 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_58 = 32'h14 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_60 = 32'h18 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_62 = 32'h1c == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_64 = 32'h20 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_66 = 32'h24 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_68 = 32'h28 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_70 = 32'h2c == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign io_host_aw_ready = wstate == 2'h0; // @[VCR.scala 103:20]
  assign io_host_w_ready = wstate == 2'h1; // @[VCR.scala 104:19]
  assign io_host_b_valid = wstate == 2'h2; // @[VCR.scala 105:19]
  assign io_host_ar_ready = rstate == 1'h0; // @[VCR.scala 121:20]
  assign io_host_r_valid = rstate; // @[VCR.scala 122:19]
  assign io_host_r_bits_data = rdata; // @[VCR.scala 123:23]
  assign io_vcr_launch = reg_0[0]; // @[VCR.scala 150:17]
  assign io_vcr_vals_0 = reg_2; // @[VCR.scala 153:20]
  assign io_vcr_vals_1 = reg_3; // @[VCR.scala 153:20]
  assign io_vcr_ptrs_0 = {reg_5,reg_4}; // @[VCR.scala 162:22]
  assign io_vcr_ptrs_2 = {reg_9,reg_8}; // @[VCR.scala 162:22]
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
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wstate = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rstate = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rdata = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_0 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reg_1 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_2 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_3 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reg_4 = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reg_5 = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  reg_6 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reg_7 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  reg_8 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  reg_9 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  reg_10 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  reg_11 = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      waddr <= 32'hffff;
    end else if (_T_3) begin
      waddr <= io_host_aw_bits_addr;
    end
    if (reset) begin
      wstate <= 2'h0;
    end else if (_T) begin
      if (io_host_aw_valid) begin
        wstate <= 2'h1;
      end
    end else if (_T_1) begin
      if (io_host_w_valid) begin
        wstate <= 2'h2;
      end
    end else if (_T_2) begin
      if (io_host_b_ready) begin
        wstate <= 2'h0;
      end
    end
    if (reset) begin
      rstate <= 1'h0;
    end else if (_T_7) begin
      rstate <= _GEN_7;
    end else if (rstate) begin
      if (io_host_r_ready) begin
        rstate <= 1'h0;
      end
    end
    if (reset) begin
      rdata <= 32'h0;
    end else if (_T_47) begin
      if (_T_70) begin
        rdata <= reg_11;
      end else if (_T_68) begin
        rdata <= reg_10;
      end else if (_T_66) begin
        rdata <= reg_9;
      end else if (_T_64) begin
        rdata <= reg_8;
      end else if (_T_62) begin
        rdata <= reg_7;
      end else if (_T_60) begin
        rdata <= reg_6;
      end else if (_T_58) begin
        rdata <= reg_5;
      end else if (_T_56) begin
        rdata <= reg_4;
      end else if (_T_54) begin
        rdata <= reg_3;
      end else if (_T_52) begin
        rdata <= reg_2;
      end else if (_T_50) begin
        rdata <= reg_1;
      end else if (_T_48) begin
        rdata <= reg_0;
      end else begin
        rdata <= 32'h0;
      end
    end
    if (reset) begin
      reg_0 <= 32'h0;
    end else if (io_vcr_finish) begin
      reg_0 <= 32'h2;
    end else if (_T_13) begin
      reg_0 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_1 <= 32'h0;
    end else if (io_vcr_ecnt_0_valid) begin
      reg_1 <= io_vcr_ecnt_0_bits;
    end else if (_T_16) begin
      reg_1 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_2 <= 32'h0;
    end else if (_T_19) begin
      reg_2 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_3 <= 32'h0;
    end else if (_T_22) begin
      reg_3 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_4 <= 32'h0;
    end else if (_T_25) begin
      reg_4 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_5 <= 32'h0;
    end else if (_T_28) begin
      reg_5 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_6 <= 32'h0;
    end else if (_T_31) begin
      reg_6 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_7 <= 32'h0;
    end else if (_T_34) begin
      reg_7 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_8 <= 32'h0;
    end else if (_T_37) begin
      reg_8 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_9 <= 32'h0;
    end else if (_T_40) begin
      reg_9 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_10 <= 32'h0;
    end else if (_T_43) begin
      reg_10 <= io_host_w_bits_data;
    end
    if (reset) begin
      reg_11 <= 32'h0;
    end else if (_T_46) begin
      reg_11 <= io_host_w_bits_data;
    end
  end
endmodule
module Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_addr,
  input  [7:0]  io_in_0_bits_len,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_addr,
  output [7:0]  io_out_bits_len
);
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:14]
  assign io_out_valid = io_in_0_valid; // @[Arbiter.scala 135:16]
  assign io_out_bits_addr = io_in_0_bits_addr; // @[Arbiter.scala 124:15]
  assign io_out_bits_len = io_in_0_bits_len; // @[Arbiter.scala 124:15]
endmodule
module VME(
  input          clock,
  input          reset,
  input          io_mem_aw_ready,
  output         io_mem_aw_valid,
  output [63:0]  io_mem_aw_bits_addr,
  output [7:0]   io_mem_aw_bits_len,
  input          io_mem_w_ready,
  output         io_mem_w_valid,
  output [511:0] io_mem_w_bits_data,
  output         io_mem_w_bits_last,
  output         io_mem_b_ready,
  input          io_mem_b_valid,
  input          io_mem_ar_ready,
  output         io_mem_ar_valid,
  output [63:0]  io_mem_ar_bits_addr,
  output [7:0]   io_mem_ar_bits_len,
  output         io_mem_r_ready,
  input          io_mem_r_valid,
  input  [511:0] io_mem_r_bits_data,
  input          io_mem_r_bits_last,
  output         io_vme_rd_0_cmd_ready,
  input          io_vme_rd_0_cmd_valid,
  input  [63:0]  io_vme_rd_0_cmd_bits_addr,
  input  [7:0]   io_vme_rd_0_cmd_bits_len,
  input          io_vme_rd_0_data_ready,
  output         io_vme_rd_0_data_valid,
  output [511:0] io_vme_rd_0_data_bits,
  output         io_vme_wr_0_cmd_ready,
  input          io_vme_wr_0_cmd_valid,
  input  [63:0]  io_vme_wr_0_cmd_bits_addr,
  input  [7:0]   io_vme_wr_0_cmd_bits_len,
  output         io_vme_wr_0_data_ready,
  input          io_vme_wr_0_data_valid,
  input  [511:0] io_vme_wr_0_data_bits,
  output         io_vme_wr_0_ack
);
  wire  rd_arb_io_in_0_ready; // @[VME.scala 119:22]
  wire  rd_arb_io_in_0_valid; // @[VME.scala 119:22]
  wire [63:0] rd_arb_io_in_0_bits_addr; // @[VME.scala 119:22]
  wire [7:0] rd_arb_io_in_0_bits_len; // @[VME.scala 119:22]
  wire  rd_arb_io_out_ready; // @[VME.scala 119:22]
  wire  rd_arb_io_out_valid; // @[VME.scala 119:22]
  wire [63:0] rd_arb_io_out_bits_addr; // @[VME.scala 119:22]
  wire [7:0] rd_arb_io_out_bits_len; // @[VME.scala 119:22]
  wire  _T; // @[Decoupled.scala 40:37]
  reg [1:0] rstate; // @[VME.scala 127:23]
  reg [31:0] _RAND_0;
  wire  _T_1; // @[Conditional.scala 37:30]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Conditional.scala 37:30]
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire  _T_5; // @[VME.scala 141:28]
  reg [1:0] wstate; // @[VME.scala 148:23]
  reg [31:0] _RAND_1;
  reg [7:0] wr_cnt; // @[VME.scala 151:23]
  reg [31:0] _RAND_2;
  wire  _T_6; // @[VME.scala 153:15]
  wire  _T_7; // @[Decoupled.scala 40:37]
  wire [7:0] _T_9; // @[VME.scala 156:22]
  wire  _T_10; // @[Conditional.scala 37:30]
  wire  _T_11; // @[Conditional.scala 37:30]
  wire  _T_12; // @[Conditional.scala 37:30]
  wire  _T_13; // @[VME.scala 175:18]
  wire  _T_14; // @[VME.scala 175:46]
  wire  _T_15; // @[VME.scala 175:36]
  wire  _T_16; // @[Conditional.scala 37:30]
  reg [7:0] rd_len; // @[VME.scala 187:23]
  reg [31:0] _RAND_3;
  reg [7:0] wr_len; // @[VME.scala 188:23]
  reg [31:0] _RAND_4;
  reg [63:0] rd_addr; // @[VME.scala 189:24]
  reg [63:0] _RAND_5;
  reg [63:0] wr_addr; // @[VME.scala 190:24]
  reg [63:0] _RAND_6;
  wire  _T_18; // @[Decoupled.scala 40:37]
  wire  _T_24; // @[VME.scala 213:37]
  wire  _T_32; // @[VME.scala 230:28]
  Arbiter rd_arb ( // @[VME.scala 119:22]
    .io_in_0_ready(rd_arb_io_in_0_ready),
    .io_in_0_valid(rd_arb_io_in_0_valid),
    .io_in_0_bits_addr(rd_arb_io_in_0_bits_addr),
    .io_in_0_bits_len(rd_arb_io_in_0_bits_len),
    .io_out_ready(rd_arb_io_out_ready),
    .io_out_valid(rd_arb_io_out_valid),
    .io_out_bits_addr(rd_arb_io_out_bits_addr),
    .io_out_bits_len(rd_arb_io_out_bits_len)
  );
  assign _T = rd_arb_io_out_ready & rd_arb_io_out_valid; // @[Decoupled.scala 40:37]
  assign _T_1 = 2'h0 == rstate; // @[Conditional.scala 37:30]
  assign _T_2 = 2'h1 == rstate; // @[Conditional.scala 37:30]
  assign _T_3 = 2'h2 == rstate; // @[Conditional.scala 37:30]
  assign _T_4 = io_mem_r_ready & io_mem_r_valid; // @[Decoupled.scala 40:37]
  assign _T_5 = _T_4 & io_mem_r_bits_last; // @[VME.scala 141:28]
  assign _T_6 = wstate == 2'h0; // @[VME.scala 153:15]
  assign _T_7 = io_mem_w_ready & io_mem_w_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = wr_cnt + 8'h1; // @[VME.scala 156:22]
  assign _T_10 = 2'h0 == wstate; // @[Conditional.scala 37:30]
  assign _T_11 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  assign _T_12 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  assign _T_13 = io_vme_wr_0_data_valid & io_mem_w_ready; // @[VME.scala 175:18]
  assign _T_14 = wr_cnt == io_vme_wr_0_cmd_bits_len; // @[VME.scala 175:46]
  assign _T_15 = _T_13 & _T_14; // @[VME.scala 175:36]
  assign _T_16 = 2'h3 == wstate; // @[Conditional.scala 37:30]
  assign _T_18 = io_vme_wr_0_cmd_ready & io_vme_wr_0_cmd_valid; // @[Decoupled.scala 40:37]
  assign _T_24 = wstate == 2'h2; // @[VME.scala 213:37]
  assign _T_32 = rstate == 2'h2; // @[VME.scala 230:28]
  assign io_mem_aw_valid = wstate == 2'h1; // @[VME.scala 216:19]
  assign io_mem_aw_bits_addr = wr_addr; // @[VME.scala 217:23]
  assign io_mem_aw_bits_len = wr_len; // @[VME.scala 218:22]
  assign io_mem_w_valid = _T_24 & io_vme_wr_0_data_valid; // @[VME.scala 220:18]
  assign io_mem_w_bits_data = io_vme_wr_0_data_bits; // @[VME.scala 221:22]
  assign io_mem_w_bits_last = wr_cnt == io_vme_wr_0_cmd_bits_len; // @[VME.scala 222:22]
  assign io_mem_b_ready = wstate == 2'h3; // @[VME.scala 224:18]
  assign io_mem_ar_valid = rstate == 2'h1; // @[VME.scala 226:19]
  assign io_mem_ar_bits_addr = rd_addr; // @[VME.scala 227:23]
  assign io_mem_ar_bits_len = rd_len; // @[VME.scala 228:22]
  assign io_mem_r_ready = _T_32 & io_vme_rd_0_data_ready; // @[VME.scala 230:18]
  assign io_vme_rd_0_cmd_ready = rd_arb_io_in_0_ready; // @[VME.scala 123:21]
  assign io_vme_rd_0_data_valid = io_mem_r_valid; // @[VME.scala 207:29]
  assign io_vme_rd_0_data_bits = io_mem_r_bits_data; // @[VME.scala 208:28]
  assign io_vme_wr_0_cmd_ready = wstate == 2'h0; // @[VME.scala 211:26]
  assign io_vme_wr_0_data_ready = _T_24 & io_mem_w_ready; // @[VME.scala 213:27]
  assign io_vme_wr_0_ack = io_mem_b_ready & io_mem_b_valid; // @[VME.scala 212:20]
  assign rd_arb_io_in_0_valid = io_vme_rd_0_cmd_valid; // @[VME.scala 123:21]
  assign rd_arb_io_in_0_bits_addr = io_vme_rd_0_cmd_bits_addr; // @[VME.scala 123:21]
  assign rd_arb_io_in_0_bits_len = io_vme_rd_0_cmd_bits_len; // @[VME.scala 123:21]
  assign rd_arb_io_out_ready = rstate == 2'h0; // @[VME.scala 203:23]
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
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wstate = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wr_cnt = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rd_len = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  wr_len = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  rd_addr = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  wr_addr = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
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
    end else if (_T_10) begin
      if (io_vme_wr_0_cmd_valid) begin
        wstate <= 2'h1;
      end
    end else if (_T_11) begin
      if (io_mem_aw_ready) begin
        wstate <= 2'h2;
      end
    end else if (_T_12) begin
      if (_T_15) begin
        wstate <= 2'h3;
      end
    end else if (_T_16) begin
      if (io_mem_b_valid) begin
        wstate <= 2'h0;
      end
    end
    if (reset) begin
      wr_cnt <= 8'h0;
    end else if (_T_6) begin
      wr_cnt <= 8'h0;
    end else if (_T_7) begin
      wr_cnt <= _T_9;
    end
    if (reset) begin
      rd_len <= 8'h0;
    end else if (_T) begin
      rd_len <= rd_arb_io_out_bits_len;
    end
    if (reset) begin
      wr_len <= 8'h0;
    end else if (_T_18) begin
      wr_len <= io_vme_wr_0_cmd_bits_len;
    end
    if (reset) begin
      rd_addr <= 64'h0;
    end else if (_T) begin
      rd_addr <= rd_arb_io_out_bits_addr;
    end
    if (reset) begin
      wr_addr <= 64'h0;
    end else if (_T_18) begin
      wr_addr <= io_vme_wr_0_cmd_bits_addr;
    end
  end
endmodule
module Queue(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [511:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [511:0] io_deq_bits
);
  reg [511:0] _T [0:39]; // @[Decoupled.scala 209:24]
  reg [511:0] _RAND_0;
  wire [511:0] _T__T_18_data; // @[Decoupled.scala 209:24]
  wire [5:0] _T__T_18_addr; // @[Decoupled.scala 209:24]
  reg [511:0] _RAND_1;
  wire [511:0] _T__T_10_data; // @[Decoupled.scala 209:24]
  wire [5:0] _T__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T__T_10_en; // @[Decoupled.scala 209:24]
  reg [5:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  reg [5:0] value_1; // @[Counter.scala 29:33]
  reg [31:0] _RAND_3;
  reg  _T_1; // @[Decoupled.scala 212:35]
  reg [31:0] _RAND_4;
  wire  _T_2; // @[Decoupled.scala 214:41]
  wire  _T_3; // @[Decoupled.scala 215:36]
  wire  _T_4; // @[Decoupled.scala 215:33]
  wire  _T_5; // @[Decoupled.scala 216:32]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  wrap; // @[Counter.scala 37:24]
  wire [5:0] _T_12; // @[Counter.scala 38:22]
  wire  wrap_1; // @[Counter.scala 37:24]
  wire [5:0] _T_14; // @[Counter.scala 38:22]
  wire  _T_15; // @[Decoupled.scala 227:16]
  assign _T__T_18_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T__T_18_data = _T[_T__T_18_addr]; // @[Decoupled.scala 209:24]
  `else
  assign _T__T_18_data = _T__T_18_addr >= 6'h28 ? _RAND_1[511:0] : _T[_T__T_18_addr]; // @[Decoupled.scala 209:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T__T_10_data = io_enq_bits;
  assign _T__T_10_addr = value;
  assign _T__T_10_mask = 1'h1;
  assign _T__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_2 = value == value_1; // @[Decoupled.scala 214:41]
  assign _T_3 = _T_1 == 1'h0; // @[Decoupled.scala 215:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign wrap = value == 6'h27; // @[Counter.scala 37:24]
  assign _T_12 = value + 6'h1; // @[Counter.scala 38:22]
  assign wrap_1 = value_1 == 6'h27; // @[Counter.scala 37:24]
  assign _T_14 = value_1 + 6'h1; // @[Counter.scala 38:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 227:16]
  assign io_enq_ready = _T_5 == 1'h0; // @[Decoupled.scala 232:16]
  assign io_deq_valid = _T_4 == 1'h0; // @[Decoupled.scala 231:16]
  assign io_deq_bits = _T__T_18_data; // @[Decoupled.scala 233:15]
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
  _RAND_0 = {16{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 40; initvar = initvar+1)
    _T[initvar] = _RAND_0[511:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {16{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T__T_10_en & _T__T_10_mask) begin
      _T[_T__T_10_addr] <= _T__T_10_data; // @[Decoupled.scala 209:24]
    end
    if (reset) begin
      value <= 6'h0;
    end else if (_T_6) begin
      if (wrap) begin
        value <= 6'h0;
      end else begin
        value <= _T_12;
      end
    end
    if (reset) begin
      value_1 <= 6'h0;
    end else if (_T_8) begin
      if (wrap_1) begin
        value_1 <= 6'h0;
      end else begin
        value_1 <= _T_14;
      end
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else if (_T_15) begin
      _T_1 <= _T_6;
    end
  end
endmodule
module DandelionVTAShell(
  input          clock,
  input          reset,
  output         io_host_aw_ready,
  input          io_host_aw_valid,
  input  [31:0]  io_host_aw_bits_addr,
  output         io_host_w_ready,
  input          io_host_w_valid,
  input  [31:0]  io_host_w_bits_data,
  input          io_host_b_ready,
  output         io_host_b_valid,
  output         io_host_ar_ready,
  input          io_host_ar_valid,
  input  [31:0]  io_host_ar_bits_addr,
  input          io_host_r_ready,
  output         io_host_r_valid,
  output [31:0]  io_host_r_bits_data,
  input          io_mem_aw_ready,
  output         io_mem_aw_valid,
  output [63:0]  io_mem_aw_bits_addr,
  output [7:0]   io_mem_aw_bits_len,
  input          io_mem_w_ready,
  output         io_mem_w_valid,
  output [511:0] io_mem_w_bits_data,
  output         io_mem_w_bits_last,
  input          io_mem_b_valid,
  input          io_mem_ar_ready,
  output         io_mem_ar_valid,
  output [63:0]  io_mem_ar_bits_addr,
  output [7:0]   io_mem_ar_bits_len,
  output         io_mem_r_ready,
  input          io_mem_r_valid,
  input  [511:0] io_mem_r_bits_data,
  input          io_mem_r_bits_last
);
  wire  vcr_clock; // @[DandelionShell.scala 59:19]
  wire  vcr_reset; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_aw_ready; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_aw_valid; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_host_aw_bits_addr; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_w_ready; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_w_valid; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_host_w_bits_data; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_b_ready; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_b_valid; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_ar_ready; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_ar_valid; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_host_ar_bits_addr; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_r_ready; // @[DandelionShell.scala 59:19]
  wire  vcr_io_host_r_valid; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_host_r_bits_data; // @[DandelionShell.scala 59:19]
  wire  vcr_io_vcr_launch; // @[DandelionShell.scala 59:19]
  wire  vcr_io_vcr_finish; // @[DandelionShell.scala 59:19]
  wire  vcr_io_vcr_ecnt_0_valid; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_vcr_ecnt_0_bits; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_vcr_vals_0; // @[DandelionShell.scala 59:19]
  wire [31:0] vcr_io_vcr_vals_1; // @[DandelionShell.scala 59:19]
  wire [63:0] vcr_io_vcr_ptrs_0; // @[DandelionShell.scala 59:19]
  wire [63:0] vcr_io_vcr_ptrs_2; // @[DandelionShell.scala 59:19]
  wire  vmem_clock; // @[DandelionShell.scala 60:20]
  wire  vmem_reset; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_aw_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_aw_valid; // @[DandelionShell.scala 60:20]
  wire [63:0] vmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 60:20]
  wire [7:0] vmem_io_mem_aw_bits_len; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_w_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_w_valid; // @[DandelionShell.scala 60:20]
  wire [511:0] vmem_io_mem_w_bits_data; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_w_bits_last; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_b_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_b_valid; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_ar_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_ar_valid; // @[DandelionShell.scala 60:20]
  wire [63:0] vmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 60:20]
  wire [7:0] vmem_io_mem_ar_bits_len; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_r_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_r_valid; // @[DandelionShell.scala 60:20]
  wire [511:0] vmem_io_mem_r_bits_data; // @[DandelionShell.scala 60:20]
  wire  vmem_io_mem_r_bits_last; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_rd_0_cmd_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_rd_0_cmd_valid; // @[DandelionShell.scala 60:20]
  wire [63:0] vmem_io_vme_rd_0_cmd_bits_addr; // @[DandelionShell.scala 60:20]
  wire [7:0] vmem_io_vme_rd_0_cmd_bits_len; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_rd_0_data_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_rd_0_data_valid; // @[DandelionShell.scala 60:20]
  wire [511:0] vmem_io_vme_rd_0_data_bits; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_wr_0_cmd_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_wr_0_cmd_valid; // @[DandelionShell.scala 60:20]
  wire [63:0] vmem_io_vme_wr_0_cmd_bits_addr; // @[DandelionShell.scala 60:20]
  wire [7:0] vmem_io_vme_wr_0_cmd_bits_len; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_wr_0_data_ready; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_wr_0_data_valid; // @[DandelionShell.scala 60:20]
  wire [511:0] vmem_io_vme_wr_0_data_bits; // @[DandelionShell.scala 60:20]
  wire  vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 60:20]
  wire  buffer_clock; // @[DandelionShell.scala 62:22]
  wire  buffer_reset; // @[DandelionShell.scala 62:22]
  wire  buffer_io_enq_ready; // @[DandelionShell.scala 62:22]
  wire  buffer_io_enq_valid; // @[DandelionShell.scala 62:22]
  wire [511:0] buffer_io_enq_bits; // @[DandelionShell.scala 62:22]
  wire  buffer_io_deq_ready; // @[DandelionShell.scala 62:22]
  wire  buffer_io_deq_valid; // @[DandelionShell.scala 62:22]
  wire [511:0] buffer_io_deq_bits; // @[DandelionShell.scala 62:22]
  reg [1:0] Rstate; // @[DandelionShell.scala 65:23]
  reg [31:0] _RAND_0;
  reg [1:0] Wstate; // @[DandelionShell.scala 66:23]
  reg [31:0] _RAND_1;
  reg [7:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  wire  _T; // @[DandelionShell.scala 70:15]
  wire  _T_1; // @[Counter.scala 37:24]
  wire [7:0] _T_3; // @[Counter.scala 38:22]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_12; // @[DandelionShell.scala 122:21]
  wire [511:0] _GEN_16; // @[DandelionShell.scala 133:53]
  VCR vcr ( // @[DandelionShell.scala 59:19]
    .clock(vcr_clock),
    .reset(vcr_reset),
    .io_host_aw_ready(vcr_io_host_aw_ready),
    .io_host_aw_valid(vcr_io_host_aw_valid),
    .io_host_aw_bits_addr(vcr_io_host_aw_bits_addr),
    .io_host_w_ready(vcr_io_host_w_ready),
    .io_host_w_valid(vcr_io_host_w_valid),
    .io_host_w_bits_data(vcr_io_host_w_bits_data),
    .io_host_b_ready(vcr_io_host_b_ready),
    .io_host_b_valid(vcr_io_host_b_valid),
    .io_host_ar_ready(vcr_io_host_ar_ready),
    .io_host_ar_valid(vcr_io_host_ar_valid),
    .io_host_ar_bits_addr(vcr_io_host_ar_bits_addr),
    .io_host_r_ready(vcr_io_host_r_ready),
    .io_host_r_valid(vcr_io_host_r_valid),
    .io_host_r_bits_data(vcr_io_host_r_bits_data),
    .io_vcr_launch(vcr_io_vcr_launch),
    .io_vcr_finish(vcr_io_vcr_finish),
    .io_vcr_ecnt_0_valid(vcr_io_vcr_ecnt_0_valid),
    .io_vcr_ecnt_0_bits(vcr_io_vcr_ecnt_0_bits),
    .io_vcr_vals_0(vcr_io_vcr_vals_0),
    .io_vcr_vals_1(vcr_io_vcr_vals_1),
    .io_vcr_ptrs_0(vcr_io_vcr_ptrs_0),
    .io_vcr_ptrs_2(vcr_io_vcr_ptrs_2)
  );
  VME vmem ( // @[DandelionShell.scala 60:20]
    .clock(vmem_clock),
    .reset(vmem_reset),
    .io_mem_aw_ready(vmem_io_mem_aw_ready),
    .io_mem_aw_valid(vmem_io_mem_aw_valid),
    .io_mem_aw_bits_addr(vmem_io_mem_aw_bits_addr),
    .io_mem_aw_bits_len(vmem_io_mem_aw_bits_len),
    .io_mem_w_ready(vmem_io_mem_w_ready),
    .io_mem_w_valid(vmem_io_mem_w_valid),
    .io_mem_w_bits_data(vmem_io_mem_w_bits_data),
    .io_mem_w_bits_last(vmem_io_mem_w_bits_last),
    .io_mem_b_ready(vmem_io_mem_b_ready),
    .io_mem_b_valid(vmem_io_mem_b_valid),
    .io_mem_ar_ready(vmem_io_mem_ar_ready),
    .io_mem_ar_valid(vmem_io_mem_ar_valid),
    .io_mem_ar_bits_addr(vmem_io_mem_ar_bits_addr),
    .io_mem_ar_bits_len(vmem_io_mem_ar_bits_len),
    .io_mem_r_ready(vmem_io_mem_r_ready),
    .io_mem_r_valid(vmem_io_mem_r_valid),
    .io_mem_r_bits_data(vmem_io_mem_r_bits_data),
    .io_mem_r_bits_last(vmem_io_mem_r_bits_last),
    .io_vme_rd_0_cmd_ready(vmem_io_vme_rd_0_cmd_ready),
    .io_vme_rd_0_cmd_valid(vmem_io_vme_rd_0_cmd_valid),
    .io_vme_rd_0_cmd_bits_addr(vmem_io_vme_rd_0_cmd_bits_addr),
    .io_vme_rd_0_cmd_bits_len(vmem_io_vme_rd_0_cmd_bits_len),
    .io_vme_rd_0_data_ready(vmem_io_vme_rd_0_data_ready),
    .io_vme_rd_0_data_valid(vmem_io_vme_rd_0_data_valid),
    .io_vme_rd_0_data_bits(vmem_io_vme_rd_0_data_bits),
    .io_vme_wr_0_cmd_ready(vmem_io_vme_wr_0_cmd_ready),
    .io_vme_wr_0_cmd_valid(vmem_io_vme_wr_0_cmd_valid),
    .io_vme_wr_0_cmd_bits_addr(vmem_io_vme_wr_0_cmd_bits_addr),
    .io_vme_wr_0_cmd_bits_len(vmem_io_vme_wr_0_cmd_bits_len),
    .io_vme_wr_0_data_ready(vmem_io_vme_wr_0_data_ready),
    .io_vme_wr_0_data_valid(vmem_io_vme_wr_0_data_valid),
    .io_vme_wr_0_data_bits(vmem_io_vme_wr_0_data_bits),
    .io_vme_wr_0_ack(vmem_io_vme_wr_0_ack)
  );
  Queue buffer ( // @[DandelionShell.scala 62:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_ready(buffer_io_enq_ready),
    .io_enq_valid(buffer_io_enq_valid),
    .io_enq_bits(buffer_io_enq_bits),
    .io_deq_ready(buffer_io_deq_ready),
    .io_deq_valid(buffer_io_deq_valid),
    .io_deq_bits(buffer_io_deq_bits)
  );
  assign _T = Rstate != 2'h0; // @[DandelionShell.scala 70:15]
  assign _T_1 = value == 8'hc7; // @[Counter.scala 37:24]
  assign _T_3 = value + 8'h1; // @[Counter.scala 38:22]
  assign _T_4 = 2'h0 == Rstate; // @[Conditional.scala 37:30]
  assign _T_5 = 2'h1 == Rstate; // @[Conditional.scala 37:30]
  assign _T_6 = vmem_io_vme_rd_0_cmd_ready & vmem_io_vme_rd_0_cmd_valid; // @[Decoupled.scala 40:37]
  assign _T_7 = 2'h0 == Wstate; // @[Conditional.scala 37:30]
  assign _T_8 = 2'h1 == Wstate; // @[Conditional.scala 37:30]
  assign _T_9 = vmem_io_vme_wr_0_cmd_ready & vmem_io_vme_wr_0_cmd_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = Wstate == 2'h2; // @[DandelionShell.scala 122:21]
  assign _GEN_16 = {{480'd0}, vcr_io_vcr_vals_0}; // @[DandelionShell.scala 133:53]
  assign io_host_aw_ready = vcr_io_host_aw_ready; // @[DandelionShell.scala 137:11]
  assign io_host_w_ready = vcr_io_host_w_ready; // @[DandelionShell.scala 137:11]
  assign io_host_b_valid = vcr_io_host_b_valid; // @[DandelionShell.scala 137:11]
  assign io_host_ar_ready = vcr_io_host_ar_ready; // @[DandelionShell.scala 137:11]
  assign io_host_r_valid = vcr_io_host_r_valid; // @[DandelionShell.scala 137:11]
  assign io_host_r_bits_data = vcr_io_host_r_bits_data; // @[DandelionShell.scala 137:11]
  assign io_mem_aw_valid = vmem_io_mem_aw_valid; // @[DandelionShell.scala 136:10]
  assign io_mem_aw_bits_addr = vmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 136:10]
  assign io_mem_aw_bits_len = vmem_io_mem_aw_bits_len; // @[DandelionShell.scala 136:10]
  assign io_mem_w_valid = vmem_io_mem_w_valid; // @[DandelionShell.scala 136:10]
  assign io_mem_w_bits_data = vmem_io_mem_w_bits_data; // @[DandelionShell.scala 136:10]
  assign io_mem_w_bits_last = vmem_io_mem_w_bits_last; // @[DandelionShell.scala 136:10]
  assign io_mem_ar_valid = vmem_io_mem_ar_valid; // @[DandelionShell.scala 136:10]
  assign io_mem_ar_bits_addr = vmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 136:10]
  assign io_mem_ar_bits_len = vmem_io_mem_ar_bits_len; // @[DandelionShell.scala 136:10]
  assign io_mem_r_ready = vmem_io_mem_r_ready; // @[DandelionShell.scala 136:10]
  assign vcr_clock = clock;
  assign vcr_reset = reset;
  assign vcr_io_host_aw_valid = io_host_aw_valid; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_aw_bits_addr = io_host_aw_bits_addr; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_w_valid = io_host_w_valid; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_w_bits_data = io_host_w_bits_data; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_b_ready = io_host_b_ready; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_ar_valid = io_host_ar_valid; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_ar_bits_addr = io_host_ar_bits_addr; // @[DandelionShell.scala 137:11]
  assign vcr_io_host_r_ready = io_host_r_ready; // @[DandelionShell.scala 137:11]
  assign vcr_io_vcr_finish = _T_12 & vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 123:21]
  assign vcr_io_vcr_ecnt_0_valid = _T_12 & vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 124:28]
  assign vcr_io_vcr_ecnt_0_bits = {{24'd0}, value}; // @[DandelionShell.scala 75:29]
  assign vmem_clock = clock;
  assign vmem_reset = reset;
  assign vmem_io_mem_aw_ready = io_mem_aw_ready; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_w_ready = io_mem_w_ready; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_b_valid = io_mem_b_valid; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_ar_ready = io_mem_ar_ready; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_r_valid = io_mem_r_valid; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_r_bits_data = io_mem_r_bits_data; // @[DandelionShell.scala 136:10]
  assign vmem_io_mem_r_bits_last = io_mem_r_bits_last; // @[DandelionShell.scala 136:10]
  assign vmem_io_vme_rd_0_cmd_valid = Rstate == 2'h1; // @[DandelionShell.scala 107:31 DandelionShell.scala 114:33]
  assign vmem_io_vme_rd_0_cmd_bits_addr = vcr_io_vcr_ptrs_0; // @[DandelionShell.scala 105:35]
  assign vmem_io_vme_rd_0_cmd_bits_len = vcr_io_vcr_vals_1[7:0]; // @[DandelionShell.scala 106:34]
  assign vmem_io_vme_rd_0_data_ready = buffer_io_enq_ready; // @[DandelionShell.scala 132:17]
  assign vmem_io_vme_wr_0_cmd_valid = Wstate == 2'h1; // @[DandelionShell.scala 111:31 DandelionShell.scala 118:33]
  assign vmem_io_vme_wr_0_cmd_bits_addr = vcr_io_vcr_ptrs_2; // @[DandelionShell.scala 109:35]
  assign vmem_io_vme_wr_0_cmd_bits_len = vcr_io_vcr_vals_1[7:0]; // @[DandelionShell.scala 110:34]
  assign vmem_io_vme_wr_0_data_valid = buffer_io_deq_valid; // @[DandelionShell.scala 134:26]
  assign vmem_io_vme_wr_0_data_bits = buffer_io_deq_bits; // @[DandelionShell.scala 134:26]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = vmem_io_vme_rd_0_data_valid; // @[DandelionShell.scala 132:17]
  assign buffer_io_enq_bits = vmem_io_vme_rd_0_data_bits + _GEN_16; // @[DandelionShell.scala 132:17 DandelionShell.scala 133:22]
  assign buffer_io_deq_ready = vmem_io_vme_wr_0_data_ready; // @[DandelionShell.scala 134:26]
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
  Rstate = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  Wstate = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      Rstate <= 2'h0;
    end else if (vmem_io_vme_wr_0_ack) begin
      Rstate <= 2'h0;
    end else if (_T_4) begin
      if (vcr_io_vcr_launch) begin
        Rstate <= 2'h1;
      end
    end else if (_T_5) begin
      if (_T_6) begin
        Rstate <= 2'h2;
      end
    end
    if (reset) begin
      Wstate <= 2'h0;
    end else if (vmem_io_vme_wr_0_ack) begin
      Wstate <= 2'h0;
    end else if (_T_7) begin
      if (vcr_io_vcr_launch) begin
        Wstate <= 2'h1;
      end
    end else if (_T_8) begin
      if (_T_9) begin
        Wstate <= 2'h2;
      end
    end
    if (reset) begin
      value <= 8'h0;
    end else if (_T_4) begin
      if (vcr_io_vcr_launch) begin
        value <= 8'h0;
      end else if (_T) begin
        if (_T_1) begin
          value <= 8'h0;
        end else begin
          value <= _T_3;
        end
      end
    end else if (_T) begin
      if (_T_1) begin
        value <= 8'h0;
      end else begin
        value <= _T_3;
      end
    end
  end
endmodule
module DandelionF1Accel(
  input          ap_clk,
  input          ap_rst_n,
  output         m_axi_gmem_AWVALID,
  input          m_axi_gmem_AWREADY,
  output [63:0]  m_axi_gmem_AWADDR,
  output [15:0]  m_axi_gmem_AWID,
  output [9:0]   m_axi_gmem_AWUSER,
  output [7:0]   m_axi_gmem_AWLEN,
  output [2:0]   m_axi_gmem_AWSIZE,
  output [1:0]   m_axi_gmem_AWBURST,
  output [1:0]   m_axi_gmem_AWLOCK,
  output [3:0]   m_axi_gmem_AWCACHE,
  output [2:0]   m_axi_gmem_AWPROT,
  output [3:0]   m_axi_gmem_AWQOS,
  output [3:0]   m_axi_gmem_AWREGION,
  output         m_axi_gmem_WVALID,
  input          m_axi_gmem_WREADY,
  output [511:0] m_axi_gmem_WDATA,
  output [63:0]  m_axi_gmem_WSTRB,
  output         m_axi_gmem_WLAST,
  output [15:0]  m_axi_gmem_WID,
  output [9:0]   m_axi_gmem_WUSER,
  input          m_axi_gmem_BVALID,
  output         m_axi_gmem_BREADY,
  input  [1:0]   m_axi_gmem_BRESP,
  input  [15:0]  m_axi_gmem_BID,
  input  [9:0]   m_axi_gmem_BUSER,
  output         m_axi_gmem_ARVALID,
  input          m_axi_gmem_ARREADY,
  output [63:0]  m_axi_gmem_ARADDR,
  output [15:0]  m_axi_gmem_ARID,
  output [9:0]   m_axi_gmem_ARUSER,
  output [7:0]   m_axi_gmem_ARLEN,
  output [2:0]   m_axi_gmem_ARSIZE,
  output [1:0]   m_axi_gmem_ARBURST,
  output [1:0]   m_axi_gmem_ARLOCK,
  output [3:0]   m_axi_gmem_ARCACHE,
  output [2:0]   m_axi_gmem_ARPROT,
  output [3:0]   m_axi_gmem_ARQOS,
  output [3:0]   m_axi_gmem_ARREGION,
  input          m_axi_gmem_RVALID,
  output         m_axi_gmem_RREADY,
  input  [511:0] m_axi_gmem_RDATA,
  input  [1:0]   m_axi_gmem_RRESP,
  input          m_axi_gmem_RLAST,
  input  [15:0]  m_axi_gmem_RID,
  input  [9:0]   m_axi_gmem_RUSER,
  input          s_axi_control_AWVALID,
  output         s_axi_control_AWREADY,
  input  [31:0]  s_axi_control_AWADDR,
  input          s_axi_control_WVALID,
  output         s_axi_control_WREADY,
  input  [31:0]  s_axi_control_WDATA,
  input  [3:0]   s_axi_control_WSTRB,
  output         s_axi_control_BVALID,
  input          s_axi_control_BREADY,
  output [1:0]   s_axi_control_BRESP,
  input          s_axi_control_ARVALID,
  output         s_axi_control_ARREADY,
  input  [31:0]  s_axi_control_ARADDR,
  output         s_axi_control_RVALID,
  input          s_axi_control_RREADY,
  output [31:0]  s_axi_control_RDATA,
  output [1:0]   s_axi_control_RRESP
);
  wire  shell_clock; // @[XilinxShell.scala 51:11]
  wire  shell_reset; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_aw_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_aw_valid; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_aw_bits_addr; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_w_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_w_valid; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_w_bits_data; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_b_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_b_valid; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_ar_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_ar_valid; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_ar_bits_addr; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_r_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_r_valid; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_r_bits_data; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_aw_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_aw_valid; // @[XilinxShell.scala 51:11]
  wire [63:0] shell_io_mem_aw_bits_addr; // @[XilinxShell.scala 51:11]
  wire [7:0] shell_io_mem_aw_bits_len; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_w_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_w_valid; // @[XilinxShell.scala 51:11]
  wire [511:0] shell_io_mem_w_bits_data; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_w_bits_last; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_b_valid; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_ar_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_ar_valid; // @[XilinxShell.scala 51:11]
  wire [63:0] shell_io_mem_ar_bits_addr; // @[XilinxShell.scala 51:11]
  wire [7:0] shell_io_mem_ar_bits_len; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_r_ready; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_r_valid; // @[XilinxShell.scala 51:11]
  wire [511:0] shell_io_mem_r_bits_data; // @[XilinxShell.scala 51:11]
  wire  shell_io_mem_r_bits_last; // @[XilinxShell.scala 51:11]
  DandelionVTAShell shell ( // @[XilinxShell.scala 51:11]
    .clock(shell_clock),
    .reset(shell_reset),
    .io_host_aw_ready(shell_io_host_aw_ready),
    .io_host_aw_valid(shell_io_host_aw_valid),
    .io_host_aw_bits_addr(shell_io_host_aw_bits_addr),
    .io_host_w_ready(shell_io_host_w_ready),
    .io_host_w_valid(shell_io_host_w_valid),
    .io_host_w_bits_data(shell_io_host_w_bits_data),
    .io_host_b_ready(shell_io_host_b_ready),
    .io_host_b_valid(shell_io_host_b_valid),
    .io_host_ar_ready(shell_io_host_ar_ready),
    .io_host_ar_valid(shell_io_host_ar_valid),
    .io_host_ar_bits_addr(shell_io_host_ar_bits_addr),
    .io_host_r_ready(shell_io_host_r_ready),
    .io_host_r_valid(shell_io_host_r_valid),
    .io_host_r_bits_data(shell_io_host_r_bits_data),
    .io_mem_aw_ready(shell_io_mem_aw_ready),
    .io_mem_aw_valid(shell_io_mem_aw_valid),
    .io_mem_aw_bits_addr(shell_io_mem_aw_bits_addr),
    .io_mem_aw_bits_len(shell_io_mem_aw_bits_len),
    .io_mem_w_ready(shell_io_mem_w_ready),
    .io_mem_w_valid(shell_io_mem_w_valid),
    .io_mem_w_bits_data(shell_io_mem_w_bits_data),
    .io_mem_w_bits_last(shell_io_mem_w_bits_last),
    .io_mem_b_valid(shell_io_mem_b_valid),
    .io_mem_ar_ready(shell_io_mem_ar_ready),
    .io_mem_ar_valid(shell_io_mem_ar_valid),
    .io_mem_ar_bits_addr(shell_io_mem_ar_bits_addr),
    .io_mem_ar_bits_len(shell_io_mem_ar_bits_len),
    .io_mem_r_ready(shell_io_mem_r_ready),
    .io_mem_r_valid(shell_io_mem_r_valid),
    .io_mem_r_bits_data(shell_io_mem_r_bits_data),
    .io_mem_r_bits_last(shell_io_mem_r_bits_last)
  );
  assign m_axi_gmem_AWVALID = shell_io_mem_aw_valid; // @[XilinxShell.scala 55:22]
  assign m_axi_gmem_AWADDR = shell_io_mem_aw_bits_addr; // @[XilinxShell.scala 57:21]
  assign m_axi_gmem_AWID = 16'h0; // @[XilinxShell.scala 58:19]
  assign m_axi_gmem_AWUSER = 10'h0; // @[XilinxShell.scala 59:21]
  assign m_axi_gmem_AWLEN = shell_io_mem_aw_bits_len; // @[XilinxShell.scala 60:20]
  assign m_axi_gmem_AWSIZE = 3'h6; // @[XilinxShell.scala 61:21]
  assign m_axi_gmem_AWBURST = 2'h1; // @[XilinxShell.scala 62:22]
  assign m_axi_gmem_AWLOCK = 2'h0; // @[XilinxShell.scala 63:21]
  assign m_axi_gmem_AWCACHE = 4'h3; // @[XilinxShell.scala 64:22]
  assign m_axi_gmem_AWPROT = 3'h0; // @[XilinxShell.scala 65:21]
  assign m_axi_gmem_AWQOS = 4'h0; // @[XilinxShell.scala 66:20]
  assign m_axi_gmem_AWREGION = 4'h0; // @[XilinxShell.scala 67:23]
  assign m_axi_gmem_WVALID = shell_io_mem_w_valid; // @[XilinxShell.scala 69:21]
  assign m_axi_gmem_WDATA = shell_io_mem_w_bits_data; // @[XilinxShell.scala 71:20]
  assign m_axi_gmem_WSTRB = 64'hffffffffffffffff; // @[XilinxShell.scala 72:20]
  assign m_axi_gmem_WLAST = shell_io_mem_w_bits_last; // @[XilinxShell.scala 73:20]
  assign m_axi_gmem_WID = 16'h0; // @[XilinxShell.scala 74:18]
  assign m_axi_gmem_WUSER = 10'h0; // @[XilinxShell.scala 75:20]
  assign m_axi_gmem_BREADY = shell_io_mem_b_valid; // @[XilinxShell.scala 78:21]
  assign m_axi_gmem_ARVALID = shell_io_mem_ar_valid; // @[XilinxShell.scala 83:22]
  assign m_axi_gmem_ARADDR = shell_io_mem_ar_bits_addr; // @[XilinxShell.scala 85:21]
  assign m_axi_gmem_ARID = 16'h0; // @[XilinxShell.scala 86:19]
  assign m_axi_gmem_ARUSER = 10'h0; // @[XilinxShell.scala 87:21]
  assign m_axi_gmem_ARLEN = shell_io_mem_ar_bits_len; // @[XilinxShell.scala 88:20]
  assign m_axi_gmem_ARSIZE = 3'h6; // @[XilinxShell.scala 89:21]
  assign m_axi_gmem_ARBURST = 2'h1; // @[XilinxShell.scala 90:22]
  assign m_axi_gmem_ARLOCK = 2'h0; // @[XilinxShell.scala 91:21]
  assign m_axi_gmem_ARCACHE = 4'h3; // @[XilinxShell.scala 92:22]
  assign m_axi_gmem_ARPROT = 3'h0; // @[XilinxShell.scala 93:21]
  assign m_axi_gmem_ARQOS = 4'h0; // @[XilinxShell.scala 94:20]
  assign m_axi_gmem_ARREGION = 4'h0; // @[XilinxShell.scala 95:23]
  assign m_axi_gmem_RREADY = shell_io_mem_r_ready; // @[XilinxShell.scala 98:21]
  assign s_axi_control_AWREADY = shell_io_host_aw_ready; // @[XilinxShell.scala 107:25]
  assign s_axi_control_WREADY = shell_io_host_w_ready; // @[XilinxShell.scala 111:24]
  assign s_axi_control_BVALID = shell_io_host_b_valid; // @[XilinxShell.scala 115:24]
  assign s_axi_control_BRESP = 2'h0; // @[XilinxShell.scala 117:23]
  assign s_axi_control_ARREADY = shell_io_host_ar_ready; // @[XilinxShell.scala 120:25]
  assign s_axi_control_RVALID = shell_io_host_r_valid; // @[XilinxShell.scala 123:24]
  assign s_axi_control_RDATA = shell_io_host_r_bits_data; // @[XilinxShell.scala 125:23]
  assign s_axi_control_RRESP = 2'h0; // @[XilinxShell.scala 126:23]
  assign shell_clock = ap_clk;
  assign shell_reset = ~ ap_rst_n;
  assign shell_io_host_aw_valid = s_axi_control_AWVALID; // @[XilinxShell.scala 106:26]
  assign shell_io_host_aw_bits_addr = s_axi_control_AWADDR; // @[XilinxShell.scala 108:30]
  assign shell_io_host_w_valid = s_axi_control_WVALID; // @[XilinxShell.scala 110:25]
  assign shell_io_host_w_bits_data = s_axi_control_WDATA; // @[XilinxShell.scala 112:29]
  assign shell_io_host_b_ready = s_axi_control_BREADY; // @[XilinxShell.scala 116:25]
  assign shell_io_host_ar_valid = s_axi_control_ARVALID; // @[XilinxShell.scala 119:26]
  assign shell_io_host_ar_bits_addr = s_axi_control_ARADDR; // @[XilinxShell.scala 121:30]
  assign shell_io_host_r_ready = s_axi_control_RREADY; // @[XilinxShell.scala 124:25]
  assign shell_io_mem_aw_ready = m_axi_gmem_AWREADY; // @[XilinxShell.scala 56:25]
  assign shell_io_mem_w_ready = m_axi_gmem_WREADY; // @[XilinxShell.scala 70:24]
  assign shell_io_mem_b_valid = m_axi_gmem_BVALID; // @[XilinxShell.scala 77:24]
  assign shell_io_mem_ar_ready = m_axi_gmem_ARREADY; // @[XilinxShell.scala 84:25]
  assign shell_io_mem_r_valid = m_axi_gmem_RVALID; // @[XilinxShell.scala 97:24]
  assign shell_io_mem_r_bits_data = m_axi_gmem_RDATA; // @[XilinxShell.scala 99:28]
  assign shell_io_mem_r_bits_last = m_axi_gmem_RLAST; // @[XilinxShell.scala 101:28]
endmodule