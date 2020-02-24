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
  input         io_vcr_ecnt_1_valid,
  input  [31:0] io_vcr_ecnt_1_bits,
  output [31:0] io_vcr_vals_0,
  output [31:0] io_vcr_vals_1
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
  wire  _T_18; // @[VCR.scala 135:51]
  wire  _T_19; // @[VCR.scala 135:33]
  wire  _T_21; // @[VCR.scala 141:45]
  wire  _T_22; // @[VCR.scala 141:27]
  wire  _T_24; // @[VCR.scala 141:45]
  wire  _T_25; // @[VCR.scala 141:27]
  wire  _T_26; // @[Decoupled.scala 40:37]
  wire  _T_27; // @[Mux.scala 80:60]
  wire  _T_29; // @[Mux.scala 80:60]
  wire  _T_31; // @[Mux.scala 80:60]
  wire  _T_33; // @[Mux.scala 80:60]
  wire  _T_35; // @[Mux.scala 80:60]
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
  assign _T_18 = 32'h8 == waddr; // @[VCR.scala 135:51]
  assign _T_19 = _T_11 & _T_18; // @[VCR.scala 135:33]
  assign _T_21 = 32'hc == waddr; // @[VCR.scala 141:45]
  assign _T_22 = _T_11 & _T_21; // @[VCR.scala 141:27]
  assign _T_24 = 32'h10 == waddr; // @[VCR.scala 141:45]
  assign _T_25 = _T_11 & _T_24; // @[VCR.scala 141:27]
  assign _T_26 = io_host_ar_ready & io_host_ar_valid; // @[Decoupled.scala 40:37]
  assign _T_27 = 32'h0 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_29 = 32'h4 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_31 = 32'h8 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_33 = 32'hc == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign _T_35 = 32'h10 == io_host_ar_bits_addr; // @[Mux.scala 80:60]
  assign io_host_aw_ready = wstate == 2'h0; // @[VCR.scala 103:20]
  assign io_host_w_ready = wstate == 2'h1; // @[VCR.scala 104:19]
  assign io_host_b_valid = wstate == 2'h2; // @[VCR.scala 105:19]
  assign io_host_ar_ready = rstate == 1'h0; // @[VCR.scala 121:20]
  assign io_host_r_valid = rstate; // @[VCR.scala 122:19]
  assign io_host_r_bits_data = rdata; // @[VCR.scala 123:23]
  assign io_vcr_launch = reg_0[0]; // @[VCR.scala 150:17]
  assign io_vcr_vals_0 = reg_3; // @[VCR.scala 153:20]
  assign io_vcr_vals_1 = reg_4; // @[VCR.scala 153:20]
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
    end else if (_T_26) begin
      if (_T_35) begin
        rdata <= reg_4;
      end else if (_T_33) begin
        rdata <= reg_3;
      end else if (_T_31) begin
        rdata <= reg_2;
      end else if (_T_29) begin
        rdata <= reg_1;
      end else if (_T_27) begin
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
    end else if (io_vcr_ecnt_1_valid) begin
      reg_2 <= io_vcr_ecnt_1_bits;
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
  end
endmodule
module SimpleCache(
  input   clock,
  input   reset,
  input   io_cpu_flush,
  output  io_cpu_flush_done
);
  reg [2:0] flush_state; // @[AXICache.scala 79:28]
  reg [31:0] _RAND_0;
  wire  _T_8; // @[AXICache.scala 105:51]
  reg [7:0] set_count; // @[Counter.scala 29:33]
  reg [31:0] _RAND_1;
  wire  _T_9; // @[Counter.scala 37:24]
  wire [7:0] _T_11; // @[Counter.scala 38:22]
  wire  set_wrap; // @[Counter.scala 72:20]
  wire [255:0] _T_235; // @[AXICache.scala 213:29]
  wire  _T_236; // @[AXICache.scala 213:29]
  wire  is_block_dirty; // @[AXICache.scala 213:41]
  wire  _T_297; // @[Conditional.scala 37:30]
  wire  _T_298; // @[Conditional.scala 37:30]
  wire  _T_300; // @[Conditional.scala 37:30]
  wire  _GEN_251; // @[Conditional.scala 39:67]
  assign _T_8 = flush_state == 3'h1; // @[AXICache.scala 105:51]
  assign _T_9 = set_count == 8'hff; // @[Counter.scala 37:24]
  assign _T_11 = set_count + 8'h1; // @[Counter.scala 38:22]
  assign set_wrap = _T_8 & _T_9; // @[Counter.scala 72:20]
  assign _T_235 = 256'h0 >> set_count; // @[AXICache.scala 213:29]
  assign _T_236 = _T_235[0]; // @[AXICache.scala 213:29]
  assign is_block_dirty = _T_236 & _T_236; // @[AXICache.scala 213:41]
  assign _T_297 = 3'h0 == flush_state; // @[Conditional.scala 37:30]
  assign _T_298 = 3'h1 == flush_state; // @[Conditional.scala 37:30]
  assign _T_300 = 3'h2 == flush_state; // @[Conditional.scala 37:30]
  assign _GEN_251 = _T_298 & set_wrap; // @[Conditional.scala 39:67]
  assign io_cpu_flush_done = _T_297 ? 1'h0 : _GEN_251; // @[AXICache.scala 233:21 AXICache.scala 349:27]
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
  flush_state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  set_count = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      flush_state <= 3'h0;
    end else if (_T_297) begin
      if (io_cpu_flush) begin
        flush_state <= 3'h1;
      end
    end else if (_T_298) begin
      if (set_wrap) begin
        flush_state <= 3'h0;
      end else if (is_block_dirty) begin
        flush_state <= 3'h2;
      end
    end else if (_T_300) begin
      flush_state <= 3'h3;
    end
    if (reset) begin
      set_count <= 8'h0;
    end else if (_T_8) begin
      set_count <= _T_11;
    end
  end
endmodule
module SplitCallNew(
  input         clock,
  input         reset,
  output        io_In_ready,
  input         io_In_valid,
  input  [31:0] io_In_bits_data_field1_data,
  input  [31:0] io_In_bits_data_field0_data,
  input         io_Out_enable_ready,
  output        io_Out_enable_valid,
  output        io_Out_enable_bits_control,
  input         io_Out_data_field1_0_ready,
  output        io_Out_data_field1_0_valid,
  output [63:0] io_Out_data_field1_0_bits_data,
  input         io_Out_data_field0_0_ready,
  output        io_Out_data_field0_0_valid,
  output [63:0] io_Out_data_field0_0_bits_data
);
  reg  inputReg_enable_control; // @[SplitDecoupled.scala 152:26]
  reg [31:0] _RAND_0;
  reg [31:0] inputReg_data_field1_data; // @[SplitDecoupled.scala 152:26]
  reg [31:0] _RAND_1;
  reg [31:0] inputReg_data_field0_data; // @[SplitDecoupled.scala 152:26]
  reg [31:0] _RAND_2;
  reg  enableValidReg; // @[SplitDecoupled.scala 154:31]
  reg [31:0] _RAND_3;
  reg  allValid_0; // @[SplitDecoupled.scala 157:49]
  reg [31:0] _RAND_4;
  reg  allValid_1; // @[SplitDecoupled.scala 157:49]
  reg [31:0] _RAND_5;
  reg  state; // @[SplitDecoupled.scala 166:22]
  reg [31:0] _RAND_6;
  wire  _T_1; // @[SplitDecoupled.scala 168:24]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Decoupled.scala 40:37]
  wire  _GEN_0; // @[SplitDecoupled.scala 172:27]
  wire  _GEN_2; // @[SplitDecoupled.scala 172:27]
  wire  _T_5; // @[SplitDecoupled.scala 178:36]
  wire  _T_6; // @[SplitDecoupled.scala 178:13]
  wire  _T_7; // @[SplitDecoupled.scala 178:45]
  wire  _T_8; // @[SplitDecoupled.scala 178:42]
  wire  _T_10; // @[SplitDecoupled.scala 186:24]
  wire  _GEN_20; // @[SplitDecoupled.scala 186:45]
  wire  _T_12; // @[SplitDecoupled.scala 189:32]
  wire  _GEN_22; // @[SplitDecoupled.scala 186:45]
  wire  _T_16; // @[SplitDecoupled.scala 189:32]
  wire  _GEN_24; // @[SplitDecoupled.scala 197:41]
  wire  _T_20; // @[SplitDecoupled.scala 200:28]
  assign _T_1 = state == 1'h0; // @[SplitDecoupled.scala 168:24]
  assign _T_2 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_3 = io_In_ready & io_In_valid; // @[Decoupled.scala 40:37]
  assign _GEN_0 = _T_3 | state; // @[SplitDecoupled.scala 172:27]
  assign _GEN_2 = _T_3 | inputReg_enable_control; // @[SplitDecoupled.scala 172:27]
  assign _T_5 = allValid_0 | allValid_1; // @[SplitDecoupled.scala 178:36]
  assign _T_6 = _T_5 == 1'h0; // @[SplitDecoupled.scala 178:13]
  assign _T_7 = enableValidReg == 1'h0; // @[SplitDecoupled.scala 178:45]
  assign _T_8 = _T_6 & _T_7; // @[SplitDecoupled.scala 178:42]
  assign _T_10 = io_In_valid & _T_1; // @[SplitDecoupled.scala 186:24]
  assign _GEN_20 = _T_10 | allValid_0; // @[SplitDecoupled.scala 186:45]
  assign _T_12 = state & io_Out_data_field0_0_ready; // @[SplitDecoupled.scala 189:32]
  assign _GEN_22 = _T_10 | allValid_1; // @[SplitDecoupled.scala 186:45]
  assign _T_16 = state & io_Out_data_field1_0_ready; // @[SplitDecoupled.scala 189:32]
  assign _GEN_24 = _T_10 | enableValidReg; // @[SplitDecoupled.scala 197:41]
  assign _T_20 = state & io_Out_enable_ready; // @[SplitDecoupled.scala 200:28]
  assign io_In_ready = state == 1'h0; // @[SplitDecoupled.scala 168:15]
  assign io_Out_enable_valid = enableValidReg; // @[SplitDecoupled.scala 203:23]
  assign io_Out_enable_bits_control = inputReg_enable_control; // @[SplitDecoupled.scala 204:22]
  assign io_Out_data_field1_0_valid = allValid_1; // @[SplitDecoupled.scala 192:40]
  assign io_Out_data_field1_0_bits_data = {{32'd0}, inputReg_data_field1_data}; // @[SplitDecoupled.scala 193:39]
  assign io_Out_data_field0_0_valid = allValid_0; // @[SplitDecoupled.scala 192:40]
  assign io_Out_data_field0_0_bits_data = {{32'd0}, inputReg_data_field0_data}; // @[SplitDecoupled.scala 193:39]
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
  inputReg_enable_control = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  inputReg_data_field1_data = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  inputReg_data_field0_data = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enableValidReg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  allValid_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  allValid_1 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  state = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      inputReg_enable_control <= 1'h0;
    end else if (_T_2) begin
      inputReg_enable_control <= _GEN_2;
    end
    if (reset) begin
      inputReg_data_field1_data <= 32'h0;
    end else if (_T_2) begin
      if (_T_3) begin
        inputReg_data_field1_data <= io_In_bits_data_field1_data;
      end
    end
    if (reset) begin
      inputReg_data_field0_data <= 32'h0;
    end else if (_T_2) begin
      if (_T_3) begin
        inputReg_data_field0_data <= io_In_bits_data_field0_data;
      end
    end
    if (reset) begin
      enableValidReg <= 1'h0;
    end else if (_T_20) begin
      enableValidReg <= 1'h0;
    end else begin
      enableValidReg <= _GEN_24;
    end
    if (reset) begin
      allValid_0 <= 1'h0;
    end else if (_T_12) begin
      allValid_0 <= 1'h0;
    end else begin
      allValid_0 <= _GEN_20;
    end
    if (reset) begin
      allValid_1 <= 1'h0;
    end else if (_T_16) begin
      allValid_1 <= 1'h0;
    end else begin
      allValid_1 <= _GEN_22;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_2) begin
      state <= _GEN_0;
    end else if (state) begin
      if (_T_8) begin
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
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg  in_data_R_0_control; // @[BasicBlock.scala 223:46]
  reg [31:0] _RAND_1;
  reg  in_data_valid_R_0; // @[BasicBlock.scala 224:52]
  reg [31:0] _RAND_2;
  reg  output_valid_R_0; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_3;
  reg  output_valid_R_1; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_4;
  reg  output_fire_R_0; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_5;
  reg  output_fire_R_1; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_6;
  wire  _T_7; // @[Decoupled.scala 40:37]
  wire  _GEN_3; // @[BasicBlock.scala 233:36]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _GEN_4; // @[BasicBlock.scala 245:28]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _GEN_6; // @[BasicBlock.scala 245:28]
  wire  out_fire_mask_0; // @[BasicBlock.scala 257:85]
  wire  out_fire_mask_1; // @[BasicBlock.scala 257:85]
  reg  state; // @[BasicBlock.scala 293:22]
  reg [31:0] _RAND_7;
  wire  _T_18; // @[Conditional.scala 37:30]
  wire  _T_21; // @[BasicBlock.scala 310:81]
  wire  _T_22; // @[BasicBlock.scala 310:81]
  wire  _T_23; // @[BasicBlock.scala 316:19]
  wire  _T_24; // @[BasicBlock.scala 316:19]
  wire  _GEN_8; // @[BasicBlock.scala 305:8]
  wire  _GEN_9; // @[BasicBlock.scala 305:8]
  wire  _GEN_12; // @[BasicBlock.scala 305:8]
  wire  _T_28; // @[BasicBlock.scala 329:35]
  wire  _GEN_35; // @[BasicBlock.scala 316:19]
  wire  _GEN_36; // @[BasicBlock.scala 316:19]
  wire  _GEN_38; // @[BasicBlock.scala 321:19]
  wire  _GEN_39; // @[BasicBlock.scala 321:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_7 = io_predicateIn_0_ready & io_predicateIn_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_3 = _T_7 | in_data_valid_R_0; // @[BasicBlock.scala 233:36]
  assign _T_8 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_4 = _T_8 | output_fire_R_0; // @[BasicBlock.scala 245:28]
  assign _T_9 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _GEN_6 = _T_9 | output_fire_R_1; // @[BasicBlock.scala 245:28]
  assign out_fire_mask_0 = output_fire_R_0 | _T_8; // @[BasicBlock.scala 257:85]
  assign out_fire_mask_1 = output_fire_R_1 | _T_9; // @[BasicBlock.scala 257:85]
  assign _T_18 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_21 = _T_8 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_22 = _T_9 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_23 = $unsigned(reset); // @[BasicBlock.scala 316:19]
  assign _T_24 = _T_23 == 1'h0; // @[BasicBlock.scala 316:19]
  assign _GEN_8 = _GEN_3 | output_valid_R_0; // @[BasicBlock.scala 305:8]
  assign _GEN_9 = _GEN_3 | output_valid_R_1; // @[BasicBlock.scala 305:8]
  assign _GEN_12 = _GEN_3 | state; // @[BasicBlock.scala 305:8]
  assign _T_28 = out_fire_mask_0 & out_fire_mask_1; // @[BasicBlock.scala 329:35]
  assign io_predicateIn_0_ready = ~ in_data_valid_R_0; // @[BasicBlock.scala 232:29]
  assign io_Out_0_valid = _T_18 ? _GEN_8 : output_valid_R_0; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_0_bits_control = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 283:22]
  assign io_Out_1_valid = _T_18 ? _GEN_9 : output_valid_R_1; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign _GEN_35 = _T_18 & _GEN_3; // @[BasicBlock.scala 316:19]
  assign _GEN_36 = _GEN_35 & in_data_R_0_control; // @[BasicBlock.scala 316:19]
  assign _GEN_38 = in_data_R_0_control == 1'h0; // @[BasicBlock.scala 321:19]
  assign _GEN_39 = _GEN_35 & _GEN_38; // @[BasicBlock.scala 321:19]
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
  cycleCount = _RAND_0[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_data_R_0_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  output_valid_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  output_valid_R_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  output_fire_R_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  output_fire_R_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  state = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_2;
    end
    if (reset) begin
      in_data_R_0_control <= 1'h0;
    end else if (_T_18) begin
      if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (state) begin
      if (_T_28) begin
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
      in_data_valid_R_0 <= _GEN_3;
    end else if (state) begin
      if (_T_28) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_3;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_3;
    end
    if (reset) begin
      output_valid_R_0 <= 1'h0;
    end else if (_T_18) begin
      if (_GEN_3) begin
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
      if (_GEN_3) begin
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
      output_fire_R_0 <= _GEN_4;
    end else if (state) begin
      if (_T_28) begin
        output_fire_R_0 <= 1'h0;
      end else begin
        output_fire_R_0 <= _GEN_4;
      end
    end else begin
      output_fire_R_0 <= _GEN_4;
    end
    if (reset) begin
      output_fire_R_1 <= 1'h0;
    end else if (_T_18) begin
      output_fire_R_1 <= _GEN_6;
    end else if (state) begin
      if (_T_28) begin
        output_fire_R_1 <= 1'h0;
      end else begin
        output_fire_R_1 <= _GEN_6;
      end
    end else begin
      output_fire_R_1 <= _GEN_6;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_18) begin
      state <= _GEN_12;
    end else if (state) begin
      if (_T_28) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID->%d] [BB]   bb_entry0: Output [T] fired @ %d\n",5'h0,cycleCount); // @[BasicBlock.scala 316:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_39 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID->%d] [BB]   bb_entry0: Output [F] fired @ %d\n",5'h0,cycleCount); // @[BasicBlock.scala 321:19]
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
  wire [127:0] _T_24; // @[Alu.scala 195:32]
  assign _T_24 = io_in1 * io_in2; // @[Alu.scala 195:32]
  assign io_out = _T_24[63:0]; // @[Alu.scala 236:10]
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
  wire [63:0] FU_io_in1; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_in2; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_out; // @[ComputeNode.scala 52:18]
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_1;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_2;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_3;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_3; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_4;
  wire [14:0] _T_6; // @[Counter.scala 38:22]
  reg [63:0] left_R_data; // @[ComputeNode.scala 44:23]
  reg [63:0] _RAND_5;
  reg  left_valid_R; // @[ComputeNode.scala 45:29]
  reg [31:0] _RAND_6;
  reg [63:0] right_R_data; // @[ComputeNode.scala 48:24]
  reg [63:0] _RAND_7;
  reg  right_valid_R; // @[ComputeNode.scala 49:30]
  reg [31:0] _RAND_8;
  reg  state; // @[ComputeNode.scala 55:22]
  reg [31:0] _RAND_9;
  reg [63:0] out_data_R; // @[ComputeNode.scala 59:27]
  reg [63:0] _RAND_10;
  wire  _T_12; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[ComputeNode.scala 71:26]
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[ComputeNode.scala 77:27]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire  _T_17; // @[ComputeNode.scala 96:27]
  wire  _T_18; // @[ComputeNode.scala 96:43]
  wire  _T_21; // @[HandShaking.scala 233:72]
  wire  _T_22; // @[ComputeNode.scala 104:17]
  wire  _T_23; // @[ComputeNode.scala 104:17]
  wire [63:0] _T_19_data; // @[interfaces.scala 306:20 interfaces.scala 307:15]
  wire [63:0] _GEN_14; // @[ComputeNode.scala 96:61]
  wire  _GEN_17; // @[ComputeNode.scala 96:61]
  wire  _GEN_21; // @[ComputeNode.scala 96:61]
  wire  _T_26; // @[HandShaking.scala 218:83]
  wire  _GEN_41; // @[ComputeNode.scala 104:17]
  UALU FU ( // @[ComputeNode.scala 52:18]
    .io_in1(FU_io_in1),
    .io_in2(FU_io_in2),
    .io_out(FU_io_out)
  );
  assign _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_3 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_12 = io_LeftIO_ready & io_LeftIO_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_12 | left_valid_R; // @[ComputeNode.scala 71:26]
  assign _T_14 = io_RightIO_ready & io_RightIO_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_14 | right_valid_R; // @[ComputeNode.scala 77:27]
  assign _T_16 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_17 = enable_valid_R & left_valid_R; // @[ComputeNode.scala 96:27]
  assign _T_18 = _T_17 & right_valid_R; // @[ComputeNode.scala 96:43]
  assign _T_21 = _T_1 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _T_22 = $unsigned(reset); // @[ComputeNode.scala 104:17]
  assign _T_23 = _T_22 == 1'h0; // @[ComputeNode.scala 104:17]
  assign _T_19_data = FU_io_out; // @[interfaces.scala 306:20 interfaces.scala 307:15]
  assign _GEN_14 = _T_18 ? _T_19_data : out_data_R; // @[ComputeNode.scala 96:61]
  assign _GEN_17 = _T_18 | out_valid_R_0; // @[ComputeNode.scala 96:61]
  assign _GEN_21 = _T_18 | state; // @[ComputeNode.scala 96:61]
  assign _T_26 = out_ready_R_0 | _T_1; // @[HandShaking.scala 218:83]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 192:19]
  assign io_Out_0_valid = _T_16 ? _GEN_17 : out_valid_R_0; // @[HandShaking.scala 181:21 ComputeNode.scala 98:32]
  assign io_Out_0_bits_data = _T_16 ? _GEN_14 : out_data_R; // @[ComputeNode.scala 89:25 ComputeNode.scala 97:31]
  assign io_LeftIO_ready = ~ left_valid_R; // @[ComputeNode.scala 70:19]
  assign io_RightIO_ready = ~ right_valid_R; // @[ComputeNode.scala 76:20]
  assign FU_io_in1 = left_R_data; // @[ComputeNode.scala 67:13]
  assign FU_io_in2 = right_R_data; // @[ComputeNode.scala 68:13]
  assign _GEN_41 = _T_16 & _T_18; // @[ComputeNode.scala 104:17]
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
  enable_R_control = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_valid_R = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  cycleCount = _RAND_4[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  left_R_data = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  left_valid_R = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  right_R_data = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  right_valid_R = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  state = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {2{`RANDOM}};
  out_data_R = _RAND_10[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_3) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_16) begin
      if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_26) begin
        enable_valid_R <= 1'h0;
      end else if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_3) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_16) begin
      if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_26) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_1) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_16) begin
      if (_T_18) begin
        out_valid_R_0 <= _T_21;
      end else if (_T_1) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_1) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_6;
    end
    if (reset) begin
      left_R_data <= 64'h0;
    end else if (_T_12) begin
      left_R_data <= io_LeftIO_bits_data;
    end
    if (reset) begin
      left_valid_R <= 1'h0;
    end else if (_T_16) begin
      if (_T_18) begin
        left_valid_R <= 1'h0;
      end else begin
        left_valid_R <= _GEN_9;
      end
    end else begin
      left_valid_R <= _GEN_9;
    end
    if (reset) begin
      right_R_data <= 64'h0;
    end else if (_T_14) begin
      right_R_data <= io_RightIO_bits_data;
    end
    if (reset) begin
      right_valid_R <= 1'h0;
    end else if (_T_16) begin
      if (_T_18) begin
        right_valid_R <= 1'h0;
      end else begin
        right_valid_R <= _GEN_13;
      end
    end else begin
      right_valid_R <= _GEN_13;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_16) begin
      state <= _GEN_21;
    end else if (state) begin
      if (_T_26) begin
        state <= 1'h0;
      end
    end
    if (reset) begin
      out_data_R <= 64'h0;
    end else if (_T_16) begin
      if (enable_R_control) begin
        out_data_R <= FU_io_out;
      end else begin
        out_data_R <= 64'h0;
      end
    end else if (state) begin
      if (_T_26) begin
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
        if (_GEN_41 & _T_23) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID->%d] [COMPUTE] binaryOp_mul0: Output fired @ %d, Value: %d (%d + %d)\n",5'h0,cycleCount,FU_io_out,left_R_data,right_R_data); // @[ComputeNode.scala 104:17]
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
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg  state; // @[RetNode.scala 133:22]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[RetNode.scala 136:31]
  reg [31:0] _RAND_2;
  reg  in_data_valid_R_0; // @[RetNode.scala 139:58]
  reg [31:0] _RAND_3;
  reg [31:0] output_R_data_field0_data; // @[RetNode.scala 142:25]
  reg [31:0] _RAND_4;
  reg  out_ready_R; // @[RetNode.scala 143:28]
  reg [31:0] _RAND_5;
  reg  out_valid_R; // @[RetNode.scala 144:28]
  reg [31:0] _RAND_6;
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _GEN_7; // @[RetNode.scala 164:41]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[RetNode.scala 174:23]
  wire  _T_10; // @[Conditional.scala 37:30]
  wire  _GEN_10; // @[RetNode.scala 182:27]
  wire  _GEN_11; // @[RetNode.scala 182:27]
  wire  _T_12; // @[RetNode.scala 200:17]
  wire  _T_13; // @[RetNode.scala 200:17]
  wire  _GEN_29; // @[RetNode.scala 200:17]
  wire  _GEN_30; // @[RetNode.scala 200:17]
  wire  _GEN_31; // @[RetNode.scala 200:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_6 = io_In_enable_ready & io_In_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_In_data_field0_ready & io_In_data_field0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_7 = _T_8 | in_data_valid_R_0; // @[RetNode.scala 164:41]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_9 ? 1'h0 : out_valid_R; // @[RetNode.scala 174:23]
  assign _T_10 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _GEN_10 = in_data_valid_R_0 | _GEN_9; // @[RetNode.scala 182:27]
  assign _GEN_11 = in_data_valid_R_0 | state; // @[RetNode.scala 182:27]
  assign _T_12 = $unsigned(reset); // @[RetNode.scala 200:17]
  assign _T_13 = _T_12 == 1'h0; // @[RetNode.scala 200:17]
  assign io_In_enable_ready = ~ enable_valid_R; // @[RetNode.scala 155:22]
  assign io_In_data_field0_ready = ~ in_data_valid_R_0; // @[RetNode.scala 163:34]
  assign io_Out_valid = out_valid_R; // @[RetNode.scala 172:16]
  assign io_Out_bits_data_field0_data = output_R_data_field0_data; // @[RetNode.scala 171:15]
  assign _GEN_29 = _T_10 == 1'h0; // @[RetNode.scala 200:17]
  assign _GEN_30 = _GEN_29 & state; // @[RetNode.scala 200:17]
  assign _GEN_31 = _GEN_30 & out_ready_R; // @[RetNode.scala 200:17]
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
  cycleCount = _RAND_0[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  output_R_data_field0_data = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_ready_R = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_valid_R = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_2;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_10) begin
      if (enable_valid_R) begin
        state <= _GEN_11;
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
      in_data_valid_R_0 <= _GEN_7;
    end else if (state) begin
      if (out_ready_R) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_7;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_7;
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
        out_valid_R <= _GEN_10;
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
        if (_GEN_31 & _T_13) begin
          $fwrite(32'h80000002,"[LOG] [Test01] [TID->%d] [RET] ret_1: Output fired @ %d\n",5'h0,cycleCount); // @[RetNode.scala 200:17]
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
  input  [31:0] io_in_bits_data_field1_data,
  input  [31:0] io_in_bits_data_field0_data,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data_field0_data
);
  wire  InputSplitter_clock; // @[test01.scala 38:29]
  wire  InputSplitter_reset; // @[test01.scala 38:29]
  wire  InputSplitter_io_In_ready; // @[test01.scala 38:29]
  wire  InputSplitter_io_In_valid; // @[test01.scala 38:29]
  wire [31:0] InputSplitter_io_In_bits_data_field1_data; // @[test01.scala 38:29]
  wire [31:0] InputSplitter_io_In_bits_data_field0_data; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_enable_ready; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_enable_valid; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_enable_bits_control; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_data_field1_0_ready; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_data_field1_0_valid; // @[test01.scala 38:29]
  wire [63:0] InputSplitter_io_Out_data_field1_0_bits_data; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_data_field0_0_ready; // @[test01.scala 38:29]
  wire  InputSplitter_io_Out_data_field0_0_valid; // @[test01.scala 38:29]
  wire [63:0] InputSplitter_io_Out_data_field0_0_bits_data; // @[test01.scala 38:29]
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
  SplitCallNew InputSplitter ( // @[test01.scala 38:29]
    .clock(InputSplitter_clock),
    .reset(InputSplitter_reset),
    .io_In_ready(InputSplitter_io_In_ready),
    .io_In_valid(InputSplitter_io_In_valid),
    .io_In_bits_data_field1_data(InputSplitter_io_In_bits_data_field1_data),
    .io_In_bits_data_field0_data(InputSplitter_io_In_bits_data_field0_data),
    .io_Out_enable_ready(InputSplitter_io_Out_enable_ready),
    .io_Out_enable_valid(InputSplitter_io_Out_enable_valid),
    .io_Out_enable_bits_control(InputSplitter_io_Out_enable_bits_control),
    .io_Out_data_field1_0_ready(InputSplitter_io_Out_data_field1_0_ready),
    .io_Out_data_field1_0_valid(InputSplitter_io_Out_data_field1_0_valid),
    .io_Out_data_field1_0_bits_data(InputSplitter_io_Out_data_field1_0_bits_data),
    .io_Out_data_field0_0_ready(InputSplitter_io_Out_data_field0_0_ready),
    .io_Out_data_field0_0_valid(InputSplitter_io_Out_data_field0_0_valid),
    .io_Out_data_field0_0_bits_data(InputSplitter_io_Out_data_field0_0_bits_data)
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
  assign io_in_ready = InputSplitter_io_In_ready; // @[test01.scala 39:23]
  assign io_out_valid = ret_1_io_Out_valid; // @[test01.scala 195:10]
  assign io_out_bits_data_field0_data = ret_1_io_Out_bits_data_field0_data; // @[test01.scala 195:10]
  assign InputSplitter_clock = clock;
  assign InputSplitter_reset = reset;
  assign InputSplitter_io_In_valid = io_in_valid; // @[test01.scala 39:23]
  assign InputSplitter_io_In_bits_data_field1_data = io_in_bits_data_field1_data; // @[test01.scala 39:23]
  assign InputSplitter_io_In_bits_data_field0_data = io_in_bits_data_field0_data; // @[test01.scala 39:23]
  assign InputSplitter_io_Out_enable_ready = bb_entry0_io_predicateIn_0_ready; // @[test01.scala 79:31]
  assign InputSplitter_io_Out_data_field1_0_ready = binaryOp_mul0_io_LeftIO_ready; // @[test01.scala 187:27]
  assign InputSplitter_io_Out_data_field0_0_ready = binaryOp_mul0_io_RightIO_ready; // @[test01.scala 185:28]
  assign bb_entry0_clock = clock;
  assign bb_entry0_reset = reset;
  assign bb_entry0_io_predicateIn_0_valid = InputSplitter_io_Out_enable_valid; // @[test01.scala 79:31]
  assign bb_entry0_io_predicateIn_0_bits_control = InputSplitter_io_Out_enable_bits_control; // @[test01.scala 79:31]
  assign bb_entry0_io_Out_0_ready = binaryOp_mul0_io_enable_ready; // @[test01.scala 147:27]
  assign bb_entry0_io_Out_1_ready = ret_1_io_In_enable_ready; // @[test01.scala 150:22]
  assign binaryOp_mul0_clock = clock;
  assign binaryOp_mul0_reset = reset;
  assign binaryOp_mul0_io_enable_valid = bb_entry0_io_Out_0_valid; // @[test01.scala 147:27]
  assign binaryOp_mul0_io_enable_bits_control = bb_entry0_io_Out_0_bits_control; // @[test01.scala 147:27]
  assign binaryOp_mul0_io_Out_0_ready = ret_1_io_In_data_field0_ready; // @[test01.scala 183:30]
  assign binaryOp_mul0_io_LeftIO_valid = InputSplitter_io_Out_data_field1_0_valid; // @[test01.scala 187:27]
  assign binaryOp_mul0_io_LeftIO_bits_data = InputSplitter_io_Out_data_field1_0_bits_data; // @[test01.scala 187:27]
  assign binaryOp_mul0_io_RightIO_valid = InputSplitter_io_Out_data_field0_0_valid; // @[test01.scala 185:28]
  assign binaryOp_mul0_io_RightIO_bits_data = InputSplitter_io_Out_data_field0_0_bits_data; // @[test01.scala 185:28]
  assign ret_1_clock = clock;
  assign ret_1_reset = reset;
  assign ret_1_io_In_enable_valid = bb_entry0_io_Out_1_valid; // @[test01.scala 150:22]
  assign ret_1_io_In_data_field0_valid = binaryOp_mul0_io_Out_0_valid; // @[test01.scala 183:30]
  assign ret_1_io_In_data_field0_bits_data = binaryOp_mul0_io_Out_0_bits_data[31:0]; // @[test01.scala 183:30]
  assign ret_1_io_Out_ready = io_out_ready; // @[test01.scala 195:10]
endmodule
module DandelionCacheShell(
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
  output [31:0] io_host_r_bits_data
);
  wire  vcr_clock; // @[DandelionShell.scala 164:19]
  wire  vcr_reset; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_aw_ready; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_aw_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_host_aw_bits_addr; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_w_ready; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_w_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_host_w_bits_data; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_b_ready; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_b_valid; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_ar_ready; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_ar_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_host_ar_bits_addr; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_r_ready; // @[DandelionShell.scala 164:19]
  wire  vcr_io_host_r_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_host_r_bits_data; // @[DandelionShell.scala 164:19]
  wire  vcr_io_vcr_launch; // @[DandelionShell.scala 164:19]
  wire  vcr_io_vcr_finish; // @[DandelionShell.scala 164:19]
  wire  vcr_io_vcr_ecnt_0_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_vcr_ecnt_0_bits; // @[DandelionShell.scala 164:19]
  wire  vcr_io_vcr_ecnt_1_valid; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_vcr_ecnt_1_bits; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_vcr_vals_0; // @[DandelionShell.scala 164:19]
  wire [31:0] vcr_io_vcr_vals_1; // @[DandelionShell.scala 164:19]
  wire  cache_clock; // @[DandelionShell.scala 165:21]
  wire  cache_reset; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_flush; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_flush_done; // @[DandelionShell.scala 165:21]
  wire  accel_clock; // @[DandelionShell.scala 167:21]
  wire  accel_reset; // @[DandelionShell.scala 167:21]
  wire  accel_io_in_ready; // @[DandelionShell.scala 167:21]
  wire  accel_io_in_valid; // @[DandelionShell.scala 167:21]
  wire [31:0] accel_io_in_bits_data_field1_data; // @[DandelionShell.scala 167:21]
  wire [31:0] accel_io_in_bits_data_field0_data; // @[DandelionShell.scala 167:21]
  wire  accel_io_out_ready; // @[DandelionShell.scala 167:21]
  wire  accel_io_out_valid; // @[DandelionShell.scala 167:21]
  wire [31:0] accel_io_out_bits_data_field0_data; // @[DandelionShell.scala 167:21]
  reg [1:0] state; // @[DandelionShell.scala 174:22]
  reg [31:0] _RAND_0;
  reg [31:0] cycles; // @[DandelionShell.scala 175:23]
  reg [31:0] _RAND_1;
  wire  _T; // @[DandelionShell.scala 180:14]
  wire  _T_1; // @[DandelionShell.scala 182:20]
  wire [31:0] _T_3; // @[DandelionShell.scala 183:22]
  reg [63:0] vals_0; // @[Reg.scala 27:20]
  reg [63:0] _RAND_2;
  reg [63:0] vals_1; // @[Reg.scala 27:20]
  reg [63:0] _RAND_3;
  wire  _T_9; // @[Conditional.scala 37:30]
  wire  _T_10; // @[DandelionShell.scala 230:15]
  wire  _T_11; // @[DandelionShell.scala 230:15]
  wire  _T_20; // @[Decoupled.scala 40:37]
  wire  _GEN_5; // @[DandelionShell.scala 229:31]
  wire  _T_21; // @[Conditional.scala 37:30]
  wire  _T_22; // @[Decoupled.scala 40:37]
  wire  _T_23; // @[Conditional.scala 37:30]
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_17; // @[DandelionShell.scala 230:15]
  VCR vcr ( // @[DandelionShell.scala 164:19]
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
    .io_vcr_ecnt_1_valid(vcr_io_vcr_ecnt_1_valid),
    .io_vcr_ecnt_1_bits(vcr_io_vcr_ecnt_1_bits),
    .io_vcr_vals_0(vcr_io_vcr_vals_0),
    .io_vcr_vals_1(vcr_io_vcr_vals_1)
  );
  SimpleCache cache ( // @[DandelionShell.scala 165:21]
    .clock(cache_clock),
    .reset(cache_reset),
    .io_cpu_flush(cache_io_cpu_flush),
    .io_cpu_flush_done(cache_io_cpu_flush_done)
  );
  test01DF accel ( // @[DandelionShell.scala 167:21]
    .clock(accel_clock),
    .reset(accel_reset),
    .io_in_ready(accel_io_in_ready),
    .io_in_valid(accel_io_in_valid),
    .io_in_bits_data_field1_data(accel_io_in_bits_data_field1_data),
    .io_in_bits_data_field0_data(accel_io_in_bits_data_field0_data),
    .io_out_ready(accel_io_out_ready),
    .io_out_valid(accel_io_out_valid),
    .io_out_bits_data_field0_data(accel_io_out_bits_data_field0_data)
  );
  assign _T = state == 2'h0; // @[DandelionShell.scala 180:14]
  assign _T_1 = state != 2'h2; // @[DandelionShell.scala 182:20]
  assign _T_3 = cycles + 32'h1; // @[DandelionShell.scala 183:22]
  assign _T_9 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_10 = $unsigned(reset); // @[DandelionShell.scala 230:15]
  assign _T_11 = _T_10 == 1'h0; // @[DandelionShell.scala 230:15]
  assign _T_20 = accel_io_in_ready & accel_io_in_valid; // @[Decoupled.scala 40:37]
  assign _GEN_5 = vcr_io_vcr_launch; // @[DandelionShell.scala 229:31]
  assign _T_21 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_22 = accel_io_out_ready & accel_io_out_valid; // @[Decoupled.scala 40:37]
  assign _T_23 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_24 = 2'h3 == state; // @[Conditional.scala 37:30]
  assign _GEN_13 = _T_21 ? 1'h0 : _T_23; // @[Conditional.scala 39:67]
  assign io_host_aw_ready = vcr_io_host_aw_ready; // @[DandelionShell.scala 261:11]
  assign io_host_w_ready = vcr_io_host_w_ready; // @[DandelionShell.scala 261:11]
  assign io_host_b_valid = vcr_io_host_b_valid; // @[DandelionShell.scala 261:11]
  assign io_host_ar_ready = vcr_io_host_ar_ready; // @[DandelionShell.scala 261:11]
  assign io_host_r_valid = vcr_io_host_r_valid; // @[DandelionShell.scala 261:11]
  assign io_host_r_bits_data = vcr_io_host_r_bits_data; // @[DandelionShell.scala 261:11]
  assign vcr_clock = clock;
  assign vcr_reset = reset;
  assign vcr_io_host_aw_valid = io_host_aw_valid; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_aw_bits_addr = io_host_aw_bits_addr; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_w_valid = io_host_w_valid; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_w_bits_data = io_host_w_bits_data; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_b_ready = io_host_b_ready; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_ar_valid = io_host_ar_valid; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_ar_bits_addr = io_host_ar_bits_addr; // @[DandelionShell.scala 261:11]
  assign vcr_io_host_r_ready = io_host_r_ready; // @[DandelionShell.scala 261:11]
  assign vcr_io_vcr_finish = state == 2'h3; // @[DandelionShell.scala 258:21]
  assign vcr_io_vcr_ecnt_0_valid = state == 2'h3; // @[DandelionShell.scala 190:28]
  assign vcr_io_vcr_ecnt_0_bits = cycles; // @[DandelionShell.scala 191:27]
  assign vcr_io_vcr_ecnt_1_valid = accel_io_out_valid; // @[DandelionShell.scala 196:32]
  assign vcr_io_vcr_ecnt_1_bits = accel_io_out_bits_data_field0_data; // @[DandelionShell.scala 195:31]
  assign cache_clock = clock;
  assign cache_reset = reset;
  assign cache_io_cpu_flush = _T_9 ? 1'h0 : _GEN_13; // @[DandelionShell.scala 225:22 DandelionShell.scala 247:26]
  assign accel_clock = clock;
  assign accel_reset = reset;
  assign accel_io_in_valid = _T_9 & _GEN_5; // @[DandelionShell.scala 221:21 DandelionShell.scala 235:27]
  assign accel_io_in_bits_data_field1_data = vals_1[31:0]; // @[DandelionShell.scala 215:41]
  assign accel_io_in_bits_data_field0_data = vals_0[31:0]; // @[DandelionShell.scala 215:41]
  assign accel_io_out_ready = state == 2'h1; // @[DandelionShell.scala 222:22]
  assign _GEN_17 = _T_9 & vcr_io_vcr_launch; // @[DandelionShell.scala 230:15]
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
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cycles = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  vals_0 = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  vals_1 = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_9) begin
      if (vcr_io_vcr_launch) begin
        if (_T_20) begin
          state <= 2'h1;
        end
      end
    end else if (_T_21) begin
      if (_T_22) begin
        state <= 2'h2;
      end
    end else if (_T_23) begin
      if (cache_io_cpu_flush_done) begin
        state <= 2'h3;
      end
    end else if (_T_24) begin
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
      vals_0 <= {{32'd0}, vcr_io_vcr_vals_0};
    end
    if (reset) begin
      vals_1 <= 64'h0;
    end else if (_T) begin
      vals_1 <= {{32'd0}, vcr_io_vcr_vals_1};
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_11) begin
          $fwrite(32'h80000002,"Ptrs: "); // @[DandelionShell.scala 230:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_11) begin
          $fwrite(32'h80000002,"\nVals: "); // @[DandelionShell.scala 232:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_11) begin
          $fwrite(32'h80000002,"val(0): %d, ",vals_0); // @[DandelionShell.scala 233:46]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_11) begin
          $fwrite(32'h80000002,"val(1): %d, ",vals_1); // @[DandelionShell.scala 233:46]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_17 & _T_11) begin
          $fwrite(32'h80000002,"\n"); // @[DandelionShell.scala 234:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module DandelionF1Accel(
  input         ap_clk,
  input         ap_rst_n,
  input         s_axi_control_AWVALID,
  output        s_axi_control_AWREADY,
  input  [31:0] s_axi_control_AWADDR,
  input         s_axi_control_WVALID,
  output        s_axi_control_WREADY,
  input  [31:0] s_axi_control_WDATA,
  input  [3:0]  s_axi_control_WSTRB,
  output        s_axi_control_BVALID,
  input         s_axi_control_BREADY,
  output [1:0]  s_axi_control_BRESP,
  input         s_axi_control_ARVALID,
  output        s_axi_control_ARREADY,
  input  [31:0] s_axi_control_ARADDR,
  output        s_axi_control_RVALID,
  input         s_axi_control_RREADY,
  output [31:0] s_axi_control_RDATA,
  output [1:0]  s_axi_control_RRESP
);
  wire  shell_clock; // @[XilinxShell.scala 50:11]
  wire  shell_reset; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_aw_ready; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_aw_valid; // @[XilinxShell.scala 50:11]
  wire [31:0] shell_io_host_aw_bits_addr; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_w_ready; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_w_valid; // @[XilinxShell.scala 50:11]
  wire [31:0] shell_io_host_w_bits_data; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_b_ready; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_b_valid; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_ar_ready; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_ar_valid; // @[XilinxShell.scala 50:11]
  wire [31:0] shell_io_host_ar_bits_addr; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_r_ready; // @[XilinxShell.scala 50:11]
  wire  shell_io_host_r_valid; // @[XilinxShell.scala 50:11]
  wire [31:0] shell_io_host_r_bits_data; // @[XilinxShell.scala 50:11]
  DandelionCacheShell shell ( // @[XilinxShell.scala 50:11]
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
    .io_host_r_bits_data(shell_io_host_r_bits_data)
  );
  assign s_axi_control_AWREADY = shell_io_host_aw_ready; // @[XilinxShell.scala 108:25]
  assign s_axi_control_WREADY = shell_io_host_w_ready; // @[XilinxShell.scala 112:24]
  assign s_axi_control_BVALID = shell_io_host_b_valid; // @[XilinxShell.scala 116:24]
  assign s_axi_control_BRESP = 2'h0; // @[XilinxShell.scala 118:23]
  assign s_axi_control_ARREADY = shell_io_host_ar_ready; // @[XilinxShell.scala 121:25]
  assign s_axi_control_RVALID = shell_io_host_r_valid; // @[XilinxShell.scala 124:24]
  assign s_axi_control_RDATA = shell_io_host_r_bits_data; // @[XilinxShell.scala 126:23]
  assign s_axi_control_RRESP = 2'h0; // @[XilinxShell.scala 127:23]
  assign shell_clock = ap_clk;
  assign shell_reset = ~ ap_rst_n;
  assign shell_io_host_aw_valid = s_axi_control_AWVALID; // @[XilinxShell.scala 107:26]
  assign shell_io_host_aw_bits_addr = s_axi_control_AWADDR; // @[XilinxShell.scala 109:30]
  assign shell_io_host_w_valid = s_axi_control_WVALID; // @[XilinxShell.scala 111:25]
  assign shell_io_host_w_bits_data = s_axi_control_WDATA; // @[XilinxShell.scala 113:29]
  assign shell_io_host_b_ready = s_axi_control_BREADY; // @[XilinxShell.scala 117:25]
  assign shell_io_host_ar_valid = s_axi_control_ARVALID; // @[XilinxShell.scala 120:26]
  assign shell_io_host_ar_bits_addr = s_axi_control_ARADDR; // @[XilinxShell.scala 122:30]
  assign shell_io_host_r_ready = s_axi_control_RREADY; // @[XilinxShell.scala 125:25]
endmodule
