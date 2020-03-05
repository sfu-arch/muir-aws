module DCR(
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
  output [31:0] io_dcr_vals_0,
  output [31:0] io_dcr_vals_1,
  output [63:0] io_dcr_ptrs_0,
  output [63:0] io_dcr_ptrs_1
);
  reg [31:0] waddr; // @[DCR.scala 92:22]
  reg [31:0] _RAND_0;
  reg [1:0] wstate; // @[DCR.scala 95:23]
  reg [31:0] _RAND_1;
  reg [1:0] rstate; // @[DCR.scala 99:23]
  reg [31:0] _RAND_2;
  reg [31:0] rdata; // @[DCR.scala 100:22]
  reg [31:0] _RAND_3;
  reg [31:0] reg_0; // @[DCR.scala 106:37]
  reg [31:0] _RAND_4;
  reg [31:0] reg_1; // @[DCR.scala 106:37]
  reg [31:0] _RAND_5;
  reg [31:0] reg_2; // @[DCR.scala 106:37]
  reg [31:0] _RAND_6;
  reg [31:0] reg_3; // @[DCR.scala 106:37]
  reg [31:0] _RAND_7;
  reg [31:0] reg_4; // @[DCR.scala 106:37]
  reg [31:0] _RAND_8;
  reg [31:0] reg_5; // @[DCR.scala 106:37]
  reg [31:0] _RAND_9;
  reg [31:0] reg_6; // @[DCR.scala 106:37]
  reg [31:0] _RAND_10;
  reg [31:0] reg_7; // @[DCR.scala 106:37]
  reg [31:0] _RAND_11;
  wire  isWriteData; // @[DCR.scala 116:28]
  wire  _T; // @[Conditional.scala 37:30]
  wire  _T_1; // @[Conditional.scala 37:30]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_8; // @[Conditional.scala 40:58]
  wire  _T_3; // @[Conditional.scala 37:30]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire  _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _T_6; // @[DCR.scala 152:38]
  wire  _T_7; // @[DCR.scala 152:25]
  wire  _T_8; // @[DCR.scala 152:48]
  wire  _T_9; // @[DCR.scala 159:45]
  wire  _T_10; // @[DCR.scala 159:27]
  wire  _T_11; // @[DCR.scala 165:39]
  wire  _T_12; // @[DCR.scala 165:21]
  wire  _T_13; // @[DCR.scala 165:49]
  wire  _T_14; // @[DCR.scala 165:39]
  wire  _T_15; // @[DCR.scala 165:21]
  wire  _T_16; // @[DCR.scala 165:49]
  wire  _T_17; // @[DCR.scala 165:39]
  wire  _T_18; // @[DCR.scala 165:21]
  wire  _T_19; // @[DCR.scala 165:49]
  wire  _T_20; // @[DCR.scala 165:39]
  wire  _T_21; // @[DCR.scala 165:21]
  wire  _T_22; // @[DCR.scala 165:49]
  wire  _T_23; // @[DCR.scala 165:39]
  wire  _T_24; // @[DCR.scala 165:21]
  wire  _T_25; // @[DCR.scala 165:49]
  wire  _T_26; // @[DCR.scala 165:39]
  wire  _T_27; // @[DCR.scala 165:21]
  wire  _T_28; // @[DCR.scala 165:49]
  wire  _T_29; // @[Mux.scala 80:60]
  wire  _T_31; // @[Mux.scala 80:60]
  wire  _T_33; // @[Mux.scala 80:60]
  wire  _T_35; // @[Mux.scala 80:60]
  wire  _T_37; // @[Mux.scala 80:60]
  wire  _T_39; // @[Mux.scala 80:60]
  wire  _T_41; // @[Mux.scala 80:60]
  wire  _T_43; // @[Mux.scala 80:60]
  assign isWriteData = wstate == 2'h1; // @[DCR.scala 116:28]
  assign _T = 2'h0 == wstate; // @[Conditional.scala 37:30]
  assign _T_1 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  assign _T_2 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  assign _GEN_5 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67]
  assign _GEN_8 = _T ? 1'h0 : _GEN_5; // @[Conditional.scala 40:58]
  assign _T_3 = 2'h0 == rstate; // @[Conditional.scala 37:30]
  assign _T_4 = 2'h1 == rstate; // @[Conditional.scala 37:30]
  assign _T_5 = 2'h2 == rstate; // @[Conditional.scala 37:30]
  assign _GEN_11 = _T_5 | _GEN_8; // @[Conditional.scala 39:67]
  assign _GEN_13 = _T_4 ? _GEN_8 : _GEN_11; // @[Conditional.scala 39:67]
  assign _T_6 = 32'h500 == waddr; // @[DCR.scala 152:38]
  assign _T_7 = io_host_wr & _T_6; // @[DCR.scala 152:25]
  assign _T_8 = _T_7 & isWriteData; // @[DCR.scala 152:48]
  assign _T_9 = 32'h504 == waddr; // @[DCR.scala 159:45]
  assign _T_10 = io_host_wr & _T_9; // @[DCR.scala 159:27]
  assign _T_11 = 32'h508 == waddr; // @[DCR.scala 165:39]
  assign _T_12 = io_host_wr & _T_11; // @[DCR.scala 165:21]
  assign _T_13 = _T_12 & isWriteData; // @[DCR.scala 165:49]
  assign _T_14 = 32'h50c == waddr; // @[DCR.scala 165:39]
  assign _T_15 = io_host_wr & _T_14; // @[DCR.scala 165:21]
  assign _T_16 = _T_15 & isWriteData; // @[DCR.scala 165:49]
  assign _T_17 = 32'h510 == waddr; // @[DCR.scala 165:39]
  assign _T_18 = io_host_wr & _T_17; // @[DCR.scala 165:21]
  assign _T_19 = _T_18 & isWriteData; // @[DCR.scala 165:49]
  assign _T_20 = 32'h514 == waddr; // @[DCR.scala 165:39]
  assign _T_21 = io_host_wr & _T_20; // @[DCR.scala 165:21]
  assign _T_22 = _T_21 & isWriteData; // @[DCR.scala 165:49]
  assign _T_23 = 32'h518 == waddr; // @[DCR.scala 165:39]
  assign _T_24 = io_host_wr & _T_23; // @[DCR.scala 165:21]
  assign _T_25 = _T_24 & isWriteData; // @[DCR.scala 165:49]
  assign _T_26 = 32'h51c == waddr; // @[DCR.scala 165:39]
  assign _T_27 = io_host_wr & _T_26; // @[DCR.scala 165:21]
  assign _T_28 = _T_27 & isWriteData; // @[DCR.scala 165:49]
  assign _T_29 = 32'h500 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_31 = 32'h504 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_33 = 32'h508 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_35 = 32'h50c == io_host_addr; // @[Mux.scala 80:60]
  assign _T_37 = 32'h510 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_39 = 32'h514 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_41 = 32'h518 == io_host_addr; // @[Mux.scala 80:60]
  assign _T_43 = 32'h51c == io_host_addr; // @[Mux.scala 80:60]
  assign io_host_ack = _T_3 ? _GEN_8 : _GEN_13; // @[DCR.scala 113:15 DCR.scala 131:19 DCR.scala 146:19]
  assign io_host_rdata = rdata; // @[DCR.scala 114:17]
  assign io_dcr_launch = reg_0[0]; // @[DCR.scala 174:17]
  assign io_dcr_vals_0 = reg_2; // @[DCR.scala 177:20]
  assign io_dcr_vals_1 = reg_3; // @[DCR.scala 177:20]
  assign io_dcr_ptrs_0 = {reg_5,reg_4}; // @[DCR.scala 187:22]
  assign io_dcr_ptrs_1 = {reg_7,reg_6}; // @[DCR.scala 187:22]
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
  rstate = _RAND_2[1:0];
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
  `endif // RANDOMIZE
end // initial
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
      if (_T_43) begin
        rdata <= reg_7;
      end else if (_T_41) begin
        rdata <= reg_6;
      end else if (_T_39) begin
        rdata <= reg_5;
      end else if (_T_37) begin
        rdata <= reg_4;
      end else if (_T_35) begin
        rdata <= reg_3;
      end else if (_T_33) begin
        rdata <= reg_2;
      end else if (_T_31) begin
        rdata <= reg_1;
      end else if (_T_29) begin
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
    end else if (_T_13) begin
      reg_2 <= io_host_wdata;
    end
    if (reset) begin
      reg_3 <= 32'h0;
    end else if (_T_16) begin
      reg_3 <= io_host_wdata;
    end
    if (reset) begin
      reg_4 <= 32'h0;
    end else if (_T_19) begin
      reg_4 <= io_host_wdata;
    end
    if (reset) begin
      reg_5 <= 32'h0;
    end else if (_T_22) begin
      reg_5 <= io_host_wdata;
    end
    if (reset) begin
      reg_6 <= 32'h0;
    end else if (_T_25) begin
      reg_6 <= io_host_wdata;
    end
    if (reset) begin
      reg_7 <= 32'h0;
    end else if (_T_28) begin
      reg_7 <= io_host_wdata;
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
  assign _T_4 = _T_2 & ~_T_1; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign wrap = value == 6'h27; // @[Counter.scala 37:24]
  assign _T_12 = value + 6'h1; // @[Counter.scala 38:22]
  assign wrap_1 = value_1 == 6'h27; // @[Counter.scala 37:24]
  assign _T_14 = value_1 + 6'h1; // @[Counter.scala 38:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 227:16]
  assign io_enq_ready = ~_T_5; // @[Decoupled.scala 232:16]
  assign io_deq_valid = ~_T_4; // @[Decoupled.scala 231:16]
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
module DandelionF1DTAShell(
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
  wire  dcr_clock; // @[DandelionShell.scala 147:19]
  wire  dcr_reset; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_host_addr; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_host_wdata; // @[DandelionShell.scala 147:19]
  wire  dcr_io_host_wr; // @[DandelionShell.scala 147:19]
  wire  dcr_io_host_rd; // @[DandelionShell.scala 147:19]
  wire  dcr_io_host_ack; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_host_rdata; // @[DandelionShell.scala 147:19]
  wire  dcr_io_dcr_launch; // @[DandelionShell.scala 147:19]
  wire  dcr_io_dcr_finish; // @[DandelionShell.scala 147:19]
  wire  dcr_io_dcr_ecnt_0_valid; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_dcr_ecnt_0_bits; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_dcr_vals_0; // @[DandelionShell.scala 147:19]
  wire [31:0] dcr_io_dcr_vals_1; // @[DandelionShell.scala 147:19]
  wire [63:0] dcr_io_dcr_ptrs_0; // @[DandelionShell.scala 147:19]
  wire [63:0] dcr_io_dcr_ptrs_1; // @[DandelionShell.scala 147:19]
  wire  vmem_clock; // @[DandelionShell.scala 148:20]
  wire  vmem_reset; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_aw_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_aw_valid; // @[DandelionShell.scala 148:20]
  wire [63:0] vmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 148:20]
  wire [7:0] vmem_io_mem_aw_bits_len; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_w_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_w_valid; // @[DandelionShell.scala 148:20]
  wire [511:0] vmem_io_mem_w_bits_data; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_w_bits_last; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_b_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_b_valid; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_ar_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_ar_valid; // @[DandelionShell.scala 148:20]
  wire [63:0] vmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 148:20]
  wire [7:0] vmem_io_mem_ar_bits_len; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_r_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_r_valid; // @[DandelionShell.scala 148:20]
  wire [511:0] vmem_io_mem_r_bits_data; // @[DandelionShell.scala 148:20]
  wire  vmem_io_mem_r_bits_last; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_rd_0_cmd_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_rd_0_cmd_valid; // @[DandelionShell.scala 148:20]
  wire [63:0] vmem_io_vme_rd_0_cmd_bits_addr; // @[DandelionShell.scala 148:20]
  wire [7:0] vmem_io_vme_rd_0_cmd_bits_len; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_rd_0_data_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_rd_0_data_valid; // @[DandelionShell.scala 148:20]
  wire [511:0] vmem_io_vme_rd_0_data_bits; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_wr_0_cmd_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_wr_0_cmd_valid; // @[DandelionShell.scala 148:20]
  wire [63:0] vmem_io_vme_wr_0_cmd_bits_addr; // @[DandelionShell.scala 148:20]
  wire [7:0] vmem_io_vme_wr_0_cmd_bits_len; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_wr_0_data_ready; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_wr_0_data_valid; // @[DandelionShell.scala 148:20]
  wire [511:0] vmem_io_vme_wr_0_data_bits; // @[DandelionShell.scala 148:20]
  wire  vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 148:20]
  wire  buffer_clock; // @[DandelionShell.scala 150:22]
  wire  buffer_reset; // @[DandelionShell.scala 150:22]
  wire  buffer_io_enq_ready; // @[DandelionShell.scala 150:22]
  wire  buffer_io_enq_valid; // @[DandelionShell.scala 150:22]
  wire [511:0] buffer_io_enq_bits; // @[DandelionShell.scala 150:22]
  wire  buffer_io_deq_ready; // @[DandelionShell.scala 150:22]
  wire  buffer_io_deq_valid; // @[DandelionShell.scala 150:22]
  wire [511:0] buffer_io_deq_bits; // @[DandelionShell.scala 150:22]
  reg [1:0] Rstate; // @[DandelionShell.scala 153:23]
  reg [31:0] _RAND_0;
  reg [1:0] Wstate; // @[DandelionShell.scala 154:23]
  reg [31:0] _RAND_1;
  reg [7:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  wire  _T; // @[DandelionShell.scala 158:15]
  wire  _T_1; // @[Counter.scala 37:24]
  wire [7:0] _T_3; // @[Counter.scala 38:22]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_12; // @[DandelionShell.scala 210:21]
  wire [511:0] _GEN_16; // @[DandelionShell.scala 221:53]
  DCR dcr ( // @[DandelionShell.scala 147:19]
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
    .io_dcr_vals_0(dcr_io_dcr_vals_0),
    .io_dcr_vals_1(dcr_io_dcr_vals_1),
    .io_dcr_ptrs_0(dcr_io_dcr_ptrs_0),
    .io_dcr_ptrs_1(dcr_io_dcr_ptrs_1)
  );
  VME vmem ( // @[DandelionShell.scala 148:20]
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
  Queue buffer ( // @[DandelionShell.scala 150:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_ready(buffer_io_enq_ready),
    .io_enq_valid(buffer_io_enq_valid),
    .io_enq_bits(buffer_io_enq_bits),
    .io_deq_ready(buffer_io_deq_ready),
    .io_deq_valid(buffer_io_deq_valid),
    .io_deq_bits(buffer_io_deq_bits)
  );
  assign _T = Rstate != 2'h0; // @[DandelionShell.scala 158:15]
  assign _T_1 = value == 8'hc7; // @[Counter.scala 37:24]
  assign _T_3 = value + 8'h1; // @[Counter.scala 38:22]
  assign _T_4 = 2'h0 == Rstate; // @[Conditional.scala 37:30]
  assign _T_5 = 2'h1 == Rstate; // @[Conditional.scala 37:30]
  assign _T_6 = vmem_io_vme_rd_0_cmd_ready & vmem_io_vme_rd_0_cmd_valid; // @[Decoupled.scala 40:37]
  assign _T_7 = 2'h0 == Wstate; // @[Conditional.scala 37:30]
  assign _T_8 = 2'h1 == Wstate; // @[Conditional.scala 37:30]
  assign _T_9 = vmem_io_vme_wr_0_cmd_ready & vmem_io_vme_wr_0_cmd_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = Wstate == 2'h2; // @[DandelionShell.scala 210:21]
  assign _GEN_16 = {{480'd0}, dcr_io_dcr_vals_0}; // @[DandelionShell.scala 221:53]
  assign io_host_ack = dcr_io_host_ack; // @[DandelionShell.scala 225:11]
  assign io_host_rdata = dcr_io_host_rdata; // @[DandelionShell.scala 225:11]
  assign io_mem_aw_valid = vmem_io_mem_aw_valid; // @[DandelionShell.scala 224:10]
  assign io_mem_aw_bits_addr = vmem_io_mem_aw_bits_addr; // @[DandelionShell.scala 224:10]
  assign io_mem_aw_bits_len = vmem_io_mem_aw_bits_len; // @[DandelionShell.scala 224:10]
  assign io_mem_w_valid = vmem_io_mem_w_valid; // @[DandelionShell.scala 224:10]
  assign io_mem_w_bits_data = vmem_io_mem_w_bits_data; // @[DandelionShell.scala 224:10]
  assign io_mem_w_bits_last = vmem_io_mem_w_bits_last; // @[DandelionShell.scala 224:10]
  assign io_mem_ar_valid = vmem_io_mem_ar_valid; // @[DandelionShell.scala 224:10]
  assign io_mem_ar_bits_addr = vmem_io_mem_ar_bits_addr; // @[DandelionShell.scala 224:10]
  assign io_mem_ar_bits_len = vmem_io_mem_ar_bits_len; // @[DandelionShell.scala 224:10]
  assign io_mem_r_ready = vmem_io_mem_r_ready; // @[DandelionShell.scala 224:10]
  assign dcr_clock = clock;
  assign dcr_reset = reset;
  assign dcr_io_host_addr = io_host_addr; // @[DandelionShell.scala 225:11]
  assign dcr_io_host_wdata = io_host_wdata; // @[DandelionShell.scala 225:11]
  assign dcr_io_host_wr = io_host_wr; // @[DandelionShell.scala 225:11]
  assign dcr_io_host_rd = io_host_rd; // @[DandelionShell.scala 225:11]
  assign dcr_io_dcr_finish = _T_12 & vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 211:21]
  assign dcr_io_dcr_ecnt_0_valid = _T_12 & vmem_io_vme_wr_0_ack; // @[DandelionShell.scala 212:28]
  assign dcr_io_dcr_ecnt_0_bits = {{24'd0}, value}; // @[DandelionShell.scala 163:29]
  assign vmem_clock = clock;
  assign vmem_reset = reset;
  assign vmem_io_mem_aw_ready = io_mem_aw_ready; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_w_ready = io_mem_w_ready; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_b_valid = io_mem_b_valid; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_ar_ready = io_mem_ar_ready; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_r_valid = io_mem_r_valid; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_r_bits_data = io_mem_r_bits_data; // @[DandelionShell.scala 224:10]
  assign vmem_io_mem_r_bits_last = io_mem_r_bits_last; // @[DandelionShell.scala 224:10]
  assign vmem_io_vme_rd_0_cmd_valid = Rstate == 2'h1; // @[DandelionShell.scala 195:31 DandelionShell.scala 202:33]
  assign vmem_io_vme_rd_0_cmd_bits_addr = dcr_io_dcr_ptrs_0; // @[DandelionShell.scala 193:35]
  assign vmem_io_vme_rd_0_cmd_bits_len = dcr_io_dcr_vals_1[7:0]; // @[DandelionShell.scala 194:34]
  assign vmem_io_vme_rd_0_data_ready = buffer_io_enq_ready; // @[DandelionShell.scala 220:17]
  assign vmem_io_vme_wr_0_cmd_valid = Wstate == 2'h1; // @[DandelionShell.scala 199:31 DandelionShell.scala 206:33]
  assign vmem_io_vme_wr_0_cmd_bits_addr = dcr_io_dcr_ptrs_1; // @[DandelionShell.scala 197:35]
  assign vmem_io_vme_wr_0_cmd_bits_len = dcr_io_dcr_vals_1[7:0]; // @[DandelionShell.scala 198:34]
  assign vmem_io_vme_wr_0_data_valid = buffer_io_deq_valid; // @[DandelionShell.scala 222:26]
  assign vmem_io_vme_wr_0_data_bits = buffer_io_deq_bits; // @[DandelionShell.scala 222:26]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = vmem_io_vme_rd_0_data_valid; // @[DandelionShell.scala 220:17]
  assign buffer_io_enq_bits = vmem_io_vme_rd_0_data_bits + _GEN_16; // @[DandelionShell.scala 220:17 DandelionShell.scala 221:22]
  assign buffer_io_deq_ready = vmem_io_vme_wr_0_data_ready; // @[DandelionShell.scala 222:26]
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
      if (dcr_io_dcr_launch) begin
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
      if (dcr_io_dcr_launch) begin
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
      if (dcr_io_dcr_launch) begin
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
  wire  shell_clock; // @[XilinxShell.scala 51:11]
  wire  shell_reset; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_addr; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_wdata; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_wr; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_rd; // @[XilinxShell.scala 51:11]
  wire  shell_io_host_ack; // @[XilinxShell.scala 51:11]
  wire [31:0] shell_io_host_rdata; // @[XilinxShell.scala 51:11]
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
  DandelionF1DTAShell shell ( // @[XilinxShell.scala 51:11]
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
  assign cl_axi_mstr_bus_AWVALID = shell_io_mem_aw_valid; // @[XilinxShell.scala 55:27]
  assign cl_axi_mstr_bus_AWADDR = shell_io_mem_aw_bits_addr; // @[XilinxShell.scala 57:26]
  assign cl_axi_mstr_bus_AWID = 16'h0; // @[XilinxShell.scala 58:24]
  assign cl_axi_mstr_bus_AWUSER = 10'h0; // @[XilinxShell.scala 59:26]
  assign cl_axi_mstr_bus_AWLEN = shell_io_mem_aw_bits_len; // @[XilinxShell.scala 60:25]
  assign cl_axi_mstr_bus_AWSIZE = 3'h6; // @[XilinxShell.scala 61:26]
  assign cl_axi_mstr_bus_AWBURST = 2'h1; // @[XilinxShell.scala 62:27]
  assign cl_axi_mstr_bus_AWLOCK = 2'h0; // @[XilinxShell.scala 63:26]
  assign cl_axi_mstr_bus_AWCACHE = 4'h3; // @[XilinxShell.scala 64:27]
  assign cl_axi_mstr_bus_AWPROT = 3'h0; // @[XilinxShell.scala 65:26]
  assign cl_axi_mstr_bus_AWQOS = 4'h0; // @[XilinxShell.scala 66:25]
  assign cl_axi_mstr_bus_AWREGION = 4'h0; // @[XilinxShell.scala 67:28]
  assign cl_axi_mstr_bus_WVALID = shell_io_mem_w_valid; // @[XilinxShell.scala 69:26]
  assign cl_axi_mstr_bus_WDATA = shell_io_mem_w_bits_data; // @[XilinxShell.scala 71:25]
  assign cl_axi_mstr_bus_WSTRB = 64'hffffffffffffffff; // @[XilinxShell.scala 72:25]
  assign cl_axi_mstr_bus_WLAST = shell_io_mem_w_bits_last; // @[XilinxShell.scala 73:25]
  assign cl_axi_mstr_bus_WID = 16'h0; // @[XilinxShell.scala 74:23]
  assign cl_axi_mstr_bus_WUSER = 10'h0; // @[XilinxShell.scala 75:25]
  assign cl_axi_mstr_bus_BREADY = shell_io_mem_b_valid; // @[XilinxShell.scala 78:26]
  assign cl_axi_mstr_bus_ARVALID = shell_io_mem_ar_valid; // @[XilinxShell.scala 83:27]
  assign cl_axi_mstr_bus_ARADDR = shell_io_mem_ar_bits_addr; // @[XilinxShell.scala 85:26]
  assign cl_axi_mstr_bus_ARID = 16'h0; // @[XilinxShell.scala 86:24]
  assign cl_axi_mstr_bus_ARUSER = 10'h0; // @[XilinxShell.scala 87:26]
  assign cl_axi_mstr_bus_ARLEN = shell_io_mem_ar_bits_len; // @[XilinxShell.scala 88:25]
  assign cl_axi_mstr_bus_ARSIZE = 3'h6; // @[XilinxShell.scala 89:26]
  assign cl_axi_mstr_bus_ARBURST = 2'h1; // @[XilinxShell.scala 90:27]
  assign cl_axi_mstr_bus_ARLOCK = 2'h0; // @[XilinxShell.scala 91:26]
  assign cl_axi_mstr_bus_ARCACHE = 4'h3; // @[XilinxShell.scala 92:27]
  assign cl_axi_mstr_bus_ARPROT = 3'h0; // @[XilinxShell.scala 93:26]
  assign cl_axi_mstr_bus_ARQOS = 4'h0; // @[XilinxShell.scala 94:25]
  assign cl_axi_mstr_bus_ARREGION = 4'h0; // @[XilinxShell.scala 95:28]
  assign cl_axi_mstr_bus_RREADY = shell_io_mem_r_ready; // @[XilinxShell.scala 98:26]
  assign axi_mstr_cfg_bus_ack = shell_io_host_ack; // @[XilinxShell.scala 110:24]
  assign axi_mstr_cfg_bus_rdata = shell_io_host_rdata; // @[XilinxShell.scala 111:26]
  assign shell_clock = ap_clk;
  assign shell_reset = ~ap_rst_n;
  assign shell_io_host_addr = axi_mstr_cfg_bus_addr; // @[XilinxShell.scala 106:22]
  assign shell_io_host_wdata = axi_mstr_cfg_bus_wdata; // @[XilinxShell.scala 107:23]
  assign shell_io_host_wr = axi_mstr_cfg_bus_wr; // @[XilinxShell.scala 108:20]
  assign shell_io_host_rd = axi_mstr_cfg_bus_rd; // @[XilinxShell.scala 109:20]
  assign shell_io_mem_aw_ready = cl_axi_mstr_bus_AWREADY; // @[XilinxShell.scala 56:25]
  assign shell_io_mem_w_ready = cl_axi_mstr_bus_WREADY; // @[XilinxShell.scala 70:24]
  assign shell_io_mem_b_valid = cl_axi_mstr_bus_BVALID; // @[XilinxShell.scala 77:24]
  assign shell_io_mem_ar_ready = cl_axi_mstr_bus_ARREADY; // @[XilinxShell.scala 84:25]
  assign shell_io_mem_r_valid = cl_axi_mstr_bus_RVALID; // @[XilinxShell.scala 97:24]
  assign shell_io_mem_r_bits_data = cl_axi_mstr_bus_RDATA; // @[XilinxShell.scala 99:28]
  assign shell_io_mem_r_bits_last = cl_axi_mstr_bus_RLAST; // @[XilinxShell.scala 101:28]
endmodule
