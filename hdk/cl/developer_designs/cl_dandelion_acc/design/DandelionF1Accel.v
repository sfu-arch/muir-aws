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
  output [63:0] io_vcr_ptrs_0
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
  assign io_vcr_ptrs_0 = {reg_4,reg_3}; // @[VCR.scala 162:22]
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
  input         clock,
  input         reset,
  input         io_cpu_flush,
  output        io_cpu_flush_done,
  output        io_cpu_req_ready,
  input         io_cpu_req_valid,
  input  [63:0] io_cpu_req_bits_addr,
  input  [63:0] io_cpu_req_bits_data,
  input  [7:0]  io_cpu_req_bits_mask,
  input  [7:0]  io_cpu_req_bits_tag,
  input         io_cpu_req_bits_iswrite,
  output        io_cpu_resp_valid,
  output [63:0] io_cpu_resp_bits_data,
  output [7:0]  io_cpu_resp_bits_tag,
  output        io_cpu_resp_bits_iswrite
);
  reg [50:0] metaMem_tag [0:255]; // @[AXICache.scala 88:20]
  reg [63:0] _RAND_0;
  wire [50:0] metaMem_tag__T_97_data; // @[AXICache.scala 88:20]
  wire [7:0] metaMem_tag__T_97_addr; // @[AXICache.scala 88:20]
  wire [50:0] metaMem_tag__T_299_data; // @[AXICache.scala 88:20]
  wire [7:0] metaMem_tag__T_299_addr; // @[AXICache.scala 88:20]
  wire [50:0] metaMem_tag__T_153_data; // @[AXICache.scala 88:20]
  wire [7:0] metaMem_tag__T_153_addr; // @[AXICache.scala 88:20]
  wire  metaMem_tag__T_153_mask; // @[AXICache.scala 88:20]
  wire  metaMem_tag__T_153_en; // @[AXICache.scala 88:20]
  reg [7:0] dataMem_0_0 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_1;
  wire [7:0] dataMem_0_0__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_0__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_0__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_0__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_0__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_0__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_0__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_0__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_1 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_2;
  wire [7:0] dataMem_0_1__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_1__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_1__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_1__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_1__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_1__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_1__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_1__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_2 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_3;
  wire [7:0] dataMem_0_2__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_2__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_2__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_2__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_2__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_2__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_2__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_2__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_3 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_4;
  wire [7:0] dataMem_0_3__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_3__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_3__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_3__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_3__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_3__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_3__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_3__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_4 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_5;
  wire [7:0] dataMem_0_4__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_4__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_4__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_4__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_4__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_4__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_4__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_4__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_5 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_6;
  wire [7:0] dataMem_0_5__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_5__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_5__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_5__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_5__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_5__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_5__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_5__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_6 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_7;
  wire [7:0] dataMem_0_6__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_6__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_6__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_6__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_6__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_6__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_6__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_6__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_0_7 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_8;
  wire [7:0] dataMem_0_7__T_14_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_7__T_14_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_7__T_63_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_7__T_63_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_7__T_172_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_0_7__T_172_addr; // @[AXICache.scala 89:37]
  wire  dataMem_0_7__T_172_mask; // @[AXICache.scala 89:37]
  wire  dataMem_0_7__T_172_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_0 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_9;
  wire [7:0] dataMem_1_0__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_0__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_0__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_0__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_0__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_0__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_0__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_0__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_1 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_10;
  wire [7:0] dataMem_1_1__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_1__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_1__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_1__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_1__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_1__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_1__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_1__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_2 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_11;
  wire [7:0] dataMem_1_2__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_2__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_2__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_2__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_2__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_2__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_2__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_2__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_3 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_12;
  wire [7:0] dataMem_1_3__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_3__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_3__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_3__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_3__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_3__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_3__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_3__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_4 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_13;
  wire [7:0] dataMem_1_4__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_4__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_4__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_4__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_4__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_4__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_4__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_4__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_5 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_14;
  wire [7:0] dataMem_1_5__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_5__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_5__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_5__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_5__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_5__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_5__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_5__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_6 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_15;
  wire [7:0] dataMem_1_6__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_6__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_6__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_6__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_6__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_6__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_6__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_6__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_1_7 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_16;
  wire [7:0] dataMem_1_7__T_24_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_7__T_24_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_7__T_71_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_7__T_71_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_7__T_191_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_1_7__T_191_addr; // @[AXICache.scala 89:37]
  wire  dataMem_1_7__T_191_mask; // @[AXICache.scala 89:37]
  wire  dataMem_1_7__T_191_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_0 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_17;
  wire [7:0] dataMem_2_0__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_0__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_0__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_0__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_0__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_0__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_0__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_0__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_1 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_18;
  wire [7:0] dataMem_2_1__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_1__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_1__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_1__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_1__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_1__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_1__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_1__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_2 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_19;
  wire [7:0] dataMem_2_2__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_2__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_2__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_2__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_2__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_2__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_2__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_2__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_3 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_20;
  wire [7:0] dataMem_2_3__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_3__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_3__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_3__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_3__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_3__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_3__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_3__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_4 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_21;
  wire [7:0] dataMem_2_4__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_4__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_4__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_4__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_4__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_4__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_4__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_4__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_5 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_22;
  wire [7:0] dataMem_2_5__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_5__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_5__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_5__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_5__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_5__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_5__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_5__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_6 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_23;
  wire [7:0] dataMem_2_6__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_6__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_6__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_6__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_6__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_6__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_6__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_6__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_2_7 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_24;
  wire [7:0] dataMem_2_7__T_34_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_7__T_34_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_7__T_79_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_7__T_79_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_7__T_210_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_2_7__T_210_addr; // @[AXICache.scala 89:37]
  wire  dataMem_2_7__T_210_mask; // @[AXICache.scala 89:37]
  wire  dataMem_2_7__T_210_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_0 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_25;
  wire [7:0] dataMem_3_0__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_0__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_0__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_0__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_0__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_0__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_0__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_0__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_1 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_26;
  wire [7:0] dataMem_3_1__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_1__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_1__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_1__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_1__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_1__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_1__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_1__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_2 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_27;
  wire [7:0] dataMem_3_2__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_2__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_2__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_2__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_2__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_2__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_2__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_2__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_3 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_28;
  wire [7:0] dataMem_3_3__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_3__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_3__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_3__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_3__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_3__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_3__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_3__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_4 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_29;
  wire [7:0] dataMem_3_4__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_4__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_4__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_4__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_4__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_4__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_4__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_4__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_5 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_30;
  wire [7:0] dataMem_3_5__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_5__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_5__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_5__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_5__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_5__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_5__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_5__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_6 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_31;
  wire [7:0] dataMem_3_6__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_6__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_6__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_6__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_6__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_6__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_6__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_6__T_229_en; // @[AXICache.scala 89:37]
  reg [7:0] dataMem_3_7 [0:255]; // @[AXICache.scala 89:37]
  reg [31:0] _RAND_32;
  wire [7:0] dataMem_3_7__T_44_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_7__T_44_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_7__T_87_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_7__T_87_addr; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_7__T_229_data; // @[AXICache.scala 89:37]
  wire [7:0] dataMem_3_7__T_229_addr; // @[AXICache.scala 89:37]
  wire  dataMem_3_7__T_229_mask; // @[AXICache.scala 89:37]
  wire  dataMem_3_7__T_229_en; // @[AXICache.scala 89:37]
  reg [2:0] state; // @[AXICache.scala 76:22]
  reg [31:0] _RAND_33;
  reg [2:0] flush_state; // @[AXICache.scala 79:28]
  reg [31:0] _RAND_34;
  reg [255:0] valid; // @[AXICache.scala 86:22]
  reg [255:0] _RAND_35;
  reg [255:0] dirty; // @[AXICache.scala 87:22]
  reg [255:0] _RAND_36;
  reg [63:0] addr_reg; // @[AXICache.scala 91:25]
  reg [63:0] _RAND_37;
  reg [63:0] cpu_data; // @[AXICache.scala 92:25]
  reg [63:0] _RAND_38;
  reg [7:0] cpu_mask; // @[AXICache.scala 93:25]
  reg [31:0] _RAND_39;
  reg [7:0] cpu_tag; // @[AXICache.scala 94:24]
  reg [31:0] _RAND_40;
  reg  cpu_iswrite; // @[AXICache.scala 95:28]
  reg [31:0] _RAND_41;
  wire  _T_8; // @[AXICache.scala 105:51]
  reg [7:0] set_count; // @[Counter.scala 29:33]
  reg [31:0] _RAND_42;
  wire  _T_9; // @[Counter.scala 37:24]
  wire [7:0] _T_11; // @[Counter.scala 38:22]
  wire  set_wrap; // @[Counter.scala 72:20]
  wire  is_idle; // @[AXICache.scala 113:23]
  wire  is_read; // @[AXICache.scala 114:23]
  wire  is_write; // @[AXICache.scala 115:24]
  wire [7:0] idx_reg; // @[AXICache.scala 130:25]
  wire [255:0] _T_104; // @[AXICache.scala 142:15]
  wire  _T_105; // @[AXICache.scala 142:15]
  reg [50:0] rmeta_tag; // @[AXICache.scala 136:22]
  reg [63:0] _RAND_43;
  wire [50:0] tag_reg; // @[AXICache.scala 129:25]
  wire  _T_106; // @[AXICache.scala 142:38]
  wire  hit; // @[AXICache.scala 142:25]
  wire  wen; // @[AXICache.scala 120:22]
  wire  _T_60; // @[AXICache.scala 121:13]
  wire  _T_61; // @[AXICache.scala 121:30]
  wire  _T_62; // @[AXICache.scala 121:18]
  reg  ren_reg; // @[AXICache.scala 122:24]
  reg [31:0] _RAND_44;
  wire [1:0] off_reg; // @[AXICache.scala 131:25]
  wire [63:0] _T_70; // @[AXICache.scala 134:51]
  wire [63:0] _T_86; // @[AXICache.scala 134:51]
  wire [127:0] _T_95; // @[Cat.scala 29:58]
  wire [255:0] cache_block; // @[Cat.scala 29:58]
  reg [255:0] rdata; // @[AXICache.scala 137:22]
  reg [255:0] _RAND_45;
  reg [255:0] rdata_buf; // @[Reg.scala 15:16]
  reg [255:0] _RAND_46;
  wire [255:0] _GEN_3; // @[Reg.scala 16:19]
  wire [63:0] _T_108; // @[AXICache.scala 145:62]
  wire [63:0] _T_109; // @[AXICache.scala 145:62]
  wire [63:0] _T_110; // @[AXICache.scala 145:62]
  wire [63:0] _T_111; // @[AXICache.scala 145:62]
  wire [63:0] _GEN_5; // @[AXICache.scala 145:25]
  wire [63:0] _GEN_6; // @[AXICache.scala 145:25]
  wire  _T_114; // @[AXICache.scala 147:59]
  wire  _T_115; // @[AXICache.scala 147:47]
  wire  _T_128; // @[Decoupled.scala 40:37]
  wire [4:0] _T_130; // @[Cat.scala 29:58]
  wire [38:0] _GEN_273; // @[AXICache.scala 171:40]
  wire [38:0] _T_131; // @[AXICache.scala 171:40]
  wire [39:0] _T_132; // @[AXICache.scala 171:87]
  wire [39:0] wmask; // @[AXICache.scala 171:114]
  wire [255:0] wdata; // @[Cat.scala 29:58]
  wire [255:0] _T_140; // @[AXICache.scala 178:26]
  wire [255:0] _T_141; // @[AXICache.scala 178:26]
  wire [255:0] _T_148; // @[AXICache.scala 179:26]
  wire [7:0] _T_163; // @[AXICache.scala 188:38]
  wire [7:0] _T_182; // @[AXICache.scala 188:38]
  wire [7:0] _T_201; // @[AXICache.scala 188:38]
  wire [7:0] _T_220; // @[AXICache.scala 188:38]
  wire [255:0] _T_235; // @[AXICache.scala 213:29]
  wire  _T_236; // @[AXICache.scala 213:29]
  wire [255:0] _T_237; // @[AXICache.scala 213:49]
  wire  _T_238; // @[AXICache.scala 213:49]
  wire  is_block_dirty; // @[AXICache.scala 213:41]
  reg [15:0] counterValue; // @[Counter.scala 29:33]
  reg [31:0] _RAND_47;
  wire [15:0] _T_258; // @[Counter.scala 38:22]
  wire  _T_263; // @[Conditional.scala 37:30]
  wire  _T_264; // @[AXICache.scala 252:19]
  wire  _T_265; // @[AXICache.scala 252:19]
  wire  _T_268; // @[Conditional.scala 37:30]
  wire  _T_274; // @[Conditional.scala 37:30]
  wire  _GEN_184; // @[AXICache.scala 287:49]
  wire  _T_284; // @[Conditional.scala 37:30]
  wire  _T_285; // @[Conditional.scala 37:30]
  wire  _T_287; // @[Conditional.scala 37:30]
  wire  _T_289; // @[Conditional.scala 37:30]
  wire  _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210; // @[Conditional.scala 39:67]
  wire  _T_297; // @[Conditional.scala 37:30]
  wire  _T_298; // @[Conditional.scala 37:30]
  wire  _GEN_231; // @[AXICache.scala 348:22]
  wire  _T_300; // @[Conditional.scala 37:30]
  wire  _GEN_251; // @[Conditional.scala 39:67]
  wire  _GEN_256; // @[Conditional.scala 39:67]
  wire  _GEN_277; // @[AXICache.scala 252:19]
  wire  _GEN_278; // @[AXICache.scala 252:19]
  wire  _GEN_280; // @[AXICache.scala 257:19]
  wire  _GEN_281; // @[AXICache.scala 257:19]
  wire  _GEN_282; // @[AXICache.scala 273:19]
  wire  _GEN_283; // @[AXICache.scala 273:19]
  wire  _GEN_284; // @[AXICache.scala 273:19]
  wire  _GEN_285; // @[AXICache.scala 273:19]
  wire  _GEN_286; // @[AXICache.scala 273:19]
  wire  _GEN_288; // @[AXICache.scala 291:17]
  wire  _GEN_289; // @[AXICache.scala 291:17]
  wire  _GEN_290; // @[AXICache.scala 291:17]
  wire  _GEN_291; // @[AXICache.scala 291:17]
  wire  _GEN_296; // @[AXICache.scala 295:17]
  wire  _GEN_297; // @[AXICache.scala 295:17]
  wire  _GEN_301; // @[AXICache.scala 326:15]
  wire  _GEN_302; // @[AXICache.scala 326:15]
  wire  _GEN_303; // @[AXICache.scala 326:15]
  wire  _GEN_304; // @[AXICache.scala 326:15]
  wire  _GEN_305; // @[AXICache.scala 326:15]
  wire  _GEN_306; // @[AXICache.scala 326:15]
  wire  _GEN_307; // @[AXICache.scala 326:15]
  wire  _GEN_308; // @[AXICache.scala 326:15]
  wire  _GEN_309; // @[AXICache.scala 326:15]
  assign metaMem_tag__T_97_addr = io_cpu_req_bits_addr[12:5];
  assign metaMem_tag__T_97_data = metaMem_tag[metaMem_tag__T_97_addr]; // @[AXICache.scala 88:20]
  assign metaMem_tag__T_299_addr = set_count;
  assign metaMem_tag__T_299_data = metaMem_tag[metaMem_tag__T_299_addr]; // @[AXICache.scala 88:20]
  assign metaMem_tag__T_153_data = addr_reg[63:13];
  assign metaMem_tag__T_153_addr = addr_reg[12:5];
  assign metaMem_tag__T_153_mask = 1'h1;
  assign metaMem_tag__T_153_en = 1'h0;
  assign dataMem_0_0__T_14_addr = set_count - 8'h1;
  assign dataMem_0_0__T_14_data = dataMem_0_0[dataMem_0_0__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_0__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_0__T_63_data = dataMem_0_0[dataMem_0_0__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_0__T_172_data = wdata[7:0];
  assign dataMem_0_0__T_172_addr = addr_reg[12:5];
  assign dataMem_0_0__T_172_mask = _T_163[0];
  assign dataMem_0_0__T_172_en = is_write & hit;
  assign dataMem_0_1__T_14_addr = set_count - 8'h1;
  assign dataMem_0_1__T_14_data = dataMem_0_1[dataMem_0_1__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_1__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_1__T_63_data = dataMem_0_1[dataMem_0_1__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_1__T_172_data = wdata[15:8];
  assign dataMem_0_1__T_172_addr = addr_reg[12:5];
  assign dataMem_0_1__T_172_mask = _T_163[1];
  assign dataMem_0_1__T_172_en = is_write & hit;
  assign dataMem_0_2__T_14_addr = set_count - 8'h1;
  assign dataMem_0_2__T_14_data = dataMem_0_2[dataMem_0_2__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_2__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_2__T_63_data = dataMem_0_2[dataMem_0_2__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_2__T_172_data = wdata[23:16];
  assign dataMem_0_2__T_172_addr = addr_reg[12:5];
  assign dataMem_0_2__T_172_mask = _T_163[2];
  assign dataMem_0_2__T_172_en = is_write & hit;
  assign dataMem_0_3__T_14_addr = set_count - 8'h1;
  assign dataMem_0_3__T_14_data = dataMem_0_3[dataMem_0_3__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_3__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_3__T_63_data = dataMem_0_3[dataMem_0_3__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_3__T_172_data = wdata[31:24];
  assign dataMem_0_3__T_172_addr = addr_reg[12:5];
  assign dataMem_0_3__T_172_mask = _T_163[3];
  assign dataMem_0_3__T_172_en = is_write & hit;
  assign dataMem_0_4__T_14_addr = set_count - 8'h1;
  assign dataMem_0_4__T_14_data = dataMem_0_4[dataMem_0_4__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_4__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_4__T_63_data = dataMem_0_4[dataMem_0_4__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_4__T_172_data = wdata[39:32];
  assign dataMem_0_4__T_172_addr = addr_reg[12:5];
  assign dataMem_0_4__T_172_mask = _T_163[4];
  assign dataMem_0_4__T_172_en = is_write & hit;
  assign dataMem_0_5__T_14_addr = set_count - 8'h1;
  assign dataMem_0_5__T_14_data = dataMem_0_5[dataMem_0_5__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_5__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_5__T_63_data = dataMem_0_5[dataMem_0_5__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_5__T_172_data = wdata[47:40];
  assign dataMem_0_5__T_172_addr = addr_reg[12:5];
  assign dataMem_0_5__T_172_mask = _T_163[5];
  assign dataMem_0_5__T_172_en = is_write & hit;
  assign dataMem_0_6__T_14_addr = set_count - 8'h1;
  assign dataMem_0_6__T_14_data = dataMem_0_6[dataMem_0_6__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_6__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_6__T_63_data = dataMem_0_6[dataMem_0_6__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_6__T_172_data = wdata[55:48];
  assign dataMem_0_6__T_172_addr = addr_reg[12:5];
  assign dataMem_0_6__T_172_mask = _T_163[6];
  assign dataMem_0_6__T_172_en = is_write & hit;
  assign dataMem_0_7__T_14_addr = set_count - 8'h1;
  assign dataMem_0_7__T_14_data = dataMem_0_7[dataMem_0_7__T_14_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_7__T_63_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_0_7__T_63_data = dataMem_0_7[dataMem_0_7__T_63_addr]; // @[AXICache.scala 89:37]
  assign dataMem_0_7__T_172_data = wdata[63:56];
  assign dataMem_0_7__T_172_addr = addr_reg[12:5];
  assign dataMem_0_7__T_172_mask = _T_163[7];
  assign dataMem_0_7__T_172_en = is_write & hit;
  assign dataMem_1_0__T_24_addr = set_count - 8'h1;
  assign dataMem_1_0__T_24_data = dataMem_1_0[dataMem_1_0__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_0__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_0__T_71_data = dataMem_1_0[dataMem_1_0__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_0__T_191_data = wdata[71:64];
  assign dataMem_1_0__T_191_addr = addr_reg[12:5];
  assign dataMem_1_0__T_191_mask = _T_182[0];
  assign dataMem_1_0__T_191_en = is_write & hit;
  assign dataMem_1_1__T_24_addr = set_count - 8'h1;
  assign dataMem_1_1__T_24_data = dataMem_1_1[dataMem_1_1__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_1__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_1__T_71_data = dataMem_1_1[dataMem_1_1__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_1__T_191_data = wdata[79:72];
  assign dataMem_1_1__T_191_addr = addr_reg[12:5];
  assign dataMem_1_1__T_191_mask = _T_182[1];
  assign dataMem_1_1__T_191_en = is_write & hit;
  assign dataMem_1_2__T_24_addr = set_count - 8'h1;
  assign dataMem_1_2__T_24_data = dataMem_1_2[dataMem_1_2__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_2__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_2__T_71_data = dataMem_1_2[dataMem_1_2__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_2__T_191_data = wdata[87:80];
  assign dataMem_1_2__T_191_addr = addr_reg[12:5];
  assign dataMem_1_2__T_191_mask = _T_182[2];
  assign dataMem_1_2__T_191_en = is_write & hit;
  assign dataMem_1_3__T_24_addr = set_count - 8'h1;
  assign dataMem_1_3__T_24_data = dataMem_1_3[dataMem_1_3__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_3__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_3__T_71_data = dataMem_1_3[dataMem_1_3__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_3__T_191_data = wdata[95:88];
  assign dataMem_1_3__T_191_addr = addr_reg[12:5];
  assign dataMem_1_3__T_191_mask = _T_182[3];
  assign dataMem_1_3__T_191_en = is_write & hit;
  assign dataMem_1_4__T_24_addr = set_count - 8'h1;
  assign dataMem_1_4__T_24_data = dataMem_1_4[dataMem_1_4__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_4__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_4__T_71_data = dataMem_1_4[dataMem_1_4__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_4__T_191_data = wdata[103:96];
  assign dataMem_1_4__T_191_addr = addr_reg[12:5];
  assign dataMem_1_4__T_191_mask = _T_182[4];
  assign dataMem_1_4__T_191_en = is_write & hit;
  assign dataMem_1_5__T_24_addr = set_count - 8'h1;
  assign dataMem_1_5__T_24_data = dataMem_1_5[dataMem_1_5__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_5__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_5__T_71_data = dataMem_1_5[dataMem_1_5__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_5__T_191_data = wdata[111:104];
  assign dataMem_1_5__T_191_addr = addr_reg[12:5];
  assign dataMem_1_5__T_191_mask = _T_182[5];
  assign dataMem_1_5__T_191_en = is_write & hit;
  assign dataMem_1_6__T_24_addr = set_count - 8'h1;
  assign dataMem_1_6__T_24_data = dataMem_1_6[dataMem_1_6__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_6__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_6__T_71_data = dataMem_1_6[dataMem_1_6__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_6__T_191_data = wdata[119:112];
  assign dataMem_1_6__T_191_addr = addr_reg[12:5];
  assign dataMem_1_6__T_191_mask = _T_182[6];
  assign dataMem_1_6__T_191_en = is_write & hit;
  assign dataMem_1_7__T_24_addr = set_count - 8'h1;
  assign dataMem_1_7__T_24_data = dataMem_1_7[dataMem_1_7__T_24_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_7__T_71_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_1_7__T_71_data = dataMem_1_7[dataMem_1_7__T_71_addr]; // @[AXICache.scala 89:37]
  assign dataMem_1_7__T_191_data = wdata[127:120];
  assign dataMem_1_7__T_191_addr = addr_reg[12:5];
  assign dataMem_1_7__T_191_mask = _T_182[7];
  assign dataMem_1_7__T_191_en = is_write & hit;
  assign dataMem_2_0__T_34_addr = set_count - 8'h1;
  assign dataMem_2_0__T_34_data = dataMem_2_0[dataMem_2_0__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_0__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_0__T_79_data = dataMem_2_0[dataMem_2_0__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_0__T_210_data = wdata[135:128];
  assign dataMem_2_0__T_210_addr = addr_reg[12:5];
  assign dataMem_2_0__T_210_mask = _T_201[0];
  assign dataMem_2_0__T_210_en = is_write & hit;
  assign dataMem_2_1__T_34_addr = set_count - 8'h1;
  assign dataMem_2_1__T_34_data = dataMem_2_1[dataMem_2_1__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_1__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_1__T_79_data = dataMem_2_1[dataMem_2_1__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_1__T_210_data = wdata[143:136];
  assign dataMem_2_1__T_210_addr = addr_reg[12:5];
  assign dataMem_2_1__T_210_mask = _T_201[1];
  assign dataMem_2_1__T_210_en = is_write & hit;
  assign dataMem_2_2__T_34_addr = set_count - 8'h1;
  assign dataMem_2_2__T_34_data = dataMem_2_2[dataMem_2_2__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_2__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_2__T_79_data = dataMem_2_2[dataMem_2_2__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_2__T_210_data = wdata[151:144];
  assign dataMem_2_2__T_210_addr = addr_reg[12:5];
  assign dataMem_2_2__T_210_mask = _T_201[2];
  assign dataMem_2_2__T_210_en = is_write & hit;
  assign dataMem_2_3__T_34_addr = set_count - 8'h1;
  assign dataMem_2_3__T_34_data = dataMem_2_3[dataMem_2_3__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_3__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_3__T_79_data = dataMem_2_3[dataMem_2_3__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_3__T_210_data = wdata[159:152];
  assign dataMem_2_3__T_210_addr = addr_reg[12:5];
  assign dataMem_2_3__T_210_mask = _T_201[3];
  assign dataMem_2_3__T_210_en = is_write & hit;
  assign dataMem_2_4__T_34_addr = set_count - 8'h1;
  assign dataMem_2_4__T_34_data = dataMem_2_4[dataMem_2_4__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_4__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_4__T_79_data = dataMem_2_4[dataMem_2_4__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_4__T_210_data = wdata[167:160];
  assign dataMem_2_4__T_210_addr = addr_reg[12:5];
  assign dataMem_2_4__T_210_mask = _T_201[4];
  assign dataMem_2_4__T_210_en = is_write & hit;
  assign dataMem_2_5__T_34_addr = set_count - 8'h1;
  assign dataMem_2_5__T_34_data = dataMem_2_5[dataMem_2_5__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_5__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_5__T_79_data = dataMem_2_5[dataMem_2_5__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_5__T_210_data = wdata[175:168];
  assign dataMem_2_5__T_210_addr = addr_reg[12:5];
  assign dataMem_2_5__T_210_mask = _T_201[5];
  assign dataMem_2_5__T_210_en = is_write & hit;
  assign dataMem_2_6__T_34_addr = set_count - 8'h1;
  assign dataMem_2_6__T_34_data = dataMem_2_6[dataMem_2_6__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_6__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_6__T_79_data = dataMem_2_6[dataMem_2_6__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_6__T_210_data = wdata[183:176];
  assign dataMem_2_6__T_210_addr = addr_reg[12:5];
  assign dataMem_2_6__T_210_mask = _T_201[6];
  assign dataMem_2_6__T_210_en = is_write & hit;
  assign dataMem_2_7__T_34_addr = set_count - 8'h1;
  assign dataMem_2_7__T_34_data = dataMem_2_7[dataMem_2_7__T_34_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_7__T_79_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_2_7__T_79_data = dataMem_2_7[dataMem_2_7__T_79_addr]; // @[AXICache.scala 89:37]
  assign dataMem_2_7__T_210_data = wdata[191:184];
  assign dataMem_2_7__T_210_addr = addr_reg[12:5];
  assign dataMem_2_7__T_210_mask = _T_201[7];
  assign dataMem_2_7__T_210_en = is_write & hit;
  assign dataMem_3_0__T_44_addr = set_count - 8'h1;
  assign dataMem_3_0__T_44_data = dataMem_3_0[dataMem_3_0__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_0__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_0__T_87_data = dataMem_3_0[dataMem_3_0__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_0__T_229_data = wdata[199:192];
  assign dataMem_3_0__T_229_addr = addr_reg[12:5];
  assign dataMem_3_0__T_229_mask = _T_220[0];
  assign dataMem_3_0__T_229_en = is_write & hit;
  assign dataMem_3_1__T_44_addr = set_count - 8'h1;
  assign dataMem_3_1__T_44_data = dataMem_3_1[dataMem_3_1__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_1__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_1__T_87_data = dataMem_3_1[dataMem_3_1__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_1__T_229_data = wdata[207:200];
  assign dataMem_3_1__T_229_addr = addr_reg[12:5];
  assign dataMem_3_1__T_229_mask = _T_220[1];
  assign dataMem_3_1__T_229_en = is_write & hit;
  assign dataMem_3_2__T_44_addr = set_count - 8'h1;
  assign dataMem_3_2__T_44_data = dataMem_3_2[dataMem_3_2__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_2__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_2__T_87_data = dataMem_3_2[dataMem_3_2__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_2__T_229_data = wdata[215:208];
  assign dataMem_3_2__T_229_addr = addr_reg[12:5];
  assign dataMem_3_2__T_229_mask = _T_220[2];
  assign dataMem_3_2__T_229_en = is_write & hit;
  assign dataMem_3_3__T_44_addr = set_count - 8'h1;
  assign dataMem_3_3__T_44_data = dataMem_3_3[dataMem_3_3__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_3__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_3__T_87_data = dataMem_3_3[dataMem_3_3__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_3__T_229_data = wdata[223:216];
  assign dataMem_3_3__T_229_addr = addr_reg[12:5];
  assign dataMem_3_3__T_229_mask = _T_220[3];
  assign dataMem_3_3__T_229_en = is_write & hit;
  assign dataMem_3_4__T_44_addr = set_count - 8'h1;
  assign dataMem_3_4__T_44_data = dataMem_3_4[dataMem_3_4__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_4__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_4__T_87_data = dataMem_3_4[dataMem_3_4__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_4__T_229_data = wdata[231:224];
  assign dataMem_3_4__T_229_addr = addr_reg[12:5];
  assign dataMem_3_4__T_229_mask = _T_220[4];
  assign dataMem_3_4__T_229_en = is_write & hit;
  assign dataMem_3_5__T_44_addr = set_count - 8'h1;
  assign dataMem_3_5__T_44_data = dataMem_3_5[dataMem_3_5__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_5__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_5__T_87_data = dataMem_3_5[dataMem_3_5__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_5__T_229_data = wdata[239:232];
  assign dataMem_3_5__T_229_addr = addr_reg[12:5];
  assign dataMem_3_5__T_229_mask = _T_220[5];
  assign dataMem_3_5__T_229_en = is_write & hit;
  assign dataMem_3_6__T_44_addr = set_count - 8'h1;
  assign dataMem_3_6__T_44_data = dataMem_3_6[dataMem_3_6__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_6__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_6__T_87_data = dataMem_3_6[dataMem_3_6__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_6__T_229_data = wdata[247:240];
  assign dataMem_3_6__T_229_addr = addr_reg[12:5];
  assign dataMem_3_6__T_229_mask = _T_220[6];
  assign dataMem_3_6__T_229_en = is_write & hit;
  assign dataMem_3_7__T_44_addr = set_count - 8'h1;
  assign dataMem_3_7__T_44_data = dataMem_3_7[dataMem_3_7__T_44_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_7__T_87_addr = io_cpu_req_bits_addr[12:5];
  assign dataMem_3_7__T_87_data = dataMem_3_7[dataMem_3_7__T_87_addr]; // @[AXICache.scala 89:37]
  assign dataMem_3_7__T_229_data = wdata[255:248];
  assign dataMem_3_7__T_229_addr = addr_reg[12:5];
  assign dataMem_3_7__T_229_mask = _T_220[7];
  assign dataMem_3_7__T_229_en = is_write & hit;
  assign _T_8 = flush_state == 3'h1; // @[AXICache.scala 105:51]
  assign _T_9 = set_count == 8'hff; // @[Counter.scala 37:24]
  assign _T_11 = set_count + 8'h1; // @[Counter.scala 38:22]
  assign set_wrap = _T_8 & _T_9; // @[Counter.scala 72:20]
  assign is_idle = state == 3'h0; // @[AXICache.scala 113:23]
  assign is_read = state == 3'h1; // @[AXICache.scala 114:23]
  assign is_write = state == 3'h2; // @[AXICache.scala 115:24]
  assign idx_reg = addr_reg[12:5]; // @[AXICache.scala 130:25]
  assign _T_104 = valid >> idx_reg; // @[AXICache.scala 142:15]
  assign _T_105 = _T_104[0]; // @[AXICache.scala 142:15]
  assign tag_reg = addr_reg[63:13]; // @[AXICache.scala 129:25]
  assign _T_106 = rmeta_tag == tag_reg; // @[AXICache.scala 142:38]
  assign hit = _T_105 & _T_106; // @[AXICache.scala 142:25]
  assign wen = is_write & hit; // @[AXICache.scala 120:22]
  assign _T_60 = wen == 1'h0; // @[AXICache.scala 121:13]
  assign _T_61 = is_idle | is_read; // @[AXICache.scala 121:30]
  assign _T_62 = _T_60 & _T_61; // @[AXICache.scala 121:18]
  assign off_reg = addr_reg[4:3]; // @[AXICache.scala 131:25]
  assign _T_70 = {dataMem_0_7__T_63_data,dataMem_0_6__T_63_data,dataMem_0_5__T_63_data,dataMem_0_4__T_63_data,dataMem_0_3__T_63_data,dataMem_0_2__T_63_data,dataMem_0_1__T_63_data,dataMem_0_0__T_63_data}; // @[AXICache.scala 134:51]
  assign _T_86 = {dataMem_2_7__T_79_data,dataMem_2_6__T_79_data,dataMem_2_5__T_79_data,dataMem_2_4__T_79_data,dataMem_2_3__T_79_data,dataMem_2_2__T_79_data,dataMem_2_1__T_79_data,dataMem_2_0__T_79_data}; // @[AXICache.scala 134:51]
  assign _T_95 = {dataMem_1_7__T_71_data,dataMem_1_6__T_71_data,dataMem_1_5__T_71_data,dataMem_1_4__T_71_data,dataMem_1_3__T_71_data,dataMem_1_2__T_71_data,dataMem_1_1__T_71_data,dataMem_1_0__T_71_data,_T_70}; // @[Cat.scala 29:58]
  assign cache_block = {dataMem_3_7__T_87_data,dataMem_3_6__T_87_data,dataMem_3_5__T_87_data,dataMem_3_4__T_87_data,dataMem_3_3__T_87_data,dataMem_3_2__T_87_data,dataMem_3_1__T_87_data,dataMem_3_0__T_87_data,_T_86,_T_95}; // @[Cat.scala 29:58]
  assign _GEN_3 = ren_reg ? rdata : rdata_buf; // @[Reg.scala 16:19]
  assign _T_108 = _GEN_3[63:0]; // @[AXICache.scala 145:62]
  assign _T_109 = _GEN_3[127:64]; // @[AXICache.scala 145:62]
  assign _T_110 = _GEN_3[191:128]; // @[AXICache.scala 145:62]
  assign _T_111 = _GEN_3[255:192]; // @[AXICache.scala 145:62]
  assign _GEN_5 = 2'h1 == off_reg ? _T_109 : _T_108; // @[AXICache.scala 145:25]
  assign _GEN_6 = 2'h2 == off_reg ? _T_110 : _GEN_5; // @[AXICache.scala 145:25]
  assign _T_114 = is_read & hit; // @[AXICache.scala 147:59]
  assign _T_115 = wen | _T_114; // @[AXICache.scala 147:47]
  assign _T_128 = io_cpu_req_ready & io_cpu_req_valid; // @[Decoupled.scala 40:37]
  assign _T_130 = {off_reg,3'h0}; // @[Cat.scala 29:58]
  assign _GEN_273 = {{31'd0}, cpu_mask}; // @[AXICache.scala 171:40]
  assign _T_131 = _GEN_273 << _T_130; // @[AXICache.scala 171:40]
  assign _T_132 = {1'b0,$signed(_T_131)}; // @[AXICache.scala 171:87]
  assign wmask = $unsigned(_T_132); // @[AXICache.scala 171:114]
  assign wdata = {cpu_data,cpu_data,cpu_data,cpu_data}; // @[Cat.scala 29:58]
  assign _T_140 = 256'h1 << idx_reg; // @[AXICache.scala 178:26]
  assign _T_141 = valid | _T_140; // @[AXICache.scala 178:26]
  assign _T_148 = dirty | _T_140; // @[AXICache.scala 179:26]
  assign _T_163 = wmask[7:0]; // @[AXICache.scala 188:38]
  assign _T_182 = wmask[15:8]; // @[AXICache.scala 188:38]
  assign _T_201 = wmask[23:16]; // @[AXICache.scala 188:38]
  assign _T_220 = wmask[31:24]; // @[AXICache.scala 188:38]
  assign _T_235 = valid >> set_count; // @[AXICache.scala 213:29]
  assign _T_236 = _T_235[0]; // @[AXICache.scala 213:29]
  assign _T_237 = dirty >> set_count; // @[AXICache.scala 213:49]
  assign _T_238 = _T_237[0]; // @[AXICache.scala 213:49]
  assign is_block_dirty = _T_236 & _T_238; // @[AXICache.scala 213:41]
  assign _T_258 = counterValue + 16'h1; // @[Counter.scala 38:22]
  assign _T_263 = 3'h0 == state; // @[Conditional.scala 37:30]
  assign _T_264 = $unsigned(reset); // @[AXICache.scala 252:19]
  assign _T_265 = _T_264 == 1'h0; // @[AXICache.scala 252:19]
  assign _T_268 = 3'h1 == state; // @[Conditional.scala 37:30]
  assign _T_274 = 3'h2 == state; // @[Conditional.scala 37:30]
  assign _GEN_184 = hit | _T_115; // @[AXICache.scala 287:49]
  assign _T_284 = 3'h3 == state; // @[Conditional.scala 37:30]
  assign _T_285 = 3'h4 == state; // @[Conditional.scala 37:30]
  assign _T_287 = 3'h5 == state; // @[Conditional.scala 37:30]
  assign _T_289 = 3'h6 == state; // @[Conditional.scala 37:30]
  assign _GEN_202 = _T_274 ? _GEN_184 : _T_115; // @[Conditional.scala 39:67]
  assign _GEN_210 = _T_268 ? _T_115 : _GEN_202; // @[Conditional.scala 39:67]
  assign _T_297 = 3'h0 == flush_state; // @[Conditional.scala 37:30]
  assign _T_298 = 3'h1 == flush_state; // @[Conditional.scala 37:30]
  assign _GEN_231 = set_wrap ? 1'h0 : is_block_dirty; // @[AXICache.scala 348:22]
  assign _T_300 = 3'h2 == flush_state; // @[Conditional.scala 37:30]
  assign _GEN_251 = _T_298 & set_wrap; // @[Conditional.scala 39:67]
  assign _GEN_256 = _T_298 & _GEN_231; // @[Conditional.scala 39:67]
  assign io_cpu_flush_done = _T_297 ? 1'h0 : _GEN_251; // @[AXICache.scala 233:21 AXICache.scala 349:27]
  assign io_cpu_req_ready = is_idle | _T_114; // @[AXICache.scala 155:20]
  assign io_cpu_resp_valid = _T_263 ? _T_115 : _GEN_210; // @[AXICache.scala 154:21 AXICache.scala 289:27]
  assign io_cpu_resp_bits_data = 2'h3 == off_reg ? _T_111 : _GEN_6; // @[AXICache.scala 145:25]
  assign io_cpu_resp_bits_tag = cpu_tag; // @[AXICache.scala 146:24]
  assign io_cpu_resp_bits_iswrite = cpu_iswrite; // @[AXICache.scala 148:28]
  assign _GEN_277 = _T_263 & io_cpu_req_valid; // @[AXICache.scala 252:19]
  assign _GEN_278 = _GEN_277 & io_cpu_req_bits_iswrite; // @[AXICache.scala 252:19]
  assign _GEN_280 = io_cpu_req_bits_iswrite == 1'h0; // @[AXICache.scala 257:19]
  assign _GEN_281 = _GEN_277 & _GEN_280; // @[AXICache.scala 257:19]
  assign _GEN_282 = _T_263 == 1'h0; // @[AXICache.scala 273:19]
  assign _GEN_283 = _GEN_282 & _T_268; // @[AXICache.scala 273:19]
  assign _GEN_284 = _GEN_283 & hit; // @[AXICache.scala 273:19]
  assign _GEN_285 = io_cpu_req_valid == 1'h0; // @[AXICache.scala 273:19]
  assign _GEN_286 = _GEN_284 & _GEN_285; // @[AXICache.scala 273:19]
  assign _GEN_288 = _T_268 == 1'h0; // @[AXICache.scala 291:17]
  assign _GEN_289 = _GEN_282 & _GEN_288; // @[AXICache.scala 291:17]
  assign _GEN_290 = _GEN_289 & _T_274; // @[AXICache.scala 291:17]
  assign _GEN_291 = _GEN_290 & hit; // @[AXICache.scala 291:17]
  assign _GEN_296 = hit == 1'h0; // @[AXICache.scala 295:17]
  assign _GEN_297 = _GEN_290 & _GEN_296; // @[AXICache.scala 295:17]
  assign _GEN_301 = _T_274 == 1'h0; // @[AXICache.scala 326:15]
  assign _GEN_302 = _GEN_289 & _GEN_301; // @[AXICache.scala 326:15]
  assign _GEN_303 = _T_284 == 1'h0; // @[AXICache.scala 326:15]
  assign _GEN_304 = _GEN_302 & _GEN_303; // @[AXICache.scala 326:15]
  assign _GEN_305 = _T_285 == 1'h0; // @[AXICache.scala 326:15]
  assign _GEN_306 = _GEN_304 & _GEN_305; // @[AXICache.scala 326:15]
  assign _GEN_307 = _T_287 == 1'h0; // @[AXICache.scala 326:15]
  assign _GEN_308 = _GEN_306 & _GEN_307; // @[AXICache.scala 326:15]
  assign _GEN_309 = _GEN_308 & _T_289; // @[AXICache.scala 326:15]
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaMem_tag[initvar] = _RAND_0[50:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_0[initvar] = _RAND_1[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_1[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_2[initvar] = _RAND_3[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_3[initvar] = _RAND_4[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_4[initvar] = _RAND_5[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_5[initvar] = _RAND_6[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_7 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_6[initvar] = _RAND_7[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_8 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_7[initvar] = _RAND_8[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_9 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_0[initvar] = _RAND_9[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_10 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_1[initvar] = _RAND_10[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_11 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_2[initvar] = _RAND_11[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_12 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_3[initvar] = _RAND_12[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_13 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_4[initvar] = _RAND_13[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_14 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_5[initvar] = _RAND_14[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_15 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_6[initvar] = _RAND_15[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_16 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_7[initvar] = _RAND_16[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_17 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_0[initvar] = _RAND_17[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_18 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_1[initvar] = _RAND_18[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_19 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_2[initvar] = _RAND_19[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_20 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_3[initvar] = _RAND_20[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_21 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_4[initvar] = _RAND_21[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_22 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_5[initvar] = _RAND_22[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_23 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_6[initvar] = _RAND_23[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_24 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_7[initvar] = _RAND_24[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_25 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_0[initvar] = _RAND_25[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_26 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_1[initvar] = _RAND_26[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_27 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_2[initvar] = _RAND_27[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_28 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_3[initvar] = _RAND_28[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_29 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_4[initvar] = _RAND_29[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_30 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_5[initvar] = _RAND_30[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_31 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_6[initvar] = _RAND_31[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_32 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_7[initvar] = _RAND_32[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  state = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  flush_state = _RAND_34[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {8{`RANDOM}};
  valid = _RAND_35[255:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {8{`RANDOM}};
  dirty = _RAND_36[255:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {2{`RANDOM}};
  addr_reg = _RAND_37[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {2{`RANDOM}};
  cpu_data = _RAND_38[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  cpu_mask = _RAND_39[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  cpu_tag = _RAND_40[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  cpu_iswrite = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  set_count = _RAND_42[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {2{`RANDOM}};
  rmeta_tag = _RAND_43[50:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  ren_reg = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {8{`RANDOM}};
  rdata = _RAND_45[255:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {8{`RANDOM}};
  rdata_buf = _RAND_46[255:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  counterValue = _RAND_47[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(metaMem_tag__T_153_en & metaMem_tag__T_153_mask) begin
      metaMem_tag[metaMem_tag__T_153_addr] <= metaMem_tag__T_153_data; // @[AXICache.scala 88:20]
    end
    if(dataMem_0_0__T_172_en & dataMem_0_0__T_172_mask) begin
      dataMem_0_0[dataMem_0_0__T_172_addr] <= dataMem_0_0__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_1__T_172_en & dataMem_0_1__T_172_mask) begin
      dataMem_0_1[dataMem_0_1__T_172_addr] <= dataMem_0_1__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_2__T_172_en & dataMem_0_2__T_172_mask) begin
      dataMem_0_2[dataMem_0_2__T_172_addr] <= dataMem_0_2__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_3__T_172_en & dataMem_0_3__T_172_mask) begin
      dataMem_0_3[dataMem_0_3__T_172_addr] <= dataMem_0_3__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_4__T_172_en & dataMem_0_4__T_172_mask) begin
      dataMem_0_4[dataMem_0_4__T_172_addr] <= dataMem_0_4__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_5__T_172_en & dataMem_0_5__T_172_mask) begin
      dataMem_0_5[dataMem_0_5__T_172_addr] <= dataMem_0_5__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_6__T_172_en & dataMem_0_6__T_172_mask) begin
      dataMem_0_6[dataMem_0_6__T_172_addr] <= dataMem_0_6__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_0_7__T_172_en & dataMem_0_7__T_172_mask) begin
      dataMem_0_7[dataMem_0_7__T_172_addr] <= dataMem_0_7__T_172_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_0__T_191_en & dataMem_1_0__T_191_mask) begin
      dataMem_1_0[dataMem_1_0__T_191_addr] <= dataMem_1_0__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_1__T_191_en & dataMem_1_1__T_191_mask) begin
      dataMem_1_1[dataMem_1_1__T_191_addr] <= dataMem_1_1__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_2__T_191_en & dataMem_1_2__T_191_mask) begin
      dataMem_1_2[dataMem_1_2__T_191_addr] <= dataMem_1_2__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_3__T_191_en & dataMem_1_3__T_191_mask) begin
      dataMem_1_3[dataMem_1_3__T_191_addr] <= dataMem_1_3__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_4__T_191_en & dataMem_1_4__T_191_mask) begin
      dataMem_1_4[dataMem_1_4__T_191_addr] <= dataMem_1_4__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_5__T_191_en & dataMem_1_5__T_191_mask) begin
      dataMem_1_5[dataMem_1_5__T_191_addr] <= dataMem_1_5__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_6__T_191_en & dataMem_1_6__T_191_mask) begin
      dataMem_1_6[dataMem_1_6__T_191_addr] <= dataMem_1_6__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_1_7__T_191_en & dataMem_1_7__T_191_mask) begin
      dataMem_1_7[dataMem_1_7__T_191_addr] <= dataMem_1_7__T_191_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_0__T_210_en & dataMem_2_0__T_210_mask) begin
      dataMem_2_0[dataMem_2_0__T_210_addr] <= dataMem_2_0__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_1__T_210_en & dataMem_2_1__T_210_mask) begin
      dataMem_2_1[dataMem_2_1__T_210_addr] <= dataMem_2_1__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_2__T_210_en & dataMem_2_2__T_210_mask) begin
      dataMem_2_2[dataMem_2_2__T_210_addr] <= dataMem_2_2__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_3__T_210_en & dataMem_2_3__T_210_mask) begin
      dataMem_2_3[dataMem_2_3__T_210_addr] <= dataMem_2_3__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_4__T_210_en & dataMem_2_4__T_210_mask) begin
      dataMem_2_4[dataMem_2_4__T_210_addr] <= dataMem_2_4__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_5__T_210_en & dataMem_2_5__T_210_mask) begin
      dataMem_2_5[dataMem_2_5__T_210_addr] <= dataMem_2_5__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_6__T_210_en & dataMem_2_6__T_210_mask) begin
      dataMem_2_6[dataMem_2_6__T_210_addr] <= dataMem_2_6__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_2_7__T_210_en & dataMem_2_7__T_210_mask) begin
      dataMem_2_7[dataMem_2_7__T_210_addr] <= dataMem_2_7__T_210_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_0__T_229_en & dataMem_3_0__T_229_mask) begin
      dataMem_3_0[dataMem_3_0__T_229_addr] <= dataMem_3_0__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_1__T_229_en & dataMem_3_1__T_229_mask) begin
      dataMem_3_1[dataMem_3_1__T_229_addr] <= dataMem_3_1__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_2__T_229_en & dataMem_3_2__T_229_mask) begin
      dataMem_3_2[dataMem_3_2__T_229_addr] <= dataMem_3_2__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_3__T_229_en & dataMem_3_3__T_229_mask) begin
      dataMem_3_3[dataMem_3_3__T_229_addr] <= dataMem_3_3__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_4__T_229_en & dataMem_3_4__T_229_mask) begin
      dataMem_3_4[dataMem_3_4__T_229_addr] <= dataMem_3_4__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_5__T_229_en & dataMem_3_5__T_229_mask) begin
      dataMem_3_5[dataMem_3_5__T_229_addr] <= dataMem_3_5__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_6__T_229_en & dataMem_3_6__T_229_mask) begin
      dataMem_3_6[dataMem_3_6__T_229_addr] <= dataMem_3_6__T_229_data; // @[AXICache.scala 89:37]
    end
    if(dataMem_3_7__T_229_en & dataMem_3_7__T_229_mask) begin
      dataMem_3_7[dataMem_3_7__T_229_addr] <= dataMem_3_7__T_229_data; // @[AXICache.scala 89:37]
    end
    if (reset) begin
      state <= 3'h0;
    end else if (_T_263) begin
      if (io_cpu_req_valid) begin
        if (io_cpu_req_bits_iswrite) begin
          state <= 3'h2;
        end else begin
          state <= 3'h1;
        end
      end
    end else if (_T_268) begin
      if (hit) begin
        if (io_cpu_req_valid) begin
          if (io_cpu_req_bits_iswrite) begin
            state <= 3'h2;
          end else begin
            state <= 3'h1;
          end
        end else begin
          state <= 3'h0;
        end
      end
    end else if (_T_274) begin
      if (hit) begin
        state <= 3'h0;
      end
    end
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
      valid <= 256'h0;
    end else if (wen) begin
      valid <= _T_141;
    end
    if (reset) begin
      dirty <= 256'h0;
    end else if (wen) begin
      dirty <= _T_148;
    end
    if (reset) begin
      addr_reg <= 64'h0;
    end else if (_T_128) begin
      addr_reg <= io_cpu_req_bits_addr;
    end
    if (reset) begin
      cpu_data <= 64'h0;
    end else if (_T_128) begin
      cpu_data <= io_cpu_req_bits_data;
    end
    if (reset) begin
      cpu_mask <= 8'h0;
    end else if (_T_128) begin
      cpu_mask <= io_cpu_req_bits_mask;
    end
    if (reset) begin
      cpu_tag <= 8'h0;
    end else if (_T_128) begin
      cpu_tag <= io_cpu_req_bits_tag;
    end
    if (reset) begin
      cpu_iswrite <= 1'h0;
    end else if (_T_128) begin
      cpu_iswrite <= io_cpu_req_bits_iswrite;
    end
    if (reset) begin
      set_count <= 8'h0;
    end else if (_T_8) begin
      set_count <= _T_11;
    end
    if (reset) begin
      rmeta_tag <= 51'h0;
    end else begin
      rmeta_tag <= metaMem_tag__T_97_data;
    end
    ren_reg <= _T_62 & io_cpu_req_valid;
    if (reset) begin
      rdata <= 256'h0;
    end else begin
      rdata <= cache_block;
    end
    if (ren_reg) begin
      rdata_buf <= rdata;
    end
    if (reset) begin
      counterValue <= 16'h0;
    end else begin
      counterValue <= _T_258;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_278 & _T_265) begin
          $fwrite(32'h80000002,"\nSTORE START: %d\n",counterValue); // @[AXICache.scala 252:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_281 & _T_265) begin
          $fwrite(32'h80000002,"\nLOAD START:  %d\n",counterValue); // @[AXICache.scala 257:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_265) begin
          $fwrite(32'h80000002,"\nLOAD END: %d\n",counterValue); // @[AXICache.scala 273:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_291 & _T_265) begin
          $fwrite(32'h80000002,"\nSTORE END: %d\n",counterValue); // @[AXICache.scala 291:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_297 & _T_265) begin
          $fwrite(32'h80000002,"\nSTORE MISS: %d\n",counterValue); // @[AXICache.scala 295:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_309 & _T_265) begin
          $fwrite(32'h80000002,"state: Refill\n"); // @[AXICache.scala 326:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module LockingRRArbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [53:0] io_in_0_bits_address,
  input  [63:0] io_in_0_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [53:0] io_out_bits_address,
  output [63:0] io_out_bits_data,
  output [7:0]  io_out_bits_Typ,
  output        io_chosen
);
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 60:16]
  assign io_out_valid = io_chosen ? 1'h0 : io_in_0_valid; // @[Arbiter.scala 41:16]
  assign io_out_bits_address = io_chosen ? 54'h0 : io_in_0_bits_address; // @[Arbiter.scala 42:15]
  assign io_out_bits_data = io_chosen ? 64'h0 : io_in_0_bits_data; // @[Arbiter.scala 42:15]
  assign io_out_bits_Typ = io_chosen ? 8'h0 : 8'h3; // @[Arbiter.scala 42:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 40:13]
endmodule
module ArbiterTree(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [53:0] io_in_0_bits_address,
  input  [63:0] io_in_0_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [53:0] io_out_bits_address,
  output [63:0] io_out_bits_data,
  output [7:0]  io_out_bits_Typ
);
  wire  LockingRRArbiter_io_in_0_ready; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_in_0_valid; // @[ArbiterTree.scala 34:13]
  wire [53:0] LockingRRArbiter_io_in_0_bits_address; // @[ArbiterTree.scala 34:13]
  wire [63:0] LockingRRArbiter_io_in_0_bits_data; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_out_ready; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_out_valid; // @[ArbiterTree.scala 34:13]
  wire [53:0] LockingRRArbiter_io_out_bits_address; // @[ArbiterTree.scala 34:13]
  wire [63:0] LockingRRArbiter_io_out_bits_data; // @[ArbiterTree.scala 34:13]
  wire [7:0] LockingRRArbiter_io_out_bits_Typ; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_chosen; // @[ArbiterTree.scala 34:13]
  LockingRRArbiter LockingRRArbiter ( // @[ArbiterTree.scala 34:13]
    .io_in_0_ready(LockingRRArbiter_io_in_0_ready),
    .io_in_0_valid(LockingRRArbiter_io_in_0_valid),
    .io_in_0_bits_address(LockingRRArbiter_io_in_0_bits_address),
    .io_in_0_bits_data(LockingRRArbiter_io_in_0_bits_data),
    .io_out_ready(LockingRRArbiter_io_out_ready),
    .io_out_valid(LockingRRArbiter_io_out_valid),
    .io_out_bits_address(LockingRRArbiter_io_out_bits_address),
    .io_out_bits_data(LockingRRArbiter_io_out_bits_data),
    .io_out_bits_Typ(LockingRRArbiter_io_out_bits_Typ),
    .io_chosen(LockingRRArbiter_io_chosen)
  );
  assign io_in_0_ready = LockingRRArbiter_io_in_0_ready; // @[ArbiterTree.scala 51:61]
  assign io_out_valid = LockingRRArbiter_io_out_valid; // @[ArbiterTree.scala 67:12]
  assign io_out_bits_address = LockingRRArbiter_io_out_bits_address; // @[ArbiterTree.scala 67:12]
  assign io_out_bits_data = LockingRRArbiter_io_out_bits_data; // @[ArbiterTree.scala 67:12]
  assign io_out_bits_Typ = LockingRRArbiter_io_out_bits_Typ; // @[ArbiterTree.scala 67:12]
  assign LockingRRArbiter_io_in_0_valid = io_in_0_valid; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_in_0_bits_address = io_in_0_bits_address; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_in_0_bits_data = io_in_0_bits_data; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_out_ready = io_out_ready; // @[ArbiterTree.scala 67:12]
endmodule
module Arbiter(
  output  io_in_0_ready,
  input   io_in_0_valid,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input   io_out_ready,
  output  io_out_valid
);
  wire  _T; // @[Arbiter.scala 31:78]
  wire  _T_3; // @[Arbiter.scala 135:19]
  assign _T = io_in_0_valid == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_3 = _T == 1'h0; // @[Arbiter.scala 135:19]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:14]
  assign io_in_1_ready = _T & io_out_ready; // @[Arbiter.scala 134:14]
  assign io_out_valid = _T_3 | io_in_1_valid; // @[Arbiter.scala 135:16]
endmodule
module Arbiter_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_addr,
  input  [63:0] io_in_0_bits_data,
  input  [7:0]  io_in_0_bits_mask,
  input  [7:0]  io_in_0_bits_tag,
  input         io_in_0_bits_iswrite,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [63:0] io_in_1_bits_addr,
  input  [63:0] io_in_1_bits_data,
  input  [7:0]  io_in_1_bits_mask,
  input  [7:0]  io_in_1_bits_tag,
  input         io_in_1_bits_iswrite,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_addr,
  output [63:0] io_out_bits_data,
  output [7:0]  io_out_bits_mask,
  output [7:0]  io_out_bits_tag,
  output        io_out_bits_iswrite
);
  wire  _T; // @[Arbiter.scala 31:78]
  wire  _T_3; // @[Arbiter.scala 135:19]
  assign _T = io_in_0_valid == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_3 = _T == 1'h0; // @[Arbiter.scala 135:19]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:14]
  assign io_in_1_ready = _T & io_out_ready; // @[Arbiter.scala 134:14]
  assign io_out_valid = _T_3 | io_in_1_valid; // @[Arbiter.scala 135:16]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 124:15 Arbiter.scala 128:19]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 124:15 Arbiter.scala 128:19]
  assign io_out_bits_mask = io_in_0_valid ? io_in_0_bits_mask : io_in_1_bits_mask; // @[Arbiter.scala 124:15 Arbiter.scala 128:19]
  assign io_out_bits_tag = io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag; // @[Arbiter.scala 124:15 Arbiter.scala 128:19]
  assign io_out_bits_iswrite = io_in_0_valid ? io_in_0_bits_iswrite : io_in_1_bits_iswrite; // @[Arbiter.scala 124:15 Arbiter.scala 128:19]
endmodule
module Demux(
  input         io_en,
  input  [63:0] io_input_data,
  input  [7:0]  io_input_tag,
  input         io_sel,
  output        io_outputs_0_valid,
  output [63:0] io_outputs_0_data,
  output [7:0]  io_outputs_0_tag,
  output        io_outputs_1_valid,
  output [63:0] io_outputs_1_data,
  output [7:0]  io_outputs_1_tag
);
  wire  _GEN_0; // @[Muxes.scala 31:25]
  assign _GEN_0 = 1'h0 == io_sel; // @[Muxes.scala 31:25]
  assign io_outputs_0_valid = io_en & _GEN_0; // @[Muxes.scala 25:19 Muxes.scala 29:27 Muxes.scala 31:25 Muxes.scala 34:27]
  assign io_outputs_0_data = io_input_data; // @[Muxes.scala 25:19]
  assign io_outputs_0_tag = io_input_tag; // @[Muxes.scala 25:19]
  assign io_outputs_1_valid = io_en & io_sel; // @[Muxes.scala 25:19 Muxes.scala 29:27 Muxes.scala 31:25 Muxes.scala 34:27]
  assign io_outputs_1_data = io_input_data; // @[Muxes.scala 25:19]
  assign io_outputs_1_tag = io_input_tag; // @[Muxes.scala 25:19]
endmodule
module RRArbiter(
  input   clock,
  output  io_in_0_ready,
  input   io_in_0_valid,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input   io_out_ready,
  output  io_out_valid,
  output  io_chosen
);
  reg  _T_1; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire  _T_3; // @[Arbiter.scala 67:57]
  wire  _T_5; // @[Arbiter.scala 68:83]
  wire  _T_7; // @[Arbiter.scala 31:68]
  wire  _T_10; // @[Arbiter.scala 31:78]
  wire  _GEN_11; // @[Arbiter.scala 77:27]
  assign _T_3 = 1'h1 > _T_1; // @[Arbiter.scala 67:57]
  assign _T_5 = io_in_1_valid & _T_3; // @[Arbiter.scala 68:83]
  assign _T_7 = _T_5 | io_in_0_valid; // @[Arbiter.scala 31:68]
  assign _T_10 = _T_7 == 1'h0; // @[Arbiter.scala 31:78]
  assign _GEN_11 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27]
  assign io_in_0_ready = _T_5 == 1'h0; // @[Arbiter.scala 60:16]
  assign io_in_1_ready = _T_3 | _T_10; // @[Arbiter.scala 60:16]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16]
  assign io_chosen = _T_5 | _GEN_11; // @[Arbiter.scala 40:13]
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
  _T_1 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_out_valid) begin
      _T_1 <= io_chosen;
    end
  end
endmodule
module Demux_1(
  input   io_en,
  output  io_outputs_0_valid
);
  assign io_outputs_0_valid = io_en; // @[Muxes.scala 25:19 Muxes.scala 29:27 Muxes.scala 31:25 Muxes.scala 34:27]
endmodule
module DeMuxTree(
  output  io_outputs_0_valid,
  input   io_enable
);
  wire  Demux_io_en; // @[Muxes.scala 93:13]
  wire  Demux_io_outputs_0_valid; // @[Muxes.scala 93:13]
  Demux_1 Demux ( // @[Muxes.scala 93:13]
    .io_en(Demux_io_en),
    .io_outputs_0_valid(Demux_io_outputs_0_valid)
  );
  assign io_outputs_0_valid = Demux_io_outputs_0_valid; // @[Muxes.scala 121:25]
  assign Demux_io_en = io_enable; // @[Muxes.scala 137:14]
endmodule
module WriteTableEntry(
  input         clock,
  input         reset,
  output        io_NodeReq_ready,
  input         io_NodeReq_valid,
  input  [53:0] io_NodeReq_bits_address,
  input  [63:0] io_NodeReq_bits_data,
  input  [7:0]  io_NodeReq_bits_Typ,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input         io_output_ready,
  output        io_output_valid,
  output        io_free
);
  reg [15:0] sendbytemask; // @[WriteMemoryController.scala 61:29]
  reg [31:0] _RAND_0;
  reg [63:0] ReqAddress; // @[WriteMemoryController.scala 65:27]
  reg [63:0] _RAND_1;
  reg  ptr; // @[WriteMemoryController.scala 70:27]
  reg [31:0] _RAND_2;
  reg [63:0] linebuffer_0; // @[WriteMemoryController.scala 71:27]
  reg [63:0] _RAND_3;
  reg [63:0] linebuffer_1; // @[WriteMemoryController.scala 71:27]
  reg [63:0] _RAND_4;
  reg [1:0] state; // @[WriteMemoryController.scala 76:68]
  reg [31:0] _RAND_5;
  wire  _T_4; // @[WriteMemoryController.scala 89:21]
  wire [3:0] _T_5; // @[Cat.scala 29:58]
  wire [63:0] _GEN_29; // @[WriteMemoryController.scala 100:37]
  reg  isWrite; // @[WriteMemoryController.scala 108:24]
  reg [31:0] _RAND_6;
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire [50:0] _T_10; // @[WriteMemoryController.scala 121:44]
  wire [53:0] _T_11; // @[WriteMemoryController.scala 121:69]
  wire  _T_12; // @[helpers.scala 27:24]
  wire  _T_13; // @[helpers.scala 27:47]
  wire  _T_14; // @[helpers.scala 27:40]
  wire  _T_16; // @[helpers.scala 28:15]
  wire  _T_17; // @[helpers.scala 28:38]
  wire  _T_18; // @[helpers.scala 28:31]
  wire  _T_20; // @[helpers.scala 29:17]
  wire  _T_21; // @[helpers.scala 29:40]
  wire  _T_22; // @[helpers.scala 29:33]
  wire [2:0] _T_28; // @[helpers.scala 39:32]
  wire [5:0] _T_29; // @[Cat.scala 29:58]
  wire [7:0] _T_43; // @[helpers.scala 50:12]
  wire [7:0] _T_44; // @[helpers.scala 49:10]
  wire [7:0] _T_45; // @[helpers.scala 48:19]
  wire [14:0] _GEN_31; // @[helpers.scala 20:26]
  wire [14:0] _T_47; // @[helpers.scala 20:26]
  wire [126:0] _GEN_32; // @[WriteMemoryController.scala 127:41]
  wire [126:0] _T_50; // @[WriteMemoryController.scala 127:41]
  wire [127:0] _T_52;
  wire [63:0] _T_53; // @[WriteMemoryController.scala 127:121]
  wire [63:0] _T_54; // @[WriteMemoryController.scala 127:121]
  wire  _T_55; // @[WriteMemoryController.scala 139:15]
  wire  _T_56; // @[WriteMemoryController.scala 139:47]
  wire  _T_57; // @[WriteMemoryController.scala 139:30]
  wire  _T_58; // @[Decoupled.scala 40:37]
  wire [7:0] _T_59; // @[WriteMemoryController.scala 144:36]
  wire  _T_61; // @[WriteMemoryController.scala 146:18]
  wire  _T_62; // @[WriteMemoryController.scala 156:15]
  wire  _T_64; // @[WriteMemoryController.scala 156:32]
  wire  _T_65; // @[WriteMemoryController.scala 158:27]
  wire  _T_68; // @[Decoupled.scala 40:37]
  assign _T_4 = state == 2'h3; // @[WriteMemoryController.scala 89:21]
  assign _T_5 = {ptr,3'h0}; // @[Cat.scala 29:58]
  assign _GEN_29 = {{60'd0}, _T_5}; // @[WriteMemoryController.scala 100:37]
  assign _T_9 = io_NodeReq_ready & io_NodeReq_valid; // @[Decoupled.scala 40:37]
  assign _T_10 = io_NodeReq_bits_address[53:3]; // @[WriteMemoryController.scala 121:44]
  assign _T_11 = {_T_10, 3'h0}; // @[WriteMemoryController.scala 121:69]
  assign _T_12 = io_NodeReq_bits_Typ == 8'h2; // @[helpers.scala 27:24]
  assign _T_13 = io_NodeReq_bits_Typ == 8'h6; // @[helpers.scala 27:47]
  assign _T_14 = _T_12 | _T_13; // @[helpers.scala 27:40]
  assign _T_16 = io_NodeReq_bits_Typ == 8'h1; // @[helpers.scala 28:15]
  assign _T_17 = io_NodeReq_bits_Typ == 8'h5; // @[helpers.scala 28:38]
  assign _T_18 = _T_16 | _T_17; // @[helpers.scala 28:31]
  assign _T_20 = io_NodeReq_bits_Typ == 8'h3; // @[helpers.scala 29:17]
  assign _T_21 = io_NodeReq_bits_Typ == 8'h7; // @[helpers.scala 29:40]
  assign _T_22 = _T_20 | _T_21; // @[helpers.scala 29:33]
  assign _T_28 = io_NodeReq_bits_address[2:0]; // @[helpers.scala 39:32]
  assign _T_29 = {_T_28,3'h0}; // @[Cat.scala 29:58]
  assign _T_43 = _T_22 ? 8'hf : 8'hff; // @[helpers.scala 50:12]
  assign _T_44 = _T_18 ? 8'h1 : _T_43; // @[helpers.scala 49:10]
  assign _T_45 = _T_14 ? 8'h3 : _T_44; // @[helpers.scala 48:19]
  assign _GEN_31 = {{7'd0}, _T_45}; // @[helpers.scala 20:26]
  assign _T_47 = _GEN_31 << _T_28; // @[helpers.scala 20:26]
  assign _GEN_32 = {{63'd0}, io_NodeReq_bits_data}; // @[WriteMemoryController.scala 127:41]
  assign _T_50 = _GEN_32 << _T_29; // @[WriteMemoryController.scala 127:41]
  assign _T_52 = {{1'd0}, _T_50};
  assign _T_53 = _T_52[63:0]; // @[WriteMemoryController.scala 127:121]
  assign _T_54 = _T_52[127:64]; // @[WriteMemoryController.scala 127:121]
  assign _T_55 = state == 2'h1; // @[WriteMemoryController.scala 139:15]
  assign _T_56 = sendbytemask != 16'h0; // @[WriteMemoryController.scala 139:47]
  assign _T_57 = _T_55 & _T_56; // @[WriteMemoryController.scala 139:30]
  assign _T_58 = io_MemReq_ready & io_MemReq_valid; // @[Decoupled.scala 40:37]
  assign _T_59 = sendbytemask[15:8]; // @[WriteMemoryController.scala 144:36]
  assign _T_61 = ptr + 1'h1; // @[WriteMemoryController.scala 146:18]
  assign _T_62 = state == 2'h2; // @[WriteMemoryController.scala 156:15]
  assign _T_64 = _T_62 & io_MemResp_valid; // @[WriteMemoryController.scala 156:32]
  assign _T_65 = sendbytemask == 16'h0; // @[WriteMemoryController.scala 158:27]
  assign _T_68 = io_output_ready & io_output_valid; // @[Decoupled.scala 40:37]
  assign io_NodeReq_ready = state == 2'h0; // @[WriteMemoryController.scala 87:20]
  assign io_MemReq_valid = _T_55 & _T_56; // @[WriteMemoryController.scala 99:19 WriteMemoryController.scala 140:21]
  assign io_MemReq_bits_addr = ReqAddress + _GEN_29; // @[WriteMemoryController.scala 100:23]
  assign io_MemReq_bits_data = ptr ? linebuffer_1 : linebuffer_0; // @[WriteMemoryController.scala 102:23]
  assign io_MemReq_bits_mask = sendbytemask[7:0]; // @[WriteMemoryController.scala 103:23]
  assign io_MemReq_bits_iswrite = isWrite; // @[WriteMemoryController.scala 109:26]
  assign io_output_valid = state == 2'h3; // @[WriteMemoryController.scala 95:19 WriteMemoryController.scala 168:21]
  assign io_free = state == 2'h0; // @[WriteMemoryController.scala 85:11]
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
  sendbytemask = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  ReqAddress = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  ptr = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  linebuffer_0 = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  linebuffer_1 = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  isWrite = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      sendbytemask <= 16'h0;
    end else if (_T_57) begin
      if (_T_58) begin
        sendbytemask <= {{8'd0}, _T_59};
      end else if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_9) begin
      sendbytemask <= {{1'd0}, _T_47};
    end
    if (reset) begin
      ReqAddress <= 64'h0;
    end else if (_T_9) begin
      ReqAddress <= {{10'd0}, _T_11};
    end
    if (reset) begin
      ptr <= 1'h0;
    end else if (_T_4) begin
      ptr <= 1'h0;
    end else if (_T_57) begin
      if (_T_58) begin
        ptr <= _T_61;
      end
    end
    if (reset) begin
      linebuffer_0 <= 64'h0;
    end else if (_T_9) begin
      linebuffer_0 <= _T_53;
    end
    if (reset) begin
      linebuffer_1 <= 64'h0;
    end else if (_T_9) begin
      linebuffer_1 <= _T_54;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_4) begin
      if (_T_68) begin
        state <= 2'h0;
      end else if (_T_64) begin
        if (_T_65) begin
          state <= 2'h3;
        end else begin
          state <= 2'h1;
        end
      end else if (_T_57) begin
        if (_T_58) begin
          state <= 2'h2;
        end else if (_T_9) begin
          state <= 2'h1;
        end
      end else if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_64) begin
      if (_T_65) begin
        state <= 2'h3;
      end else begin
        state <= 2'h1;
      end
    end else if (_T_57) begin
      if (_T_58) begin
        state <= 2'h2;
      end else if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_9) begin
      state <= 2'h1;
    end
    if (reset) begin
      isWrite <= 1'h0;
    end else begin
      isWrite <= 1'h1;
    end
  end
endmodule
module WriteTableEntry_1(
  input         clock,
  input         reset,
  output        io_NodeReq_ready,
  input         io_NodeReq_valid,
  input  [53:0] io_NodeReq_bits_address,
  input  [63:0] io_NodeReq_bits_data,
  input  [7:0]  io_NodeReq_bits_Typ,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input         io_output_ready,
  output        io_output_valid,
  output        io_free
);
  reg  ID; // @[WriteMemoryController.scala 53:32]
  reg [31:0] _RAND_0;
  reg [15:0] sendbytemask; // @[WriteMemoryController.scala 61:29]
  reg [31:0] _RAND_1;
  reg [63:0] ReqAddress; // @[WriteMemoryController.scala 65:27]
  reg [63:0] _RAND_2;
  reg  ptr; // @[WriteMemoryController.scala 70:27]
  reg [31:0] _RAND_3;
  reg [63:0] linebuffer_0; // @[WriteMemoryController.scala 71:27]
  reg [63:0] _RAND_4;
  reg [63:0] linebuffer_1; // @[WriteMemoryController.scala 71:27]
  reg [63:0] _RAND_5;
  reg [1:0] state; // @[WriteMemoryController.scala 76:68]
  reg [31:0] _RAND_6;
  wire  _T_4; // @[WriteMemoryController.scala 89:21]
  wire [3:0] _T_5; // @[Cat.scala 29:58]
  wire [63:0] _GEN_29; // @[WriteMemoryController.scala 100:37]
  reg  myID; // @[WriteMemoryController.scala 106:21]
  reg [31:0] _RAND_7;
  reg  isWrite; // @[WriteMemoryController.scala 108:24]
  reg [31:0] _RAND_8;
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire [50:0] _T_10; // @[WriteMemoryController.scala 121:44]
  wire [53:0] _T_11; // @[WriteMemoryController.scala 121:69]
  wire  _T_12; // @[helpers.scala 27:24]
  wire  _T_13; // @[helpers.scala 27:47]
  wire  _T_14; // @[helpers.scala 27:40]
  wire  _T_16; // @[helpers.scala 28:15]
  wire  _T_17; // @[helpers.scala 28:38]
  wire  _T_18; // @[helpers.scala 28:31]
  wire  _T_20; // @[helpers.scala 29:17]
  wire  _T_21; // @[helpers.scala 29:40]
  wire  _T_22; // @[helpers.scala 29:33]
  wire [2:0] _T_28; // @[helpers.scala 39:32]
  wire [5:0] _T_29; // @[Cat.scala 29:58]
  wire [7:0] _T_43; // @[helpers.scala 50:12]
  wire [7:0] _T_44; // @[helpers.scala 49:10]
  wire [7:0] _T_45; // @[helpers.scala 48:19]
  wire [14:0] _GEN_31; // @[helpers.scala 20:26]
  wire [14:0] _T_47; // @[helpers.scala 20:26]
  wire [126:0] _GEN_32; // @[WriteMemoryController.scala 127:41]
  wire [126:0] _T_50; // @[WriteMemoryController.scala 127:41]
  wire [127:0] _T_52;
  wire [63:0] _T_53; // @[WriteMemoryController.scala 127:121]
  wire [63:0] _T_54; // @[WriteMemoryController.scala 127:121]
  wire  _T_55; // @[WriteMemoryController.scala 139:15]
  wire  _T_56; // @[WriteMemoryController.scala 139:47]
  wire  _T_57; // @[WriteMemoryController.scala 139:30]
  wire  _T_58; // @[Decoupled.scala 40:37]
  wire [7:0] _T_59; // @[WriteMemoryController.scala 144:36]
  wire  _T_61; // @[WriteMemoryController.scala 146:18]
  wire  _T_62; // @[WriteMemoryController.scala 156:15]
  wire  _T_64; // @[WriteMemoryController.scala 156:32]
  wire  _T_65; // @[WriteMemoryController.scala 158:27]
  wire  _T_68; // @[Decoupled.scala 40:37]
  assign _T_4 = state == 2'h3; // @[WriteMemoryController.scala 89:21]
  assign _T_5 = {ptr,3'h0}; // @[Cat.scala 29:58]
  assign _GEN_29 = {{60'd0}, _T_5}; // @[WriteMemoryController.scala 100:37]
  assign _T_9 = io_NodeReq_ready & io_NodeReq_valid; // @[Decoupled.scala 40:37]
  assign _T_10 = io_NodeReq_bits_address[53:3]; // @[WriteMemoryController.scala 121:44]
  assign _T_11 = {_T_10, 3'h0}; // @[WriteMemoryController.scala 121:69]
  assign _T_12 = io_NodeReq_bits_Typ == 8'h2; // @[helpers.scala 27:24]
  assign _T_13 = io_NodeReq_bits_Typ == 8'h6; // @[helpers.scala 27:47]
  assign _T_14 = _T_12 | _T_13; // @[helpers.scala 27:40]
  assign _T_16 = io_NodeReq_bits_Typ == 8'h1; // @[helpers.scala 28:15]
  assign _T_17 = io_NodeReq_bits_Typ == 8'h5; // @[helpers.scala 28:38]
  assign _T_18 = _T_16 | _T_17; // @[helpers.scala 28:31]
  assign _T_20 = io_NodeReq_bits_Typ == 8'h3; // @[helpers.scala 29:17]
  assign _T_21 = io_NodeReq_bits_Typ == 8'h7; // @[helpers.scala 29:40]
  assign _T_22 = _T_20 | _T_21; // @[helpers.scala 29:33]
  assign _T_28 = io_NodeReq_bits_address[2:0]; // @[helpers.scala 39:32]
  assign _T_29 = {_T_28,3'h0}; // @[Cat.scala 29:58]
  assign _T_43 = _T_22 ? 8'hf : 8'hff; // @[helpers.scala 50:12]
  assign _T_44 = _T_18 ? 8'h1 : _T_43; // @[helpers.scala 49:10]
  assign _T_45 = _T_14 ? 8'h3 : _T_44; // @[helpers.scala 48:19]
  assign _GEN_31 = {{7'd0}, _T_45}; // @[helpers.scala 20:26]
  assign _T_47 = _GEN_31 << _T_28; // @[helpers.scala 20:26]
  assign _GEN_32 = {{63'd0}, io_NodeReq_bits_data}; // @[WriteMemoryController.scala 127:41]
  assign _T_50 = _GEN_32 << _T_29; // @[WriteMemoryController.scala 127:41]
  assign _T_52 = {{1'd0}, _T_50};
  assign _T_53 = _T_52[63:0]; // @[WriteMemoryController.scala 127:121]
  assign _T_54 = _T_52[127:64]; // @[WriteMemoryController.scala 127:121]
  assign _T_55 = state == 2'h1; // @[WriteMemoryController.scala 139:15]
  assign _T_56 = sendbytemask != 16'h0; // @[WriteMemoryController.scala 139:47]
  assign _T_57 = _T_55 & _T_56; // @[WriteMemoryController.scala 139:30]
  assign _T_58 = io_MemReq_ready & io_MemReq_valid; // @[Decoupled.scala 40:37]
  assign _T_59 = sendbytemask[15:8]; // @[WriteMemoryController.scala 144:36]
  assign _T_61 = ptr + 1'h1; // @[WriteMemoryController.scala 146:18]
  assign _T_62 = state == 2'h2; // @[WriteMemoryController.scala 156:15]
  assign _T_64 = _T_62 & io_MemResp_valid; // @[WriteMemoryController.scala 156:32]
  assign _T_65 = sendbytemask == 16'h0; // @[WriteMemoryController.scala 158:27]
  assign _T_68 = io_output_ready & io_output_valid; // @[Decoupled.scala 40:37]
  assign io_NodeReq_ready = state == 2'h0; // @[WriteMemoryController.scala 87:20]
  assign io_MemReq_valid = _T_55 & _T_56; // @[WriteMemoryController.scala 99:19 WriteMemoryController.scala 140:21]
  assign io_MemReq_bits_addr = ReqAddress + _GEN_29; // @[WriteMemoryController.scala 100:23]
  assign io_MemReq_bits_data = ptr ? linebuffer_1 : linebuffer_0; // @[WriteMemoryController.scala 102:23]
  assign io_MemReq_bits_mask = sendbytemask[7:0]; // @[WriteMemoryController.scala 103:23]
  assign io_MemReq_bits_tag = {{7'd0}, myID}; // @[WriteMemoryController.scala 107:22]
  assign io_MemReq_bits_iswrite = isWrite; // @[WriteMemoryController.scala 109:26]
  assign io_output_valid = state == 2'h3; // @[WriteMemoryController.scala 95:19 WriteMemoryController.scala 168:21]
  assign io_free = state == 2'h0; // @[WriteMemoryController.scala 85:11]
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
  ID = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  sendbytemask = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  ReqAddress = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ptr = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  linebuffer_0 = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  linebuffer_1 = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  state = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  myID = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  isWrite = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    ID <= reset | ID;
    if (reset) begin
      sendbytemask <= 16'h0;
    end else if (_T_57) begin
      if (_T_58) begin
        sendbytemask <= {{8'd0}, _T_59};
      end else if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_9) begin
      sendbytemask <= {{1'd0}, _T_47};
    end
    if (reset) begin
      ReqAddress <= 64'h0;
    end else if (_T_9) begin
      ReqAddress <= {{10'd0}, _T_11};
    end
    if (reset) begin
      ptr <= 1'h0;
    end else if (_T_4) begin
      ptr <= 1'h0;
    end else if (_T_57) begin
      if (_T_58) begin
        ptr <= _T_61;
      end
    end
    if (reset) begin
      linebuffer_0 <= 64'h0;
    end else if (_T_9) begin
      linebuffer_0 <= _T_53;
    end
    if (reset) begin
      linebuffer_1 <= 64'h0;
    end else if (_T_9) begin
      linebuffer_1 <= _T_54;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_4) begin
      if (_T_68) begin
        state <= 2'h0;
      end else if (_T_64) begin
        if (_T_65) begin
          state <= 2'h3;
        end else begin
          state <= 2'h1;
        end
      end else if (_T_57) begin
        if (_T_58) begin
          state <= 2'h2;
        end else if (_T_9) begin
          state <= 2'h1;
        end
      end else if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_64) begin
      if (_T_65) begin
        state <= 2'h3;
      end else begin
        state <= 2'h1;
      end
    end else if (_T_57) begin
      if (_T_58) begin
        state <= 2'h2;
      end else if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_9) begin
      state <= 2'h1;
    end
    if (reset) begin
      myID <= 1'h0;
    end else begin
      myID <= ID;
    end
    if (reset) begin
      isWrite <= 1'h0;
    end else begin
      isWrite <= 1'h1;
    end
  end
endmodule
module WriteMemoryController(
  input         clock,
  input         reset,
  output        io_WriteIn_0_ready,
  input         io_WriteIn_0_valid,
  input  [53:0] io_WriteIn_0_bits_address,
  input  [63:0] io_WriteIn_0_bits_data,
  output        io_WriteOut_0_valid,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_bits_data,
  input  [7:0]  io_MemResp_bits_tag
);
  wire  in_arb_io_in_0_ready; // @[WriteMemoryController.scala 194:25]
  wire  in_arb_io_in_0_valid; // @[WriteMemoryController.scala 194:25]
  wire [53:0] in_arb_io_in_0_bits_address; // @[WriteMemoryController.scala 194:25]
  wire [63:0] in_arb_io_in_0_bits_data; // @[WriteMemoryController.scala 194:25]
  wire  in_arb_io_out_ready; // @[WriteMemoryController.scala 194:25]
  wire  in_arb_io_out_valid; // @[WriteMemoryController.scala 194:25]
  wire [53:0] in_arb_io_out_bits_address; // @[WriteMemoryController.scala 194:25]
  wire [63:0] in_arb_io_out_bits_data; // @[WriteMemoryController.scala 194:25]
  wire [7:0] in_arb_io_out_bits_Typ; // @[WriteMemoryController.scala 194:25]
  wire  alloc_arb_io_in_0_ready; // @[WriteMemoryController.scala 196:25]
  wire  alloc_arb_io_in_0_valid; // @[WriteMemoryController.scala 196:25]
  wire  alloc_arb_io_in_1_ready; // @[WriteMemoryController.scala 196:25]
  wire  alloc_arb_io_in_1_valid; // @[WriteMemoryController.scala 196:25]
  wire  alloc_arb_io_out_ready; // @[WriteMemoryController.scala 196:25]
  wire  alloc_arb_io_out_valid; // @[WriteMemoryController.scala 196:25]
  wire  cachereq_arb_io_in_0_ready; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_in_0_valid; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_in_0_bits_addr; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_in_0_bits_data; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_in_0_bits_mask; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_in_0_bits_tag; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_in_0_bits_iswrite; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_in_1_ready; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_in_1_valid; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_in_1_bits_addr; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_in_1_bits_data; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_in_1_bits_mask; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_in_1_bits_tag; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_in_1_bits_iswrite; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_out_ready; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_out_valid; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_out_bits_addr; // @[WriteMemoryController.scala 199:31]
  wire [63:0] cachereq_arb_io_out_bits_data; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_out_bits_mask; // @[WriteMemoryController.scala 199:31]
  wire [7:0] cachereq_arb_io_out_bits_tag; // @[WriteMemoryController.scala 199:31]
  wire  cachereq_arb_io_out_bits_iswrite; // @[WriteMemoryController.scala 199:31]
  wire  cacheresp_demux_io_en; // @[WriteMemoryController.scala 201:31]
  wire [63:0] cacheresp_demux_io_input_data; // @[WriteMemoryController.scala 201:31]
  wire [7:0] cacheresp_demux_io_input_tag; // @[WriteMemoryController.scala 201:31]
  wire  cacheresp_demux_io_sel; // @[WriteMemoryController.scala 201:31]
  wire  cacheresp_demux_io_outputs_0_valid; // @[WriteMemoryController.scala 201:31]
  wire [63:0] cacheresp_demux_io_outputs_0_data; // @[WriteMemoryController.scala 201:31]
  wire [7:0] cacheresp_demux_io_outputs_0_tag; // @[WriteMemoryController.scala 201:31]
  wire  cacheresp_demux_io_outputs_1_valid; // @[WriteMemoryController.scala 201:31]
  wire [63:0] cacheresp_demux_io_outputs_1_data; // @[WriteMemoryController.scala 201:31]
  wire [7:0] cacheresp_demux_io_outputs_1_tag; // @[WriteMemoryController.scala 201:31]
  wire  out_arb_clock; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_in_0_ready; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_in_0_valid; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_in_1_ready; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_in_1_valid; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_out_ready; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_out_valid; // @[WriteMemoryController.scala 204:25]
  wire  out_arb_io_chosen; // @[WriteMemoryController.scala 204:25]
  wire  out_demux_io_outputs_0_valid; // @[WriteMemoryController.scala 205:25]
  wire  out_demux_io_enable; // @[WriteMemoryController.scala 205:25]
  wire  WriteTable_0_clock; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_reset; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_NodeReq_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_NodeReq_valid; // @[WriteMemoryController.scala 223:29]
  wire [53:0] WriteTable_0_io_NodeReq_bits_address; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_0_io_NodeReq_bits_data; // @[WriteMemoryController.scala 223:29]
  wire [7:0] WriteTable_0_io_NodeReq_bits_Typ; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_MemReq_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_MemReq_valid; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_0_io_MemReq_bits_addr; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_0_io_MemReq_bits_data; // @[WriteMemoryController.scala 223:29]
  wire [7:0] WriteTable_0_io_MemReq_bits_mask; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_MemReq_bits_iswrite; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_MemResp_valid; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_output_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_output_valid; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_0_io_free; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_clock; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_reset; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_NodeReq_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_NodeReq_valid; // @[WriteMemoryController.scala 223:29]
  wire [53:0] WriteTable_1_io_NodeReq_bits_address; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_1_io_NodeReq_bits_data; // @[WriteMemoryController.scala 223:29]
  wire [7:0] WriteTable_1_io_NodeReq_bits_Typ; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_MemReq_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_MemReq_valid; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_1_io_MemReq_bits_addr; // @[WriteMemoryController.scala 223:29]
  wire [63:0] WriteTable_1_io_MemReq_bits_data; // @[WriteMemoryController.scala 223:29]
  wire [7:0] WriteTable_1_io_MemReq_bits_mask; // @[WriteMemoryController.scala 223:29]
  wire [7:0] WriteTable_1_io_MemReq_bits_tag; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_MemReq_bits_iswrite; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_MemResp_valid; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_output_ready; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_output_valid; // @[WriteMemoryController.scala 223:29]
  wire  WriteTable_1_io_free; // @[WriteMemoryController.scala 223:29]
  ArbiterTree in_arb ( // @[WriteMemoryController.scala 194:25]
    .io_in_0_ready(in_arb_io_in_0_ready),
    .io_in_0_valid(in_arb_io_in_0_valid),
    .io_in_0_bits_address(in_arb_io_in_0_bits_address),
    .io_in_0_bits_data(in_arb_io_in_0_bits_data),
    .io_out_ready(in_arb_io_out_ready),
    .io_out_valid(in_arb_io_out_valid),
    .io_out_bits_address(in_arb_io_out_bits_address),
    .io_out_bits_data(in_arb_io_out_bits_data),
    .io_out_bits_Typ(in_arb_io_out_bits_Typ)
  );
  Arbiter alloc_arb ( // @[WriteMemoryController.scala 196:25]
    .io_in_0_ready(alloc_arb_io_in_0_ready),
    .io_in_0_valid(alloc_arb_io_in_0_valid),
    .io_in_1_ready(alloc_arb_io_in_1_ready),
    .io_in_1_valid(alloc_arb_io_in_1_valid),
    .io_out_ready(alloc_arb_io_out_ready),
    .io_out_valid(alloc_arb_io_out_valid)
  );
  Arbiter_1 cachereq_arb ( // @[WriteMemoryController.scala 199:31]
    .io_in_0_ready(cachereq_arb_io_in_0_ready),
    .io_in_0_valid(cachereq_arb_io_in_0_valid),
    .io_in_0_bits_addr(cachereq_arb_io_in_0_bits_addr),
    .io_in_0_bits_data(cachereq_arb_io_in_0_bits_data),
    .io_in_0_bits_mask(cachereq_arb_io_in_0_bits_mask),
    .io_in_0_bits_tag(cachereq_arb_io_in_0_bits_tag),
    .io_in_0_bits_iswrite(cachereq_arb_io_in_0_bits_iswrite),
    .io_in_1_ready(cachereq_arb_io_in_1_ready),
    .io_in_1_valid(cachereq_arb_io_in_1_valid),
    .io_in_1_bits_addr(cachereq_arb_io_in_1_bits_addr),
    .io_in_1_bits_data(cachereq_arb_io_in_1_bits_data),
    .io_in_1_bits_mask(cachereq_arb_io_in_1_bits_mask),
    .io_in_1_bits_tag(cachereq_arb_io_in_1_bits_tag),
    .io_in_1_bits_iswrite(cachereq_arb_io_in_1_bits_iswrite),
    .io_out_ready(cachereq_arb_io_out_ready),
    .io_out_valid(cachereq_arb_io_out_valid),
    .io_out_bits_addr(cachereq_arb_io_out_bits_addr),
    .io_out_bits_data(cachereq_arb_io_out_bits_data),
    .io_out_bits_mask(cachereq_arb_io_out_bits_mask),
    .io_out_bits_tag(cachereq_arb_io_out_bits_tag),
    .io_out_bits_iswrite(cachereq_arb_io_out_bits_iswrite)
  );
  Demux cacheresp_demux ( // @[WriteMemoryController.scala 201:31]
    .io_en(cacheresp_demux_io_en),
    .io_input_data(cacheresp_demux_io_input_data),
    .io_input_tag(cacheresp_demux_io_input_tag),
    .io_sel(cacheresp_demux_io_sel),
    .io_outputs_0_valid(cacheresp_demux_io_outputs_0_valid),
    .io_outputs_0_data(cacheresp_demux_io_outputs_0_data),
    .io_outputs_0_tag(cacheresp_demux_io_outputs_0_tag),
    .io_outputs_1_valid(cacheresp_demux_io_outputs_1_valid),
    .io_outputs_1_data(cacheresp_demux_io_outputs_1_data),
    .io_outputs_1_tag(cacheresp_demux_io_outputs_1_tag)
  );
  RRArbiter out_arb ( // @[WriteMemoryController.scala 204:25]
    .clock(out_arb_clock),
    .io_in_0_ready(out_arb_io_in_0_ready),
    .io_in_0_valid(out_arb_io_in_0_valid),
    .io_in_1_ready(out_arb_io_in_1_ready),
    .io_in_1_valid(out_arb_io_in_1_valid),
    .io_out_ready(out_arb_io_out_ready),
    .io_out_valid(out_arb_io_out_valid),
    .io_chosen(out_arb_io_chosen)
  );
  DeMuxTree out_demux ( // @[WriteMemoryController.scala 205:25]
    .io_outputs_0_valid(out_demux_io_outputs_0_valid),
    .io_enable(out_demux_io_enable)
  );
  WriteTableEntry WriteTable_0 ( // @[WriteMemoryController.scala 223:29]
    .clock(WriteTable_0_clock),
    .reset(WriteTable_0_reset),
    .io_NodeReq_ready(WriteTable_0_io_NodeReq_ready),
    .io_NodeReq_valid(WriteTable_0_io_NodeReq_valid),
    .io_NodeReq_bits_address(WriteTable_0_io_NodeReq_bits_address),
    .io_NodeReq_bits_data(WriteTable_0_io_NodeReq_bits_data),
    .io_NodeReq_bits_Typ(WriteTable_0_io_NodeReq_bits_Typ),
    .io_MemReq_ready(WriteTable_0_io_MemReq_ready),
    .io_MemReq_valid(WriteTable_0_io_MemReq_valid),
    .io_MemReq_bits_addr(WriteTable_0_io_MemReq_bits_addr),
    .io_MemReq_bits_data(WriteTable_0_io_MemReq_bits_data),
    .io_MemReq_bits_mask(WriteTable_0_io_MemReq_bits_mask),
    .io_MemReq_bits_iswrite(WriteTable_0_io_MemReq_bits_iswrite),
    .io_MemResp_valid(WriteTable_0_io_MemResp_valid),
    .io_output_ready(WriteTable_0_io_output_ready),
    .io_output_valid(WriteTable_0_io_output_valid),
    .io_free(WriteTable_0_io_free)
  );
  WriteTableEntry_1 WriteTable_1 ( // @[WriteMemoryController.scala 223:29]
    .clock(WriteTable_1_clock),
    .reset(WriteTable_1_reset),
    .io_NodeReq_ready(WriteTable_1_io_NodeReq_ready),
    .io_NodeReq_valid(WriteTable_1_io_NodeReq_valid),
    .io_NodeReq_bits_address(WriteTable_1_io_NodeReq_bits_address),
    .io_NodeReq_bits_data(WriteTable_1_io_NodeReq_bits_data),
    .io_NodeReq_bits_Typ(WriteTable_1_io_NodeReq_bits_Typ),
    .io_MemReq_ready(WriteTable_1_io_MemReq_ready),
    .io_MemReq_valid(WriteTable_1_io_MemReq_valid),
    .io_MemReq_bits_addr(WriteTable_1_io_MemReq_bits_addr),
    .io_MemReq_bits_data(WriteTable_1_io_MemReq_bits_data),
    .io_MemReq_bits_mask(WriteTable_1_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(WriteTable_1_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(WriteTable_1_io_MemReq_bits_iswrite),
    .io_MemResp_valid(WriteTable_1_io_MemResp_valid),
    .io_output_ready(WriteTable_1_io_output_ready),
    .io_output_valid(WriteTable_1_io_output_valid),
    .io_free(WriteTable_1_io_free)
  );
  assign io_WriteIn_0_ready = in_arb_io_in_0_ready; // @[WriteMemoryController.scala 213:21]
  assign io_WriteOut_0_valid = out_demux_io_outputs_0_valid; // @[WriteMemoryController.scala 214:20]
  assign io_MemReq_valid = cachereq_arb_io_out_valid; // @[WriteMemoryController.scala 261:13]
  assign io_MemReq_bits_addr = cachereq_arb_io_out_bits_addr; // @[WriteMemoryController.scala 261:13]
  assign io_MemReq_bits_data = cachereq_arb_io_out_bits_data; // @[WriteMemoryController.scala 261:13]
  assign io_MemReq_bits_mask = cachereq_arb_io_out_bits_mask; // @[WriteMemoryController.scala 261:13]
  assign io_MemReq_bits_tag = cachereq_arb_io_out_bits_tag; // @[WriteMemoryController.scala 261:13]
  assign io_MemReq_bits_iswrite = cachereq_arb_io_out_bits_iswrite; // @[WriteMemoryController.scala 261:13]
  assign in_arb_io_in_0_valid = io_WriteIn_0_valid; // @[WriteMemoryController.scala 213:21]
  assign in_arb_io_in_0_bits_address = io_WriteIn_0_bits_address; // @[WriteMemoryController.scala 213:21]
  assign in_arb_io_in_0_bits_data = io_WriteIn_0_bits_data; // @[WriteMemoryController.scala 213:21]
  assign in_arb_io_out_ready = alloc_arb_io_out_valid; // @[WriteMemoryController.scala 256:23]
  assign alloc_arb_io_in_0_valid = WriteTable_0_io_free; // @[WriteMemoryController.scala 226:30]
  assign alloc_arb_io_in_1_valid = WriteTable_1_io_free; // @[WriteMemoryController.scala 226:30]
  assign alloc_arb_io_out_ready = in_arb_io_out_valid; // @[WriteMemoryController.scala 257:26]
  assign cachereq_arb_io_in_0_valid = WriteTable_0_io_MemReq_valid; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_0_bits_addr = WriteTable_0_io_MemReq_bits_addr; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_0_bits_data = WriteTable_0_io_MemReq_bits_data; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_0_bits_mask = WriteTable_0_io_MemReq_bits_mask; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_0_bits_tag = 8'h0; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_0_bits_iswrite = WriteTable_0_io_MemReq_bits_iswrite; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_valid = WriteTable_1_io_MemReq_valid; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_bits_addr = WriteTable_1_io_MemReq_bits_addr; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_bits_data = WriteTable_1_io_MemReq_bits_data; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_bits_mask = WriteTable_1_io_MemReq_bits_mask; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_bits_tag = WriteTable_1_io_MemReq_bits_tag; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_in_1_bits_iswrite = WriteTable_1_io_MemReq_bits_iswrite; // @[WriteMemoryController.scala 232:27]
  assign cachereq_arb_io_out_ready = io_MemReq_ready; // @[WriteMemoryController.scala 261:13]
  assign cacheresp_demux_io_en = io_MemResp_valid; // @[WriteMemoryController.scala 264:25]
  assign cacheresp_demux_io_input_data = io_MemResp_bits_data; // @[WriteMemoryController.scala 265:28]
  assign cacheresp_demux_io_input_tag = io_MemResp_bits_tag; // @[WriteMemoryController.scala 265:28]
  assign cacheresp_demux_io_sel = io_MemResp_bits_tag[0]; // @[WriteMemoryController.scala 266:26]
  assign out_arb_clock = clock;
  assign out_arb_io_in_0_valid = WriteTable_0_io_output_valid; // @[WriteMemoryController.scala 238:22]
  assign out_arb_io_in_1_valid = WriteTable_1_io_output_valid; // @[WriteMemoryController.scala 238:22]
  assign out_arb_io_out_ready = 1'h1; // @[WriteMemoryController.scala 269:24]
  assign out_demux_io_enable = out_arb_io_out_ready & out_arb_io_out_valid; // @[WriteMemoryController.scala 270:23]
  assign WriteTable_0_clock = clock;
  assign WriteTable_0_reset = reset;
  assign WriteTable_0_io_NodeReq_valid = alloc_arb_io_in_0_ready & alloc_arb_io_in_0_valid; // @[WriteMemoryController.scala 228:34]
  assign WriteTable_0_io_NodeReq_bits_address = in_arb_io_out_bits_address; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_0_io_NodeReq_bits_data = in_arb_io_out_bits_data; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_0_io_NodeReq_bits_Typ = in_arb_io_out_bits_Typ; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_0_io_MemReq_ready = cachereq_arb_io_in_0_ready; // @[WriteMemoryController.scala 232:27]
  assign WriteTable_0_io_MemResp_valid = cacheresp_demux_io_outputs_0_valid; // @[WriteMemoryController.scala 235:28]
  assign WriteTable_0_io_output_ready = out_arb_io_in_0_ready; // @[WriteMemoryController.scala 238:22]
  assign WriteTable_1_clock = clock;
  assign WriteTable_1_reset = reset;
  assign WriteTable_1_io_NodeReq_valid = alloc_arb_io_in_1_ready & alloc_arb_io_in_1_valid; // @[WriteMemoryController.scala 228:34]
  assign WriteTable_1_io_NodeReq_bits_address = in_arb_io_out_bits_address; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_1_io_NodeReq_bits_data = in_arb_io_out_bits_data; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_1_io_NodeReq_bits_Typ = in_arb_io_out_bits_Typ; // @[WriteMemoryController.scala 229:33]
  assign WriteTable_1_io_MemReq_ready = cachereq_arb_io_in_1_ready; // @[WriteMemoryController.scala 232:27]
  assign WriteTable_1_io_MemResp_valid = cacheresp_demux_io_outputs_1_valid; // @[WriteMemoryController.scala 235:28]
  assign WriteTable_1_io_output_ready = out_arb_io_in_1_ready; // @[WriteMemoryController.scala 238:22]
endmodule
module LockingRRArbiter_1(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_address,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [63:0] io_in_1_bits_address,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_RouteID,
  output [63:0] io_out_bits_address,
  output        io_chosen
);
  wire  _T; // @[Decoupled.scala 40:37]
  reg  _T_1; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire  _T_3; // @[Arbiter.scala 67:57]
  wire  _T_5; // @[Arbiter.scala 68:83]
  wire  _T_7; // @[Arbiter.scala 31:68]
  wire  _T_9; // @[Arbiter.scala 31:78]
  wire  _T_10; // @[Arbiter.scala 31:78]
  wire  _T_14; // @[Arbiter.scala 72:50]
  wire  _GEN_13; // @[Arbiter.scala 77:27]
  assign _T = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  assign _T_3 = 1'h1 > _T_1; // @[Arbiter.scala 67:57]
  assign _T_5 = io_in_1_valid & _T_3; // @[Arbiter.scala 68:83]
  assign _T_7 = _T_5 | io_in_0_valid; // @[Arbiter.scala 31:68]
  assign _T_9 = _T_5 == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_10 = _T_7 == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_14 = _T_3 | _T_10; // @[Arbiter.scala 72:50]
  assign _GEN_13 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27]
  assign io_in_0_ready = _T_9 & io_out_ready; // @[Arbiter.scala 60:16]
  assign io_in_1_ready = _T_14 & io_out_ready; // @[Arbiter.scala 60:16]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16]
  assign io_out_bits_RouteID = io_chosen ? 16'h1 : 16'h0; // @[Arbiter.scala 42:15]
  assign io_out_bits_address = io_chosen ? io_in_1_bits_address : io_in_0_bits_address; // @[Arbiter.scala 42:15]
  assign io_chosen = _T_5 | _GEN_13; // @[Arbiter.scala 40:13]
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
  _T_1 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T) begin
      _T_1 <= io_chosen;
    end
  end
endmodule
module ArbiterTree_1(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_address,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [63:0] io_in_1_bits_address,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_RouteID,
  output [63:0] io_out_bits_address
);
  wire  LockingRRArbiter_clock; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_in_0_ready; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_in_0_valid; // @[ArbiterTree.scala 34:13]
  wire [63:0] LockingRRArbiter_io_in_0_bits_address; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_in_1_ready; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_in_1_valid; // @[ArbiterTree.scala 34:13]
  wire [63:0] LockingRRArbiter_io_in_1_bits_address; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_out_ready; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_out_valid; // @[ArbiterTree.scala 34:13]
  wire [15:0] LockingRRArbiter_io_out_bits_RouteID; // @[ArbiterTree.scala 34:13]
  wire [63:0] LockingRRArbiter_io_out_bits_address; // @[ArbiterTree.scala 34:13]
  wire  LockingRRArbiter_io_chosen; // @[ArbiterTree.scala 34:13]
  LockingRRArbiter_1 LockingRRArbiter ( // @[ArbiterTree.scala 34:13]
    .clock(LockingRRArbiter_clock),
    .io_in_0_ready(LockingRRArbiter_io_in_0_ready),
    .io_in_0_valid(LockingRRArbiter_io_in_0_valid),
    .io_in_0_bits_address(LockingRRArbiter_io_in_0_bits_address),
    .io_in_1_ready(LockingRRArbiter_io_in_1_ready),
    .io_in_1_valid(LockingRRArbiter_io_in_1_valid),
    .io_in_1_bits_address(LockingRRArbiter_io_in_1_bits_address),
    .io_out_ready(LockingRRArbiter_io_out_ready),
    .io_out_valid(LockingRRArbiter_io_out_valid),
    .io_out_bits_RouteID(LockingRRArbiter_io_out_bits_RouteID),
    .io_out_bits_address(LockingRRArbiter_io_out_bits_address),
    .io_chosen(LockingRRArbiter_io_chosen)
  );
  assign io_in_0_ready = LockingRRArbiter_io_in_0_ready; // @[ArbiterTree.scala 51:61]
  assign io_in_1_ready = LockingRRArbiter_io_in_1_ready; // @[ArbiterTree.scala 51:61]
  assign io_out_valid = LockingRRArbiter_io_out_valid; // @[ArbiterTree.scala 67:12]
  assign io_out_bits_RouteID = LockingRRArbiter_io_out_bits_RouteID; // @[ArbiterTree.scala 67:12]
  assign io_out_bits_address = LockingRRArbiter_io_out_bits_address; // @[ArbiterTree.scala 67:12]
  assign LockingRRArbiter_clock = clock;
  assign LockingRRArbiter_io_in_0_valid = io_in_0_valid; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_in_0_bits_address = io_in_0_bits_address; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_in_1_valid = io_in_1_valid; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_in_1_bits_address = io_in_1_bits_address; // @[ArbiterTree.scala 51:61]
  assign LockingRRArbiter_io_out_ready = io_out_ready; // @[ArbiterTree.scala 67:12]
endmodule
module RRArbiter_1(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [15:0] io_in_0_bits_RouteID,
  input  [63:0] io_in_0_bits_data,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [15:0] io_in_1_bits_RouteID,
  input  [63:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_RouteID,
  output [63:0] io_out_bits_data,
  output        io_chosen
);
  reg  _T_1; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire  _T_3; // @[Arbiter.scala 67:57]
  wire  _T_5; // @[Arbiter.scala 68:83]
  wire  _T_7; // @[Arbiter.scala 31:68]
  wire  _T_10; // @[Arbiter.scala 31:78]
  wire  _GEN_11; // @[Arbiter.scala 77:27]
  assign _T_3 = 1'h1 > _T_1; // @[Arbiter.scala 67:57]
  assign _T_5 = io_in_1_valid & _T_3; // @[Arbiter.scala 68:83]
  assign _T_7 = _T_5 | io_in_0_valid; // @[Arbiter.scala 31:68]
  assign _T_10 = _T_7 == 1'h0; // @[Arbiter.scala 31:78]
  assign _GEN_11 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27]
  assign io_in_0_ready = _T_5 == 1'h0; // @[Arbiter.scala 60:16]
  assign io_in_1_ready = _T_3 | _T_10; // @[Arbiter.scala 60:16]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16]
  assign io_out_bits_RouteID = io_chosen ? io_in_1_bits_RouteID : io_in_0_bits_RouteID; // @[Arbiter.scala 42:15]
  assign io_out_bits_data = io_chosen ? io_in_1_bits_data : io_in_0_bits_data; // @[Arbiter.scala 42:15]
  assign io_chosen = _T_5 | _GEN_11; // @[Arbiter.scala 40:13]
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
  _T_1 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_out_valid) begin
      _T_1 <= io_chosen;
    end
  end
endmodule
module Demux_3(
  input         io_en,
  input  [63:0] io_input_data,
  input         io_sel,
  output        io_outputs_0_valid,
  output [63:0] io_outputs_0_data,
  output        io_outputs_1_valid,
  output [63:0] io_outputs_1_data
);
  wire  _GEN_0; // @[Muxes.scala 31:25]
  assign _GEN_0 = 1'h0 == io_sel; // @[Muxes.scala 31:25]
  assign io_outputs_0_valid = io_en & _GEN_0; // @[Muxes.scala 25:19 Muxes.scala 29:27 Muxes.scala 31:25 Muxes.scala 34:27]
  assign io_outputs_0_data = io_input_data; // @[Muxes.scala 25:19]
  assign io_outputs_1_valid = io_en & io_sel; // @[Muxes.scala 25:19 Muxes.scala 29:27 Muxes.scala 31:25 Muxes.scala 34:27]
  assign io_outputs_1_data = io_input_data; // @[Muxes.scala 25:19]
endmodule
module DeMuxTree_1(
  output        io_outputs_0_valid,
  output [63:0] io_outputs_0_data,
  output        io_outputs_1_valid,
  output [63:0] io_outputs_1_data,
  input  [15:0] io_input_RouteID,
  input  [63:0] io_input_data,
  input         io_enable
);
  wire  Demux_io_en; // @[Muxes.scala 93:13]
  wire [63:0] Demux_io_input_data; // @[Muxes.scala 93:13]
  wire  Demux_io_sel; // @[Muxes.scala 93:13]
  wire  Demux_io_outputs_0_valid; // @[Muxes.scala 93:13]
  wire [63:0] Demux_io_outputs_0_data; // @[Muxes.scala 93:13]
  wire  Demux_io_outputs_1_valid; // @[Muxes.scala 93:13]
  wire [63:0] Demux_io_outputs_1_data; // @[Muxes.scala 93:13]
  Demux_3 Demux ( // @[Muxes.scala 93:13]
    .io_en(Demux_io_en),
    .io_input_data(Demux_io_input_data),
    .io_sel(Demux_io_sel),
    .io_outputs_0_valid(Demux_io_outputs_0_valid),
    .io_outputs_0_data(Demux_io_outputs_0_data),
    .io_outputs_1_valid(Demux_io_outputs_1_valid),
    .io_outputs_1_data(Demux_io_outputs_1_data)
  );
  assign io_outputs_0_valid = Demux_io_outputs_0_valid; // @[Muxes.scala 121:25]
  assign io_outputs_0_data = Demux_io_outputs_0_data; // @[Muxes.scala 121:25]
  assign io_outputs_1_valid = Demux_io_outputs_1_valid; // @[Muxes.scala 121:25]
  assign io_outputs_1_data = Demux_io_outputs_1_data; // @[Muxes.scala 121:25]
  assign Demux_io_en = io_enable; // @[Muxes.scala 137:14]
  assign Demux_io_input_data = io_input_data; // @[Muxes.scala 136:17]
  assign Demux_io_sel = io_input_RouteID[0]; // @[Muxes.scala 138:15]
endmodule
module ReadTableEntry(
  input         clock,
  input         reset,
  output        io_NodeReq_ready,
  input         io_NodeReq_valid,
  input  [15:0] io_NodeReq_bits_RouteID,
  input  [63:0] io_NodeReq_bits_address,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_data,
  input         io_output_ready,
  output        io_output_valid,
  output [15:0] io_output_bits_RouteID,
  output [63:0] io_output_bits_data,
  output        io_free
);
  reg  ID; // @[ReadMemoryController.scala 49:19]
  reg [31:0] _RAND_0;
  reg [15:0] request_R_RouteID; // @[ReadMemoryController.scala 51:32]
  reg [31:0] _RAND_1;
  reg [63:0] request_R_address; // @[ReadMemoryController.scala 51:32]
  reg [63:0] _RAND_2;
  reg [127:0] bitmask; // @[ReadMemoryController.scala 56:29]
  reg [127:0] _RAND_3;
  reg [15:0] sendbytemask; // @[ReadMemoryController.scala 58:29]
  reg [31:0] _RAND_4;
  reg [63:0] ReqAddress; // @[ReadMemoryController.scala 62:27]
  reg [63:0] _RAND_5;
  reg  ptr; // @[ReadMemoryController.scala 66:27]
  reg [31:0] _RAND_6;
  reg [63:0] linebuffer_0; // @[ReadMemoryController.scala 67:27]
  reg [63:0] _RAND_7;
  reg [63:0] linebuffer_1; // @[ReadMemoryController.scala 67:27]
  reg [63:0] _RAND_8;
  reg [1:0] state; // @[ReadMemoryController.scala 73:68]
  reg [31:0] _RAND_9;
  wire [3:0] _T_6; // @[Cat.scala 29:58]
  wire [63:0] _GEN_57; // @[ReadMemoryController.scala 96:37]
  reg  isWrite; // @[ReadMemoryController.scala 100:24]
  reg [31:0] _RAND_10;
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire [60:0] _T_10; // @[ReadMemoryController.scala 115:44]
  wire [63:0] _T_11; // @[ReadMemoryController.scala 115:69]
  wire [2:0] _T_28; // @[helpers.scala 39:32]
  wire [5:0] _T_29; // @[Cat.scala 29:58]
  wire [126:0] _T_30; // @[helpers.scala 40:26]
  wire [14:0] _T_47; // @[helpers.scala 20:26]
  wire  _T_48; // @[Conditional.scala 37:30]
  wire  _T_50; // @[Conditional.scala 37:30]
  wire [7:0] _T_51; // @[ReadMemoryController.scala 144:38]
  wire  _T_52; // @[Conditional.scala 37:30]
  wire  _T_54; // @[ReadMemoryController.scala 154:20]
  wire  _T_55; // @[ReadMemoryController.scala 156:27]
  wire  _T_56; // @[Conditional.scala 37:30]
  wire [127:0] _T_57; // @[ReadMemoryController.scala 165:29]
  wire [127:0] _T_58; // @[ReadMemoryController.scala 165:36]
  wire [2:0] _T_59; // @[ReadMemoryController.scala 165:71]
  wire [5:0] _T_60; // @[Cat.scala 29:58]
  wire [127:0] _T_61; // @[ReadMemoryController.scala 165:47]
  wire [127:0] _GEN_20; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_31; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_42; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_53; // @[Conditional.scala 40:58]
  wire [63:0] output_; // @[ReadMemoryController.scala 165:14]
  wire [63:0] _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_30; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_41; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_43; // @[Conditional.scala 39:67]
  assign _T_6 = {ptr,3'h0}; // @[Cat.scala 29:58]
  assign _GEN_57 = {{60'd0}, _T_6}; // @[ReadMemoryController.scala 96:37]
  assign _T_9 = io_NodeReq_ready & io_NodeReq_valid; // @[Decoupled.scala 40:37]
  assign _T_10 = io_NodeReq_bits_address[63:3]; // @[ReadMemoryController.scala 115:44]
  assign _T_11 = {_T_10, 3'h0}; // @[ReadMemoryController.scala 115:69]
  assign _T_28 = io_NodeReq_bits_address[2:0]; // @[helpers.scala 39:32]
  assign _T_29 = {_T_28,3'h0}; // @[Cat.scala 29:58]
  assign _T_30 = 127'hffffffffffffffff << _T_29; // @[helpers.scala 40:26]
  assign _T_47 = 15'hff << _T_28; // @[helpers.scala 20:26]
  assign _T_48 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_50 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_51 = sendbytemask[15:8]; // @[ReadMemoryController.scala 144:38]
  assign _T_52 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_54 = ptr + 1'h1; // @[ReadMemoryController.scala 154:20]
  assign _T_55 = sendbytemask == 16'h0; // @[ReadMemoryController.scala 156:27]
  assign _T_56 = 2'h3 == state; // @[Conditional.scala 37:30]
  assign _T_57 = {linebuffer_1,linebuffer_0}; // @[ReadMemoryController.scala 165:29]
  assign _T_58 = _T_57 & bitmask; // @[ReadMemoryController.scala 165:36]
  assign _T_59 = request_R_address[2:0]; // @[ReadMemoryController.scala 165:71]
  assign _T_60 = {_T_59,3'h0}; // @[Cat.scala 29:58]
  assign _T_61 = _T_58 >> _T_60; // @[ReadMemoryController.scala 165:47]
  assign _GEN_20 = _T_56 ? _T_61 : 128'h0; // @[Conditional.scala 39:67]
  assign _GEN_31 = _T_52 ? 128'h0 : _GEN_20; // @[Conditional.scala 39:67]
  assign _GEN_42 = _T_50 ? 128'h0 : _GEN_31; // @[Conditional.scala 39:67]
  assign _GEN_53 = _T_48 ? 128'h0 : _GEN_42; // @[Conditional.scala 40:58]
  assign output_ = _GEN_53[63:0]; // @[ReadMemoryController.scala 165:14]
  assign _GEN_21 = _T_56 ? output_ : 64'h0; // @[Conditional.scala 39:67]
  assign _GEN_30 = _T_52 ? 1'h0 : _T_56; // @[Conditional.scala 39:67]
  assign _GEN_32 = _T_52 ? 64'h0 : _GEN_21; // @[Conditional.scala 39:67]
  assign _GEN_41 = _T_50 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  assign _GEN_43 = _T_50 ? 64'h0 : _GEN_32; // @[Conditional.scala 39:67]
  assign io_NodeReq_ready = state == 2'h0; // @[ReadMemoryController.scala 83:20]
  assign io_MemReq_valid = _T_48 ? 1'h0 : _T_50; // @[ReadMemoryController.scala 95:19 ReadMemoryController.scala 140:23]
  assign io_MemReq_bits_addr = ReqAddress + _GEN_57; // @[ReadMemoryController.scala 96:23]
  assign io_MemReq_bits_tag = {{7'd0}, ID}; // @[ReadMemoryController.scala 99:22]
  assign io_MemReq_bits_iswrite = isWrite; // @[ReadMemoryController.scala 101:26]
  assign io_output_valid = _T_48 ? 1'h0 : _GEN_41; // @[ReadMemoryController.scala 90:19 ReadMemoryController.scala 164:23]
  assign io_output_bits_RouteID = request_R_RouteID; // @[ReadMemoryController.scala 91:26]
  assign io_output_bits_data = _T_48 ? 64'h0 : _GEN_43; // @[ReadMemoryController.scala 93:23 ReadMemoryController.scala 166:27]
  assign io_free = state == 2'h0; // @[ReadMemoryController.scala 81:11]
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
  ID = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  request_R_RouteID = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  request_R_address = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {4{`RANDOM}};
  bitmask = _RAND_3[127:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  sendbytemask = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  ReqAddress = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ptr = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  linebuffer_0 = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  linebuffer_1 = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  state = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  isWrite = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    ID <= reset;
    if (reset) begin
      request_R_RouteID <= 16'h0;
    end else if (_T_9) begin
      request_R_RouteID <= io_NodeReq_bits_RouteID;
    end
    if (reset) begin
      request_R_address <= 64'h0;
    end else if (_T_9) begin
      request_R_address <= io_NodeReq_bits_address;
    end
    if (reset) begin
      bitmask <= 128'h0;
    end else if (_T_9) begin
      bitmask <= {{1'd0}, _T_30};
    end
    if (reset) begin
      sendbytemask <= 16'h0;
    end else if (_T_48) begin
      if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_50) begin
      if (io_MemReq_ready) begin
        sendbytemask <= {{8'd0}, _T_51};
      end else if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_9) begin
      sendbytemask <= {{1'd0}, _T_47};
    end
    if (reset) begin
      ReqAddress <= 64'h0;
    end else if (_T_9) begin
      ReqAddress <= _T_11;
    end
    if (reset) begin
      ptr <= 1'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            ptr <= _T_54;
          end
        end else if (_T_56) begin
          ptr <= 1'h0;
        end
      end
    end
    if (reset) begin
      linebuffer_0 <= 64'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            if (1'h0 == ptr) begin
              linebuffer_0 <= io_MemResp_data;
            end
          end
        end
      end
    end
    if (reset) begin
      linebuffer_1 <= 64'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            if (ptr) begin
              linebuffer_1 <= io_MemResp_data;
            end
          end
        end
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_48) begin
      if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_50) begin
      if (io_MemReq_ready) begin
        state <= 2'h2;
      end
    end else if (_T_52) begin
      if (io_MemResp_valid) begin
        if (_T_55) begin
          state <= 2'h3;
        end else begin
          state <= 2'h1;
        end
      end
    end else if (_T_56) begin
      if (io_output_ready) begin
        state <= 2'h0;
      end
    end
    isWrite <= reset;
  end
endmodule
module ReadTableEntry_1(
  input         clock,
  input         reset,
  output        io_NodeReq_ready,
  input         io_NodeReq_valid,
  input  [15:0] io_NodeReq_bits_RouteID,
  input  [63:0] io_NodeReq_bits_address,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_data,
  input         io_output_ready,
  output        io_output_valid,
  output [15:0] io_output_bits_RouteID,
  output [63:0] io_output_bits_data,
  output        io_free
);
  reg  ID; // @[ReadMemoryController.scala 49:19]
  reg [31:0] _RAND_0;
  reg [15:0] request_R_RouteID; // @[ReadMemoryController.scala 51:32]
  reg [31:0] _RAND_1;
  reg [63:0] request_R_address; // @[ReadMemoryController.scala 51:32]
  reg [63:0] _RAND_2;
  reg [127:0] bitmask; // @[ReadMemoryController.scala 56:29]
  reg [127:0] _RAND_3;
  reg [15:0] sendbytemask; // @[ReadMemoryController.scala 58:29]
  reg [31:0] _RAND_4;
  reg [63:0] ReqAddress; // @[ReadMemoryController.scala 62:27]
  reg [63:0] _RAND_5;
  reg  ptr; // @[ReadMemoryController.scala 66:27]
  reg [31:0] _RAND_6;
  reg [63:0] linebuffer_0; // @[ReadMemoryController.scala 67:27]
  reg [63:0] _RAND_7;
  reg [63:0] linebuffer_1; // @[ReadMemoryController.scala 67:27]
  reg [63:0] _RAND_8;
  reg [1:0] state; // @[ReadMemoryController.scala 73:68]
  reg [31:0] _RAND_9;
  wire [3:0] _T_6; // @[Cat.scala 29:58]
  wire [63:0] _GEN_57; // @[ReadMemoryController.scala 96:37]
  reg  isWrite; // @[ReadMemoryController.scala 100:24]
  reg [31:0] _RAND_10;
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire [60:0] _T_10; // @[ReadMemoryController.scala 115:44]
  wire [63:0] _T_11; // @[ReadMemoryController.scala 115:69]
  wire [2:0] _T_28; // @[helpers.scala 39:32]
  wire [5:0] _T_29; // @[Cat.scala 29:58]
  wire [126:0] _T_30; // @[helpers.scala 40:26]
  wire [14:0] _T_47; // @[helpers.scala 20:26]
  wire  _T_48; // @[Conditional.scala 37:30]
  wire  _T_50; // @[Conditional.scala 37:30]
  wire [7:0] _T_51; // @[ReadMemoryController.scala 144:38]
  wire  _T_52; // @[Conditional.scala 37:30]
  wire  _T_54; // @[ReadMemoryController.scala 154:20]
  wire  _T_55; // @[ReadMemoryController.scala 156:27]
  wire  _T_56; // @[Conditional.scala 37:30]
  wire [127:0] _T_57; // @[ReadMemoryController.scala 165:29]
  wire [127:0] _T_58; // @[ReadMemoryController.scala 165:36]
  wire [2:0] _T_59; // @[ReadMemoryController.scala 165:71]
  wire [5:0] _T_60; // @[Cat.scala 29:58]
  wire [127:0] _T_61; // @[ReadMemoryController.scala 165:47]
  wire [127:0] _GEN_20; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_31; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_42; // @[Conditional.scala 39:67]
  wire [127:0] _GEN_53; // @[Conditional.scala 40:58]
  wire [63:0] output_; // @[ReadMemoryController.scala 165:14]
  wire [63:0] _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_30; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_41; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_43; // @[Conditional.scala 39:67]
  assign _T_6 = {ptr,3'h0}; // @[Cat.scala 29:58]
  assign _GEN_57 = {{60'd0}, _T_6}; // @[ReadMemoryController.scala 96:37]
  assign _T_9 = io_NodeReq_ready & io_NodeReq_valid; // @[Decoupled.scala 40:37]
  assign _T_10 = io_NodeReq_bits_address[63:3]; // @[ReadMemoryController.scala 115:44]
  assign _T_11 = {_T_10, 3'h0}; // @[ReadMemoryController.scala 115:69]
  assign _T_28 = io_NodeReq_bits_address[2:0]; // @[helpers.scala 39:32]
  assign _T_29 = {_T_28,3'h0}; // @[Cat.scala 29:58]
  assign _T_30 = 127'hffffffffffffffff << _T_29; // @[helpers.scala 40:26]
  assign _T_47 = 15'hff << _T_28; // @[helpers.scala 20:26]
  assign _T_48 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_50 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_51 = sendbytemask[15:8]; // @[ReadMemoryController.scala 144:38]
  assign _T_52 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_54 = ptr + 1'h1; // @[ReadMemoryController.scala 154:20]
  assign _T_55 = sendbytemask == 16'h0; // @[ReadMemoryController.scala 156:27]
  assign _T_56 = 2'h3 == state; // @[Conditional.scala 37:30]
  assign _T_57 = {linebuffer_1,linebuffer_0}; // @[ReadMemoryController.scala 165:29]
  assign _T_58 = _T_57 & bitmask; // @[ReadMemoryController.scala 165:36]
  assign _T_59 = request_R_address[2:0]; // @[ReadMemoryController.scala 165:71]
  assign _T_60 = {_T_59,3'h0}; // @[Cat.scala 29:58]
  assign _T_61 = _T_58 >> _T_60; // @[ReadMemoryController.scala 165:47]
  assign _GEN_20 = _T_56 ? _T_61 : 128'h0; // @[Conditional.scala 39:67]
  assign _GEN_31 = _T_52 ? 128'h0 : _GEN_20; // @[Conditional.scala 39:67]
  assign _GEN_42 = _T_50 ? 128'h0 : _GEN_31; // @[Conditional.scala 39:67]
  assign _GEN_53 = _T_48 ? 128'h0 : _GEN_42; // @[Conditional.scala 40:58]
  assign output_ = _GEN_53[63:0]; // @[ReadMemoryController.scala 165:14]
  assign _GEN_21 = _T_56 ? output_ : 64'h0; // @[Conditional.scala 39:67]
  assign _GEN_30 = _T_52 ? 1'h0 : _T_56; // @[Conditional.scala 39:67]
  assign _GEN_32 = _T_52 ? 64'h0 : _GEN_21; // @[Conditional.scala 39:67]
  assign _GEN_41 = _T_50 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  assign _GEN_43 = _T_50 ? 64'h0 : _GEN_32; // @[Conditional.scala 39:67]
  assign io_NodeReq_ready = state == 2'h0; // @[ReadMemoryController.scala 83:20]
  assign io_MemReq_valid = _T_48 ? 1'h0 : _T_50; // @[ReadMemoryController.scala 95:19 ReadMemoryController.scala 140:23]
  assign io_MemReq_bits_addr = ReqAddress + _GEN_57; // @[ReadMemoryController.scala 96:23]
  assign io_MemReq_bits_tag = {{7'd0}, ID}; // @[ReadMemoryController.scala 99:22]
  assign io_MemReq_bits_iswrite = isWrite; // @[ReadMemoryController.scala 101:26]
  assign io_output_valid = _T_48 ? 1'h0 : _GEN_41; // @[ReadMemoryController.scala 90:19 ReadMemoryController.scala 164:23]
  assign io_output_bits_RouteID = request_R_RouteID; // @[ReadMemoryController.scala 91:26]
  assign io_output_bits_data = _T_48 ? 64'h0 : _GEN_43; // @[ReadMemoryController.scala 93:23 ReadMemoryController.scala 166:27]
  assign io_free = state == 2'h0; // @[ReadMemoryController.scala 81:11]
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
  ID = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  request_R_RouteID = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  request_R_address = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {4{`RANDOM}};
  bitmask = _RAND_3[127:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  sendbytemask = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  ReqAddress = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ptr = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  linebuffer_0 = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  linebuffer_1 = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  state = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  isWrite = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      ID <= 1'h0;
    end else begin
      ID <= 1'h1;
    end
    if (reset) begin
      request_R_RouteID <= 16'h0;
    end else if (_T_9) begin
      request_R_RouteID <= io_NodeReq_bits_RouteID;
    end
    if (reset) begin
      request_R_address <= 64'h0;
    end else if (_T_9) begin
      request_R_address <= io_NodeReq_bits_address;
    end
    if (reset) begin
      bitmask <= 128'h0;
    end else if (_T_9) begin
      bitmask <= {{1'd0}, _T_30};
    end
    if (reset) begin
      sendbytemask <= 16'h0;
    end else if (_T_48) begin
      if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_50) begin
      if (io_MemReq_ready) begin
        sendbytemask <= {{8'd0}, _T_51};
      end else if (_T_9) begin
        sendbytemask <= {{1'd0}, _T_47};
      end
    end else if (_T_9) begin
      sendbytemask <= {{1'd0}, _T_47};
    end
    if (reset) begin
      ReqAddress <= 64'h0;
    end else if (_T_9) begin
      ReqAddress <= _T_11;
    end
    if (reset) begin
      ptr <= 1'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            ptr <= _T_54;
          end
        end else if (_T_56) begin
          ptr <= 1'h0;
        end
      end
    end
    if (reset) begin
      linebuffer_0 <= 64'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            if (1'h0 == ptr) begin
              linebuffer_0 <= io_MemResp_data;
            end
          end
        end
      end
    end
    if (reset) begin
      linebuffer_1 <= 64'h0;
    end else if (!(_T_48)) begin
      if (!(_T_50)) begin
        if (_T_52) begin
          if (io_MemResp_valid) begin
            if (ptr) begin
              linebuffer_1 <= io_MemResp_data;
            end
          end
        end
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_48) begin
      if (_T_9) begin
        state <= 2'h1;
      end
    end else if (_T_50) begin
      if (io_MemReq_ready) begin
        state <= 2'h2;
      end
    end else if (_T_52) begin
      if (io_MemResp_valid) begin
        if (_T_55) begin
          state <= 2'h3;
        end else begin
          state <= 2'h1;
        end
      end
    end else if (_T_56) begin
      if (io_output_ready) begin
        state <= 2'h0;
      end
    end
    isWrite <= reset;
  end
endmodule
module ReadMemoryController(
  input         clock,
  input         reset,
  output        io_ReadIn_0_ready,
  input         io_ReadIn_0_valid,
  input  [63:0] io_ReadIn_0_bits_address,
  output        io_ReadIn_1_ready,
  input         io_ReadIn_1_valid,
  input  [63:0] io_ReadIn_1_bits_address,
  output        io_ReadOut_0_valid,
  output [63:0] io_ReadOut_0_data,
  output        io_ReadOut_1_valid,
  output [63:0] io_ReadOut_1_data,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_bits_data,
  input  [7:0]  io_MemResp_bits_tag
);
  wire  in_arb_clock; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_in_0_ready; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_in_0_valid; // @[ReadMemoryController.scala 222:25]
  wire [63:0] in_arb_io_in_0_bits_address; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_in_1_ready; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_in_1_valid; // @[ReadMemoryController.scala 222:25]
  wire [63:0] in_arb_io_in_1_bits_address; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_out_ready; // @[ReadMemoryController.scala 222:25]
  wire  in_arb_io_out_valid; // @[ReadMemoryController.scala 222:25]
  wire [15:0] in_arb_io_out_bits_RouteID; // @[ReadMemoryController.scala 222:25]
  wire [63:0] in_arb_io_out_bits_address; // @[ReadMemoryController.scala 222:25]
  wire  alloc_arb_io_in_0_ready; // @[ReadMemoryController.scala 224:25]
  wire  alloc_arb_io_in_0_valid; // @[ReadMemoryController.scala 224:25]
  wire  alloc_arb_io_in_1_ready; // @[ReadMemoryController.scala 224:25]
  wire  alloc_arb_io_in_1_valid; // @[ReadMemoryController.scala 224:25]
  wire  alloc_arb_io_out_ready; // @[ReadMemoryController.scala 224:25]
  wire  alloc_arb_io_out_valid; // @[ReadMemoryController.scala 224:25]
  wire  cachereq_arb_io_in_0_ready; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_in_0_valid; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_in_0_bits_addr; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_in_0_bits_data; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_in_0_bits_mask; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_in_0_bits_tag; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_in_0_bits_iswrite; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_in_1_ready; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_in_1_valid; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_in_1_bits_addr; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_in_1_bits_data; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_in_1_bits_mask; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_in_1_bits_tag; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_in_1_bits_iswrite; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_out_ready; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_out_valid; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_out_bits_addr; // @[ReadMemoryController.scala 227:31]
  wire [63:0] cachereq_arb_io_out_bits_data; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_out_bits_mask; // @[ReadMemoryController.scala 227:31]
  wire [7:0] cachereq_arb_io_out_bits_tag; // @[ReadMemoryController.scala 227:31]
  wire  cachereq_arb_io_out_bits_iswrite; // @[ReadMemoryController.scala 227:31]
  wire  cacheresp_demux_io_en; // @[ReadMemoryController.scala 229:31]
  wire [63:0] cacheresp_demux_io_input_data; // @[ReadMemoryController.scala 229:31]
  wire [7:0] cacheresp_demux_io_input_tag; // @[ReadMemoryController.scala 229:31]
  wire  cacheresp_demux_io_sel; // @[ReadMemoryController.scala 229:31]
  wire  cacheresp_demux_io_outputs_0_valid; // @[ReadMemoryController.scala 229:31]
  wire [63:0] cacheresp_demux_io_outputs_0_data; // @[ReadMemoryController.scala 229:31]
  wire [7:0] cacheresp_demux_io_outputs_0_tag; // @[ReadMemoryController.scala 229:31]
  wire  cacheresp_demux_io_outputs_1_valid; // @[ReadMemoryController.scala 229:31]
  wire [63:0] cacheresp_demux_io_outputs_1_data; // @[ReadMemoryController.scala 229:31]
  wire [7:0] cacheresp_demux_io_outputs_1_tag; // @[ReadMemoryController.scala 229:31]
  wire  out_arb_clock; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_in_0_ready; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_in_0_valid; // @[ReadMemoryController.scala 232:25]
  wire [15:0] out_arb_io_in_0_bits_RouteID; // @[ReadMemoryController.scala 232:25]
  wire [63:0] out_arb_io_in_0_bits_data; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_in_1_ready; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_in_1_valid; // @[ReadMemoryController.scala 232:25]
  wire [15:0] out_arb_io_in_1_bits_RouteID; // @[ReadMemoryController.scala 232:25]
  wire [63:0] out_arb_io_in_1_bits_data; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_out_ready; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_out_valid; // @[ReadMemoryController.scala 232:25]
  wire [15:0] out_arb_io_out_bits_RouteID; // @[ReadMemoryController.scala 232:25]
  wire [63:0] out_arb_io_out_bits_data; // @[ReadMemoryController.scala 232:25]
  wire  out_arb_io_chosen; // @[ReadMemoryController.scala 232:25]
  wire  out_demux_io_outputs_0_valid; // @[ReadMemoryController.scala 233:25]
  wire [63:0] out_demux_io_outputs_0_data; // @[ReadMemoryController.scala 233:25]
  wire  out_demux_io_outputs_1_valid; // @[ReadMemoryController.scala 233:25]
  wire [63:0] out_demux_io_outputs_1_data; // @[ReadMemoryController.scala 233:25]
  wire [15:0] out_demux_io_input_RouteID; // @[ReadMemoryController.scala 233:25]
  wire [63:0] out_demux_io_input_data; // @[ReadMemoryController.scala 233:25]
  wire  out_demux_io_enable; // @[ReadMemoryController.scala 233:25]
  wire  ReadTable_0_clock; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_reset; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_NodeReq_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_NodeReq_valid; // @[ReadMemoryController.scala 252:28]
  wire [15:0] ReadTable_0_io_NodeReq_bits_RouteID; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_0_io_NodeReq_bits_address; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_MemReq_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_MemReq_valid; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_0_io_MemReq_bits_addr; // @[ReadMemoryController.scala 252:28]
  wire [7:0] ReadTable_0_io_MemReq_bits_tag; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_MemReq_bits_iswrite; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_MemResp_valid; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_0_io_MemResp_data; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_output_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_output_valid; // @[ReadMemoryController.scala 252:28]
  wire [15:0] ReadTable_0_io_output_bits_RouteID; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_0_io_output_bits_data; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_0_io_free; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_clock; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_reset; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_NodeReq_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_NodeReq_valid; // @[ReadMemoryController.scala 252:28]
  wire [15:0] ReadTable_1_io_NodeReq_bits_RouteID; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_1_io_NodeReq_bits_address; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_MemReq_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_MemReq_valid; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_1_io_MemReq_bits_addr; // @[ReadMemoryController.scala 252:28]
  wire [7:0] ReadTable_1_io_MemReq_bits_tag; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_MemReq_bits_iswrite; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_MemResp_valid; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_1_io_MemResp_data; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_output_ready; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_output_valid; // @[ReadMemoryController.scala 252:28]
  wire [15:0] ReadTable_1_io_output_bits_RouteID; // @[ReadMemoryController.scala 252:28]
  wire [63:0] ReadTable_1_io_output_bits_data; // @[ReadMemoryController.scala 252:28]
  wire  ReadTable_1_io_free; // @[ReadMemoryController.scala 252:28]
  ArbiterTree_1 in_arb ( // @[ReadMemoryController.scala 222:25]
    .clock(in_arb_clock),
    .io_in_0_ready(in_arb_io_in_0_ready),
    .io_in_0_valid(in_arb_io_in_0_valid),
    .io_in_0_bits_address(in_arb_io_in_0_bits_address),
    .io_in_1_ready(in_arb_io_in_1_ready),
    .io_in_1_valid(in_arb_io_in_1_valid),
    .io_in_1_bits_address(in_arb_io_in_1_bits_address),
    .io_out_ready(in_arb_io_out_ready),
    .io_out_valid(in_arb_io_out_valid),
    .io_out_bits_RouteID(in_arb_io_out_bits_RouteID),
    .io_out_bits_address(in_arb_io_out_bits_address)
  );
  Arbiter alloc_arb ( // @[ReadMemoryController.scala 224:25]
    .io_in_0_ready(alloc_arb_io_in_0_ready),
    .io_in_0_valid(alloc_arb_io_in_0_valid),
    .io_in_1_ready(alloc_arb_io_in_1_ready),
    .io_in_1_valid(alloc_arb_io_in_1_valid),
    .io_out_ready(alloc_arb_io_out_ready),
    .io_out_valid(alloc_arb_io_out_valid)
  );
  Arbiter_1 cachereq_arb ( // @[ReadMemoryController.scala 227:31]
    .io_in_0_ready(cachereq_arb_io_in_0_ready),
    .io_in_0_valid(cachereq_arb_io_in_0_valid),
    .io_in_0_bits_addr(cachereq_arb_io_in_0_bits_addr),
    .io_in_0_bits_data(cachereq_arb_io_in_0_bits_data),
    .io_in_0_bits_mask(cachereq_arb_io_in_0_bits_mask),
    .io_in_0_bits_tag(cachereq_arb_io_in_0_bits_tag),
    .io_in_0_bits_iswrite(cachereq_arb_io_in_0_bits_iswrite),
    .io_in_1_ready(cachereq_arb_io_in_1_ready),
    .io_in_1_valid(cachereq_arb_io_in_1_valid),
    .io_in_1_bits_addr(cachereq_arb_io_in_1_bits_addr),
    .io_in_1_bits_data(cachereq_arb_io_in_1_bits_data),
    .io_in_1_bits_mask(cachereq_arb_io_in_1_bits_mask),
    .io_in_1_bits_tag(cachereq_arb_io_in_1_bits_tag),
    .io_in_1_bits_iswrite(cachereq_arb_io_in_1_bits_iswrite),
    .io_out_ready(cachereq_arb_io_out_ready),
    .io_out_valid(cachereq_arb_io_out_valid),
    .io_out_bits_addr(cachereq_arb_io_out_bits_addr),
    .io_out_bits_data(cachereq_arb_io_out_bits_data),
    .io_out_bits_mask(cachereq_arb_io_out_bits_mask),
    .io_out_bits_tag(cachereq_arb_io_out_bits_tag),
    .io_out_bits_iswrite(cachereq_arb_io_out_bits_iswrite)
  );
  Demux cacheresp_demux ( // @[ReadMemoryController.scala 229:31]
    .io_en(cacheresp_demux_io_en),
    .io_input_data(cacheresp_demux_io_input_data),
    .io_input_tag(cacheresp_demux_io_input_tag),
    .io_sel(cacheresp_demux_io_sel),
    .io_outputs_0_valid(cacheresp_demux_io_outputs_0_valid),
    .io_outputs_0_data(cacheresp_demux_io_outputs_0_data),
    .io_outputs_0_tag(cacheresp_demux_io_outputs_0_tag),
    .io_outputs_1_valid(cacheresp_demux_io_outputs_1_valid),
    .io_outputs_1_data(cacheresp_demux_io_outputs_1_data),
    .io_outputs_1_tag(cacheresp_demux_io_outputs_1_tag)
  );
  RRArbiter_1 out_arb ( // @[ReadMemoryController.scala 232:25]
    .clock(out_arb_clock),
    .io_in_0_ready(out_arb_io_in_0_ready),
    .io_in_0_valid(out_arb_io_in_0_valid),
    .io_in_0_bits_RouteID(out_arb_io_in_0_bits_RouteID),
    .io_in_0_bits_data(out_arb_io_in_0_bits_data),
    .io_in_1_ready(out_arb_io_in_1_ready),
    .io_in_1_valid(out_arb_io_in_1_valid),
    .io_in_1_bits_RouteID(out_arb_io_in_1_bits_RouteID),
    .io_in_1_bits_data(out_arb_io_in_1_bits_data),
    .io_out_ready(out_arb_io_out_ready),
    .io_out_valid(out_arb_io_out_valid),
    .io_out_bits_RouteID(out_arb_io_out_bits_RouteID),
    .io_out_bits_data(out_arb_io_out_bits_data),
    .io_chosen(out_arb_io_chosen)
  );
  DeMuxTree_1 out_demux ( // @[ReadMemoryController.scala 233:25]
    .io_outputs_0_valid(out_demux_io_outputs_0_valid),
    .io_outputs_0_data(out_demux_io_outputs_0_data),
    .io_outputs_1_valid(out_demux_io_outputs_1_valid),
    .io_outputs_1_data(out_demux_io_outputs_1_data),
    .io_input_RouteID(out_demux_io_input_RouteID),
    .io_input_data(out_demux_io_input_data),
    .io_enable(out_demux_io_enable)
  );
  ReadTableEntry ReadTable_0 ( // @[ReadMemoryController.scala 252:28]
    .clock(ReadTable_0_clock),
    .reset(ReadTable_0_reset),
    .io_NodeReq_ready(ReadTable_0_io_NodeReq_ready),
    .io_NodeReq_valid(ReadTable_0_io_NodeReq_valid),
    .io_NodeReq_bits_RouteID(ReadTable_0_io_NodeReq_bits_RouteID),
    .io_NodeReq_bits_address(ReadTable_0_io_NodeReq_bits_address),
    .io_MemReq_ready(ReadTable_0_io_MemReq_ready),
    .io_MemReq_valid(ReadTable_0_io_MemReq_valid),
    .io_MemReq_bits_addr(ReadTable_0_io_MemReq_bits_addr),
    .io_MemReq_bits_tag(ReadTable_0_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(ReadTable_0_io_MemReq_bits_iswrite),
    .io_MemResp_valid(ReadTable_0_io_MemResp_valid),
    .io_MemResp_data(ReadTable_0_io_MemResp_data),
    .io_output_ready(ReadTable_0_io_output_ready),
    .io_output_valid(ReadTable_0_io_output_valid),
    .io_output_bits_RouteID(ReadTable_0_io_output_bits_RouteID),
    .io_output_bits_data(ReadTable_0_io_output_bits_data),
    .io_free(ReadTable_0_io_free)
  );
  ReadTableEntry_1 ReadTable_1 ( // @[ReadMemoryController.scala 252:28]
    .clock(ReadTable_1_clock),
    .reset(ReadTable_1_reset),
    .io_NodeReq_ready(ReadTable_1_io_NodeReq_ready),
    .io_NodeReq_valid(ReadTable_1_io_NodeReq_valid),
    .io_NodeReq_bits_RouteID(ReadTable_1_io_NodeReq_bits_RouteID),
    .io_NodeReq_bits_address(ReadTable_1_io_NodeReq_bits_address),
    .io_MemReq_ready(ReadTable_1_io_MemReq_ready),
    .io_MemReq_valid(ReadTable_1_io_MemReq_valid),
    .io_MemReq_bits_addr(ReadTable_1_io_MemReq_bits_addr),
    .io_MemReq_bits_tag(ReadTable_1_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(ReadTable_1_io_MemReq_bits_iswrite),
    .io_MemResp_valid(ReadTable_1_io_MemResp_valid),
    .io_MemResp_data(ReadTable_1_io_MemResp_data),
    .io_output_ready(ReadTable_1_io_output_ready),
    .io_output_valid(ReadTable_1_io_output_valid),
    .io_output_bits_RouteID(ReadTable_1_io_output_bits_RouteID),
    .io_output_bits_data(ReadTable_1_io_output_bits_data),
    .io_free(ReadTable_1_io_free)
  );
  assign io_ReadIn_0_ready = in_arb_io_in_0_ready; // @[ReadMemoryController.scala 241:21]
  assign io_ReadIn_1_ready = in_arb_io_in_1_ready; // @[ReadMemoryController.scala 241:21]
  assign io_ReadOut_0_valid = out_demux_io_outputs_0_valid; // @[ReadMemoryController.scala 242:19]
  assign io_ReadOut_0_data = out_demux_io_outputs_0_data; // @[ReadMemoryController.scala 242:19]
  assign io_ReadOut_1_valid = out_demux_io_outputs_1_valid; // @[ReadMemoryController.scala 242:19]
  assign io_ReadOut_1_data = out_demux_io_outputs_1_data; // @[ReadMemoryController.scala 242:19]
  assign io_MemReq_valid = cachereq_arb_io_out_valid; // @[ReadMemoryController.scala 289:13]
  assign io_MemReq_bits_addr = cachereq_arb_io_out_bits_addr; // @[ReadMemoryController.scala 289:13]
  assign io_MemReq_bits_data = cachereq_arb_io_out_bits_data; // @[ReadMemoryController.scala 289:13]
  assign io_MemReq_bits_mask = cachereq_arb_io_out_bits_mask; // @[ReadMemoryController.scala 289:13]
  assign io_MemReq_bits_tag = cachereq_arb_io_out_bits_tag; // @[ReadMemoryController.scala 289:13]
  assign io_MemReq_bits_iswrite = cachereq_arb_io_out_bits_iswrite; // @[ReadMemoryController.scala 289:13]
  assign in_arb_clock = clock;
  assign in_arb_io_in_0_valid = io_ReadIn_0_valid; // @[ReadMemoryController.scala 241:21]
  assign in_arb_io_in_0_bits_address = io_ReadIn_0_bits_address; // @[ReadMemoryController.scala 241:21]
  assign in_arb_io_in_1_valid = io_ReadIn_1_valid; // @[ReadMemoryController.scala 241:21]
  assign in_arb_io_in_1_bits_address = io_ReadIn_1_bits_address; // @[ReadMemoryController.scala 241:21]
  assign in_arb_io_out_ready = alloc_arb_io_out_valid; // @[ReadMemoryController.scala 284:23]
  assign alloc_arb_io_in_0_valid = ReadTable_0_io_free; // @[ReadMemoryController.scala 255:30]
  assign alloc_arb_io_in_1_valid = ReadTable_1_io_free; // @[ReadMemoryController.scala 255:30]
  assign alloc_arb_io_out_ready = in_arb_io_out_valid; // @[ReadMemoryController.scala 285:26]
  assign cachereq_arb_io_in_0_valid = ReadTable_0_io_MemReq_valid; // @[ReadMemoryController.scala 261:33]
  assign cachereq_arb_io_in_0_bits_addr = ReadTable_0_io_MemReq_bits_addr; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_0_bits_data = 64'h0; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_0_bits_mask = 8'h0; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_0_bits_tag = ReadTable_0_io_MemReq_bits_tag; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_0_bits_iswrite = ReadTable_0_io_MemReq_bits_iswrite; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_1_valid = ReadTable_1_io_MemReq_valid; // @[ReadMemoryController.scala 261:33]
  assign cachereq_arb_io_in_1_bits_addr = ReadTable_1_io_MemReq_bits_addr; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_1_bits_data = 64'h0; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_1_bits_mask = 8'h0; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_1_bits_tag = ReadTable_1_io_MemReq_bits_tag; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_in_1_bits_iswrite = ReadTable_1_io_MemReq_bits_iswrite; // @[ReadMemoryController.scala 262:32]
  assign cachereq_arb_io_out_ready = io_MemReq_ready; // @[ReadMemoryController.scala 289:13]
  assign cacheresp_demux_io_en = io_MemResp_valid; // @[ReadMemoryController.scala 292:25]
  assign cacheresp_demux_io_input_data = io_MemResp_bits_data; // @[ReadMemoryController.scala 293:28]
  assign cacheresp_demux_io_input_tag = io_MemResp_bits_tag; // @[ReadMemoryController.scala 293:28]
  assign cacheresp_demux_io_sel = io_MemResp_bits_tag[0]; // @[ReadMemoryController.scala 294:26]
  assign out_arb_clock = clock;
  assign out_arb_io_in_0_valid = ReadTable_0_io_output_valid; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_in_0_bits_RouteID = ReadTable_0_io_output_bits_RouteID; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_in_0_bits_data = ReadTable_0_io_output_bits_data; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_in_1_valid = ReadTable_1_io_output_valid; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_in_1_bits_RouteID = ReadTable_1_io_output_bits_RouteID; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_in_1_bits_data = ReadTable_1_io_output_bits_data; // @[ReadMemoryController.scala 269:22]
  assign out_arb_io_out_ready = 1'h1; // @[ReadMemoryController.scala 297:24]
  assign out_demux_io_input_RouteID = out_arb_io_out_bits_RouteID; // @[ReadMemoryController.scala 299:22]
  assign out_demux_io_input_data = out_arb_io_out_bits_data; // @[ReadMemoryController.scala 299:22]
  assign out_demux_io_enable = out_arb_io_out_ready & out_arb_io_out_valid; // @[ReadMemoryController.scala 298:23]
  assign ReadTable_0_clock = clock;
  assign ReadTable_0_reset = reset;
  assign ReadTable_0_io_NodeReq_valid = alloc_arb_io_in_0_ready & alloc_arb_io_in_0_valid; // @[ReadMemoryController.scala 257:33]
  assign ReadTable_0_io_NodeReq_bits_RouteID = in_arb_io_out_bits_RouteID; // @[ReadMemoryController.scala 258:32]
  assign ReadTable_0_io_NodeReq_bits_address = in_arb_io_out_bits_address; // @[ReadMemoryController.scala 258:32]
  assign ReadTable_0_io_MemReq_ready = cachereq_arb_io_in_0_ready; // @[ReadMemoryController.scala 263:32]
  assign ReadTable_0_io_MemResp_valid = cacheresp_demux_io_outputs_0_valid; // @[ReadMemoryController.scala 266:27]
  assign ReadTable_0_io_MemResp_data = cacheresp_demux_io_outputs_0_data; // @[ReadMemoryController.scala 266:27]
  assign ReadTable_0_io_output_ready = out_arb_io_in_0_ready; // @[ReadMemoryController.scala 269:22]
  assign ReadTable_1_clock = clock;
  assign ReadTable_1_reset = reset;
  assign ReadTable_1_io_NodeReq_valid = alloc_arb_io_in_1_ready & alloc_arb_io_in_1_valid; // @[ReadMemoryController.scala 257:33]
  assign ReadTable_1_io_NodeReq_bits_RouteID = in_arb_io_out_bits_RouteID; // @[ReadMemoryController.scala 258:32]
  assign ReadTable_1_io_NodeReq_bits_address = in_arb_io_out_bits_address; // @[ReadMemoryController.scala 258:32]
  assign ReadTable_1_io_MemReq_ready = cachereq_arb_io_in_1_ready; // @[ReadMemoryController.scala 263:32]
  assign ReadTable_1_io_MemResp_valid = cacheresp_demux_io_outputs_1_valid; // @[ReadMemoryController.scala 266:27]
  assign ReadTable_1_io_MemResp_data = cacheresp_demux_io_outputs_1_data; // @[ReadMemoryController.scala 266:27]
  assign ReadTable_1_io_output_ready = out_arb_io_in_1_ready; // @[ReadMemoryController.scala 269:22]
endmodule
module RRArbiter_2(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [63:0] io_in_0_bits_addr,
  input  [63:0] io_in_0_bits_data,
  input  [7:0]  io_in_0_bits_mask,
  input  [7:0]  io_in_0_bits_tag,
  input         io_in_0_bits_iswrite,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [63:0] io_in_1_bits_addr,
  input  [63:0] io_in_1_bits_data,
  input  [7:0]  io_in_1_bits_mask,
  input  [7:0]  io_in_1_bits_tag,
  input         io_in_1_bits_iswrite,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_addr,
  output [63:0] io_out_bits_data,
  output [7:0]  io_out_bits_mask,
  output [7:0]  io_out_bits_tag,
  output        io_out_bits_iswrite,
  output        io_chosen
);
  wire  _T; // @[Decoupled.scala 40:37]
  reg  _T_1; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire  _T_3; // @[Arbiter.scala 67:57]
  wire  _T_5; // @[Arbiter.scala 68:83]
  wire  _T_7; // @[Arbiter.scala 31:68]
  wire  _T_9; // @[Arbiter.scala 31:78]
  wire  _T_10; // @[Arbiter.scala 31:78]
  wire  _T_14; // @[Arbiter.scala 72:50]
  wire  _GEN_19; // @[Arbiter.scala 77:27]
  assign _T = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  assign _T_3 = 1'h1 > _T_1; // @[Arbiter.scala 67:57]
  assign _T_5 = io_in_1_valid & _T_3; // @[Arbiter.scala 68:83]
  assign _T_7 = _T_5 | io_in_0_valid; // @[Arbiter.scala 31:68]
  assign _T_9 = _T_5 == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_10 = _T_7 == 1'h0; // @[Arbiter.scala 31:78]
  assign _T_14 = _T_3 | _T_10; // @[Arbiter.scala 72:50]
  assign _GEN_19 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27]
  assign io_in_0_ready = _T_9 & io_out_ready; // @[Arbiter.scala 60:16]
  assign io_in_1_ready = _T_14 & io_out_ready; // @[Arbiter.scala 60:16]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16]
  assign io_out_bits_addr = io_chosen ? io_in_1_bits_addr : io_in_0_bits_addr; // @[Arbiter.scala 42:15]
  assign io_out_bits_data = io_chosen ? io_in_1_bits_data : io_in_0_bits_data; // @[Arbiter.scala 42:15]
  assign io_out_bits_mask = io_chosen ? io_in_1_bits_mask : io_in_0_bits_mask; // @[Arbiter.scala 42:15]
  assign io_out_bits_tag = io_chosen ? io_in_1_bits_tag : io_in_0_bits_tag; // @[Arbiter.scala 42:15]
  assign io_out_bits_iswrite = io_chosen ? io_in_1_bits_iswrite : io_in_0_bits_iswrite; // @[Arbiter.scala 42:15]
  assign io_chosen = _T_5 | _GEN_19; // @[Arbiter.scala 40:13]
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
  _T_1 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T) begin
      _T_1 <= io_chosen;
    end
  end
endmodule
module ReadWriteArbiter(
  input         clock,
  output        io_ReadMemReq_ready,
  input         io_ReadMemReq_valid,
  input  [63:0] io_ReadMemReq_bits_addr,
  input  [63:0] io_ReadMemReq_bits_data,
  input  [7:0]  io_ReadMemReq_bits_mask,
  input  [7:0]  io_ReadMemReq_bits_tag,
  input         io_ReadMemReq_bits_iswrite,
  output        io_WriteMemReq_ready,
  input         io_WriteMemReq_valid,
  input  [63:0] io_WriteMemReq_bits_addr,
  input  [63:0] io_WriteMemReq_bits_data,
  input  [7:0]  io_WriteMemReq_bits_mask,
  input  [7:0]  io_WriteMemReq_bits_tag,
  input         io_WriteMemReq_bits_iswrite,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_bits_data,
  input  [7:0]  io_MemResp_bits_tag,
  input         io_MemResp_bits_iswrite,
  output        io_ReadMemResp_valid,
  output [63:0] io_ReadMemResp_bits_data,
  output [7:0]  io_ReadMemResp_bits_tag,
  output        io_WriteMemResp_valid,
  output [63:0] io_WriteMemResp_bits_data,
  output [7:0]  io_WriteMemResp_bits_tag,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite
);
  wire  cachereq_arb_clock; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_0_ready; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_0_valid; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_in_0_bits_addr; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_in_0_bits_data; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_in_0_bits_mask; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_in_0_bits_tag; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_0_bits_iswrite; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_1_ready; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_1_valid; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_in_1_bits_addr; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_in_1_bits_data; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_in_1_bits_mask; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_in_1_bits_tag; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_in_1_bits_iswrite; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_out_ready; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_out_valid; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_out_bits_addr; // @[ReadWriteArbiter.scala 49:31]
  wire [63:0] cachereq_arb_io_out_bits_data; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_out_bits_mask; // @[ReadWriteArbiter.scala 49:31]
  wire [7:0] cachereq_arb_io_out_bits_tag; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_out_bits_iswrite; // @[ReadWriteArbiter.scala 49:31]
  wire  cachereq_arb_io_chosen; // @[ReadWriteArbiter.scala 49:31]
  wire  cacheresp_demux_io_en; // @[ReadWriteArbiter.scala 51:31]
  wire [63:0] cacheresp_demux_io_input_data; // @[ReadWriteArbiter.scala 51:31]
  wire [7:0] cacheresp_demux_io_input_tag; // @[ReadWriteArbiter.scala 51:31]
  wire  cacheresp_demux_io_sel; // @[ReadWriteArbiter.scala 51:31]
  wire  cacheresp_demux_io_outputs_0_valid; // @[ReadWriteArbiter.scala 51:31]
  wire [63:0] cacheresp_demux_io_outputs_0_data; // @[ReadWriteArbiter.scala 51:31]
  wire [7:0] cacheresp_demux_io_outputs_0_tag; // @[ReadWriteArbiter.scala 51:31]
  wire  cacheresp_demux_io_outputs_1_valid; // @[ReadWriteArbiter.scala 51:31]
  wire [63:0] cacheresp_demux_io_outputs_1_data; // @[ReadWriteArbiter.scala 51:31]
  wire [7:0] cacheresp_demux_io_outputs_1_tag; // @[ReadWriteArbiter.scala 51:31]
  RRArbiter_2 cachereq_arb ( // @[ReadWriteArbiter.scala 49:31]
    .clock(cachereq_arb_clock),
    .io_in_0_ready(cachereq_arb_io_in_0_ready),
    .io_in_0_valid(cachereq_arb_io_in_0_valid),
    .io_in_0_bits_addr(cachereq_arb_io_in_0_bits_addr),
    .io_in_0_bits_data(cachereq_arb_io_in_0_bits_data),
    .io_in_0_bits_mask(cachereq_arb_io_in_0_bits_mask),
    .io_in_0_bits_tag(cachereq_arb_io_in_0_bits_tag),
    .io_in_0_bits_iswrite(cachereq_arb_io_in_0_bits_iswrite),
    .io_in_1_ready(cachereq_arb_io_in_1_ready),
    .io_in_1_valid(cachereq_arb_io_in_1_valid),
    .io_in_1_bits_addr(cachereq_arb_io_in_1_bits_addr),
    .io_in_1_bits_data(cachereq_arb_io_in_1_bits_data),
    .io_in_1_bits_mask(cachereq_arb_io_in_1_bits_mask),
    .io_in_1_bits_tag(cachereq_arb_io_in_1_bits_tag),
    .io_in_1_bits_iswrite(cachereq_arb_io_in_1_bits_iswrite),
    .io_out_ready(cachereq_arb_io_out_ready),
    .io_out_valid(cachereq_arb_io_out_valid),
    .io_out_bits_addr(cachereq_arb_io_out_bits_addr),
    .io_out_bits_data(cachereq_arb_io_out_bits_data),
    .io_out_bits_mask(cachereq_arb_io_out_bits_mask),
    .io_out_bits_tag(cachereq_arb_io_out_bits_tag),
    .io_out_bits_iswrite(cachereq_arb_io_out_bits_iswrite),
    .io_chosen(cachereq_arb_io_chosen)
  );
  Demux cacheresp_demux ( // @[ReadWriteArbiter.scala 51:31]
    .io_en(cacheresp_demux_io_en),
    .io_input_data(cacheresp_demux_io_input_data),
    .io_input_tag(cacheresp_demux_io_input_tag),
    .io_sel(cacheresp_demux_io_sel),
    .io_outputs_0_valid(cacheresp_demux_io_outputs_0_valid),
    .io_outputs_0_data(cacheresp_demux_io_outputs_0_data),
    .io_outputs_0_tag(cacheresp_demux_io_outputs_0_tag),
    .io_outputs_1_valid(cacheresp_demux_io_outputs_1_valid),
    .io_outputs_1_data(cacheresp_demux_io_outputs_1_data),
    .io_outputs_1_tag(cacheresp_demux_io_outputs_1_tag)
  );
  assign io_ReadMemReq_ready = cachereq_arb_io_in_0_ready; // @[ReadWriteArbiter.scala 58:29]
  assign io_WriteMemReq_ready = cachereq_arb_io_in_1_ready; // @[ReadWriteArbiter.scala 59:29]
  assign io_ReadMemResp_valid = cacheresp_demux_io_outputs_0_valid; // @[ReadWriteArbiter.scala 70:24]
  assign io_ReadMemResp_bits_data = cacheresp_demux_io_outputs_0_data; // @[ReadWriteArbiter.scala 69:23]
  assign io_ReadMemResp_bits_tag = cacheresp_demux_io_outputs_0_tag; // @[ReadWriteArbiter.scala 69:23]
  assign io_WriteMemResp_valid = cacheresp_demux_io_outputs_1_valid; // @[ReadWriteArbiter.scala 72:25]
  assign io_WriteMemResp_bits_data = cacheresp_demux_io_outputs_1_data; // @[ReadWriteArbiter.scala 71:24]
  assign io_WriteMemResp_bits_tag = cacheresp_demux_io_outputs_1_tag; // @[ReadWriteArbiter.scala 71:24]
  assign io_MemReq_valid = cachereq_arb_io_out_valid; // @[ReadWriteArbiter.scala 63:19]
  assign io_MemReq_bits_addr = cachereq_arb_io_out_bits_addr; // @[ReadWriteArbiter.scala 62:18]
  assign io_MemReq_bits_data = cachereq_arb_io_out_bits_data; // @[ReadWriteArbiter.scala 62:18]
  assign io_MemReq_bits_mask = cachereq_arb_io_out_bits_mask; // @[ReadWriteArbiter.scala 62:18]
  assign io_MemReq_bits_tag = cachereq_arb_io_out_bits_tag; // @[ReadWriteArbiter.scala 62:18]
  assign io_MemReq_bits_iswrite = cachereq_arb_io_out_bits_iswrite; // @[ReadWriteArbiter.scala 62:18]
  assign cachereq_arb_clock = clock;
  assign cachereq_arb_io_in_0_valid = io_ReadMemReq_valid; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_0_bits_addr = io_ReadMemReq_bits_addr; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_0_bits_data = io_ReadMemReq_bits_data; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_0_bits_mask = io_ReadMemReq_bits_mask; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_0_bits_tag = io_ReadMemReq_bits_tag; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_0_bits_iswrite = io_ReadMemReq_bits_iswrite; // @[ReadWriteArbiter.scala 58:29]
  assign cachereq_arb_io_in_1_valid = io_WriteMemReq_valid; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_in_1_bits_addr = io_WriteMemReq_bits_addr; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_in_1_bits_data = io_WriteMemReq_bits_data; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_in_1_bits_mask = io_WriteMemReq_bits_mask; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_in_1_bits_tag = io_WriteMemReq_bits_tag; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_in_1_bits_iswrite = io_WriteMemReq_bits_iswrite; // @[ReadWriteArbiter.scala 59:29]
  assign cachereq_arb_io_out_ready = io_MemReq_ready; // @[ReadWriteArbiter.scala 61:29]
  assign cacheresp_demux_io_en = io_MemResp_valid; // @[ReadWriteArbiter.scala 77:25]
  assign cacheresp_demux_io_input_data = io_MemResp_bits_data; // @[ReadWriteArbiter.scala 78:28]
  assign cacheresp_demux_io_input_tag = io_MemResp_bits_tag; // @[ReadWriteArbiter.scala 78:28]
  assign cacheresp_demux_io_sel = io_MemResp_bits_iswrite; // @[ReadWriteArbiter.scala 81:26]
endmodule
module UnifiedController(
  input         clock,
  input         reset,
  output        io_WriteIn_0_ready,
  input         io_WriteIn_0_valid,
  input  [53:0] io_WriteIn_0_bits_address,
  input  [63:0] io_WriteIn_0_bits_data,
  output        io_WriteOut_0_valid,
  output        io_ReadIn_0_ready,
  input         io_ReadIn_0_valid,
  input  [63:0] io_ReadIn_0_bits_address,
  output        io_ReadIn_1_ready,
  input         io_ReadIn_1_valid,
  input  [63:0] io_ReadIn_1_bits_address,
  output        io_ReadOut_0_valid,
  output [63:0] io_ReadOut_0_data,
  output        io_ReadOut_1_valid,
  output [63:0] io_ReadOut_1_data,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_bits_data,
  input  [7:0]  io_MemResp_bits_tag,
  input         io_MemResp_bits_iswrite,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite
);
  wire  WriteController_clock; // @[UnifiedController.scala 54:32]
  wire  WriteController_reset; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_WriteIn_0_ready; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_WriteIn_0_valid; // @[UnifiedController.scala 54:32]
  wire [53:0] WriteController_io_WriteIn_0_bits_address; // @[UnifiedController.scala 54:32]
  wire [63:0] WriteController_io_WriteIn_0_bits_data; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_WriteOut_0_valid; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_MemReq_ready; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_MemReq_valid; // @[UnifiedController.scala 54:32]
  wire [63:0] WriteController_io_MemReq_bits_addr; // @[UnifiedController.scala 54:32]
  wire [63:0] WriteController_io_MemReq_bits_data; // @[UnifiedController.scala 54:32]
  wire [7:0] WriteController_io_MemReq_bits_mask; // @[UnifiedController.scala 54:32]
  wire [7:0] WriteController_io_MemReq_bits_tag; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_MemReq_bits_iswrite; // @[UnifiedController.scala 54:32]
  wire  WriteController_io_MemResp_valid; // @[UnifiedController.scala 54:32]
  wire [63:0] WriteController_io_MemResp_bits_data; // @[UnifiedController.scala 54:32]
  wire [7:0] WriteController_io_MemResp_bits_tag; // @[UnifiedController.scala 54:32]
  wire  ReadController_clock; // @[UnifiedController.scala 55:32]
  wire  ReadController_reset; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadIn_0_ready; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadIn_0_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_ReadIn_0_bits_address; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadIn_1_ready; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadIn_1_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_ReadIn_1_bits_address; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadOut_0_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_ReadOut_0_data; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_ReadOut_1_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_ReadOut_1_data; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_MemReq_ready; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_MemReq_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_MemReq_bits_addr; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_MemReq_bits_data; // @[UnifiedController.scala 55:32]
  wire [7:0] ReadController_io_MemReq_bits_mask; // @[UnifiedController.scala 55:32]
  wire [7:0] ReadController_io_MemReq_bits_tag; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_MemReq_bits_iswrite; // @[UnifiedController.scala 55:32]
  wire  ReadController_io_MemResp_valid; // @[UnifiedController.scala 55:32]
  wire [63:0] ReadController_io_MemResp_bits_data; // @[UnifiedController.scala 55:32]
  wire [7:0] ReadController_io_MemResp_bits_tag; // @[UnifiedController.scala 55:32]
  wire  ReadWriteArbiter_clock; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_ReadMemReq_ready; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_ReadMemReq_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_ReadMemReq_bits_addr; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_ReadMemReq_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_ReadMemReq_bits_mask; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_ReadMemReq_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_ReadMemReq_bits_iswrite; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_WriteMemReq_ready; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_WriteMemReq_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_WriteMemReq_bits_addr; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_WriteMemReq_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_WriteMemReq_bits_mask; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_WriteMemReq_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_WriteMemReq_bits_iswrite; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_MemResp_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_MemResp_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_MemResp_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_MemResp_bits_iswrite; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_ReadMemResp_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_ReadMemResp_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_ReadMemResp_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_WriteMemResp_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_WriteMemResp_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_WriteMemResp_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_MemReq_ready; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_MemReq_valid; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_MemReq_bits_addr; // @[UnifiedController.scala 56:32]
  wire [63:0] ReadWriteArbiter_io_MemReq_bits_data; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_MemReq_bits_mask; // @[UnifiedController.scala 56:32]
  wire [7:0] ReadWriteArbiter_io_MemReq_bits_tag; // @[UnifiedController.scala 56:32]
  wire  ReadWriteArbiter_io_MemReq_bits_iswrite; // @[UnifiedController.scala 56:32]
  wire  _T; // @[Decoupled.scala 40:37]
  wire  _T_1; // @[UnifiedController.scala 93:15]
  wire  _T_2; // @[UnifiedController.scala 93:15]
  wire  _GEN_0; // @[UnifiedController.scala 93:15]
  wire  _GEN_1; // @[UnifiedController.scala 95:15]
  wire  _GEN_2; // @[UnifiedController.scala 95:15]
  wire  _GEN_3; // @[UnifiedController.scala 101:15]
  wire  _GEN_4; // @[UnifiedController.scala 103:15]
  wire  _GEN_5; // @[UnifiedController.scala 103:15]
  WriteMemoryController WriteController ( // @[UnifiedController.scala 54:32]
    .clock(WriteController_clock),
    .reset(WriteController_reset),
    .io_WriteIn_0_ready(WriteController_io_WriteIn_0_ready),
    .io_WriteIn_0_valid(WriteController_io_WriteIn_0_valid),
    .io_WriteIn_0_bits_address(WriteController_io_WriteIn_0_bits_address),
    .io_WriteIn_0_bits_data(WriteController_io_WriteIn_0_bits_data),
    .io_WriteOut_0_valid(WriteController_io_WriteOut_0_valid),
    .io_MemReq_ready(WriteController_io_MemReq_ready),
    .io_MemReq_valid(WriteController_io_MemReq_valid),
    .io_MemReq_bits_addr(WriteController_io_MemReq_bits_addr),
    .io_MemReq_bits_data(WriteController_io_MemReq_bits_data),
    .io_MemReq_bits_mask(WriteController_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(WriteController_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(WriteController_io_MemReq_bits_iswrite),
    .io_MemResp_valid(WriteController_io_MemResp_valid),
    .io_MemResp_bits_data(WriteController_io_MemResp_bits_data),
    .io_MemResp_bits_tag(WriteController_io_MemResp_bits_tag)
  );
  ReadMemoryController ReadController ( // @[UnifiedController.scala 55:32]
    .clock(ReadController_clock),
    .reset(ReadController_reset),
    .io_ReadIn_0_ready(ReadController_io_ReadIn_0_ready),
    .io_ReadIn_0_valid(ReadController_io_ReadIn_0_valid),
    .io_ReadIn_0_bits_address(ReadController_io_ReadIn_0_bits_address),
    .io_ReadIn_1_ready(ReadController_io_ReadIn_1_ready),
    .io_ReadIn_1_valid(ReadController_io_ReadIn_1_valid),
    .io_ReadIn_1_bits_address(ReadController_io_ReadIn_1_bits_address),
    .io_ReadOut_0_valid(ReadController_io_ReadOut_0_valid),
    .io_ReadOut_0_data(ReadController_io_ReadOut_0_data),
    .io_ReadOut_1_valid(ReadController_io_ReadOut_1_valid),
    .io_ReadOut_1_data(ReadController_io_ReadOut_1_data),
    .io_MemReq_ready(ReadController_io_MemReq_ready),
    .io_MemReq_valid(ReadController_io_MemReq_valid),
    .io_MemReq_bits_addr(ReadController_io_MemReq_bits_addr),
    .io_MemReq_bits_data(ReadController_io_MemReq_bits_data),
    .io_MemReq_bits_mask(ReadController_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(ReadController_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(ReadController_io_MemReq_bits_iswrite),
    .io_MemResp_valid(ReadController_io_MemResp_valid),
    .io_MemResp_bits_data(ReadController_io_MemResp_bits_data),
    .io_MemResp_bits_tag(ReadController_io_MemResp_bits_tag)
  );
  ReadWriteArbiter ReadWriteArbiter ( // @[UnifiedController.scala 56:32]
    .clock(ReadWriteArbiter_clock),
    .io_ReadMemReq_ready(ReadWriteArbiter_io_ReadMemReq_ready),
    .io_ReadMemReq_valid(ReadWriteArbiter_io_ReadMemReq_valid),
    .io_ReadMemReq_bits_addr(ReadWriteArbiter_io_ReadMemReq_bits_addr),
    .io_ReadMemReq_bits_data(ReadWriteArbiter_io_ReadMemReq_bits_data),
    .io_ReadMemReq_bits_mask(ReadWriteArbiter_io_ReadMemReq_bits_mask),
    .io_ReadMemReq_bits_tag(ReadWriteArbiter_io_ReadMemReq_bits_tag),
    .io_ReadMemReq_bits_iswrite(ReadWriteArbiter_io_ReadMemReq_bits_iswrite),
    .io_WriteMemReq_ready(ReadWriteArbiter_io_WriteMemReq_ready),
    .io_WriteMemReq_valid(ReadWriteArbiter_io_WriteMemReq_valid),
    .io_WriteMemReq_bits_addr(ReadWriteArbiter_io_WriteMemReq_bits_addr),
    .io_WriteMemReq_bits_data(ReadWriteArbiter_io_WriteMemReq_bits_data),
    .io_WriteMemReq_bits_mask(ReadWriteArbiter_io_WriteMemReq_bits_mask),
    .io_WriteMemReq_bits_tag(ReadWriteArbiter_io_WriteMemReq_bits_tag),
    .io_WriteMemReq_bits_iswrite(ReadWriteArbiter_io_WriteMemReq_bits_iswrite),
    .io_MemResp_valid(ReadWriteArbiter_io_MemResp_valid),
    .io_MemResp_bits_data(ReadWriteArbiter_io_MemResp_bits_data),
    .io_MemResp_bits_tag(ReadWriteArbiter_io_MemResp_bits_tag),
    .io_MemResp_bits_iswrite(ReadWriteArbiter_io_MemResp_bits_iswrite),
    .io_ReadMemResp_valid(ReadWriteArbiter_io_ReadMemResp_valid),
    .io_ReadMemResp_bits_data(ReadWriteArbiter_io_ReadMemResp_bits_data),
    .io_ReadMemResp_bits_tag(ReadWriteArbiter_io_ReadMemResp_bits_tag),
    .io_WriteMemResp_valid(ReadWriteArbiter_io_WriteMemResp_valid),
    .io_WriteMemResp_bits_data(ReadWriteArbiter_io_WriteMemResp_bits_data),
    .io_WriteMemResp_bits_tag(ReadWriteArbiter_io_WriteMemResp_bits_tag),
    .io_MemReq_ready(ReadWriteArbiter_io_MemReq_ready),
    .io_MemReq_valid(ReadWriteArbiter_io_MemReq_valid),
    .io_MemReq_bits_addr(ReadWriteArbiter_io_MemReq_bits_addr),
    .io_MemReq_bits_data(ReadWriteArbiter_io_MemReq_bits_data),
    .io_MemReq_bits_mask(ReadWriteArbiter_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(ReadWriteArbiter_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(ReadWriteArbiter_io_MemReq_bits_iswrite)
  );
  assign _T = io_MemReq_ready & io_MemReq_valid; // @[Decoupled.scala 40:37]
  assign _T_1 = $unsigned(reset); // @[UnifiedController.scala 93:15]
  assign _T_2 = _T_1 == 1'h0; // @[UnifiedController.scala 93:15]
  assign io_WriteIn_0_ready = WriteController_io_WriteIn_0_ready; // @[UnifiedController.scala 64:35]
  assign io_WriteOut_0_valid = WriteController_io_WriteOut_0_valid; // @[UnifiedController.scala 65:20]
  assign io_ReadIn_0_ready = ReadController_io_ReadIn_0_ready; // @[UnifiedController.scala 70:33]
  assign io_ReadIn_1_ready = ReadController_io_ReadIn_1_ready; // @[UnifiedController.scala 70:33]
  assign io_ReadOut_0_valid = ReadController_io_ReadOut_0_valid; // @[UnifiedController.scala 71:19]
  assign io_ReadOut_0_data = ReadController_io_ReadOut_0_data; // @[UnifiedController.scala 71:19]
  assign io_ReadOut_1_valid = ReadController_io_ReadOut_1_valid; // @[UnifiedController.scala 71:19]
  assign io_ReadOut_1_data = ReadController_io_ReadOut_1_data; // @[UnifiedController.scala 71:19]
  assign io_MemReq_valid = ReadWriteArbiter_io_MemReq_valid; // @[UnifiedController.scala 84:19]
  assign io_MemReq_bits_addr = ReadWriteArbiter_io_MemReq_bits_addr; // @[UnifiedController.scala 83:18]
  assign io_MemReq_bits_data = ReadWriteArbiter_io_MemReq_bits_data; // @[UnifiedController.scala 83:18]
  assign io_MemReq_bits_mask = ReadWriteArbiter_io_MemReq_bits_mask; // @[UnifiedController.scala 83:18]
  assign io_MemReq_bits_tag = ReadWriteArbiter_io_MemReq_bits_tag; // @[UnifiedController.scala 83:18]
  assign io_MemReq_bits_iswrite = ReadWriteArbiter_io_MemReq_bits_iswrite; // @[UnifiedController.scala 83:18]
  assign WriteController_clock = clock;
  assign WriteController_reset = reset;
  assign WriteController_io_WriteIn_0_valid = io_WriteIn_0_valid; // @[UnifiedController.scala 64:35]
  assign WriteController_io_WriteIn_0_bits_address = io_WriteIn_0_bits_address; // @[UnifiedController.scala 64:35]
  assign WriteController_io_WriteIn_0_bits_data = io_WriteIn_0_bits_data; // @[UnifiedController.scala 64:35]
  assign WriteController_io_MemReq_ready = ReadWriteArbiter_io_WriteMemReq_ready; // @[UnifiedController.scala 78:35]
  assign WriteController_io_MemResp_valid = ReadWriteArbiter_io_WriteMemResp_valid; // @[UnifiedController.scala 79:30]
  assign WriteController_io_MemResp_bits_data = ReadWriteArbiter_io_WriteMemResp_bits_data; // @[UnifiedController.scala 79:30]
  assign WriteController_io_MemResp_bits_tag = ReadWriteArbiter_io_WriteMemResp_bits_tag; // @[UnifiedController.scala 79:30]
  assign ReadController_clock = clock;
  assign ReadController_reset = reset;
  assign ReadController_io_ReadIn_0_valid = io_ReadIn_0_valid; // @[UnifiedController.scala 70:33]
  assign ReadController_io_ReadIn_0_bits_address = io_ReadIn_0_bits_address; // @[UnifiedController.scala 70:33]
  assign ReadController_io_ReadIn_1_valid = io_ReadIn_1_valid; // @[UnifiedController.scala 70:33]
  assign ReadController_io_ReadIn_1_bits_address = io_ReadIn_1_bits_address; // @[UnifiedController.scala 70:33]
  assign ReadController_io_MemReq_ready = ReadWriteArbiter_io_ReadMemReq_ready; // @[UnifiedController.scala 75:34]
  assign ReadController_io_MemResp_valid = ReadWriteArbiter_io_ReadMemResp_valid; // @[UnifiedController.scala 76:29]
  assign ReadController_io_MemResp_bits_data = ReadWriteArbiter_io_ReadMemResp_bits_data; // @[UnifiedController.scala 76:29]
  assign ReadController_io_MemResp_bits_tag = ReadWriteArbiter_io_ReadMemResp_bits_tag; // @[UnifiedController.scala 76:29]
  assign ReadWriteArbiter_clock = clock;
  assign ReadWriteArbiter_io_ReadMemReq_valid = ReadController_io_MemReq_valid; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_ReadMemReq_bits_addr = ReadController_io_MemReq_bits_addr; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_ReadMemReq_bits_data = ReadController_io_MemReq_bits_data; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_ReadMemReq_bits_mask = ReadController_io_MemReq_bits_mask; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_ReadMemReq_bits_tag = ReadController_io_MemReq_bits_tag; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_ReadMemReq_bits_iswrite = ReadController_io_MemReq_bits_iswrite; // @[UnifiedController.scala 75:34]
  assign ReadWriteArbiter_io_WriteMemReq_valid = WriteController_io_MemReq_valid; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_WriteMemReq_bits_addr = WriteController_io_MemReq_bits_addr; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_WriteMemReq_bits_data = WriteController_io_MemReq_bits_data; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_WriteMemReq_bits_mask = WriteController_io_MemReq_bits_mask; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_WriteMemReq_bits_tag = WriteController_io_MemReq_bits_tag; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_WriteMemReq_bits_iswrite = WriteController_io_MemReq_bits_iswrite; // @[UnifiedController.scala 78:35]
  assign ReadWriteArbiter_io_MemResp_valid = io_MemResp_valid; // @[UnifiedController.scala 85:31]
  assign ReadWriteArbiter_io_MemResp_bits_data = io_MemResp_bits_data; // @[UnifiedController.scala 85:31]
  assign ReadWriteArbiter_io_MemResp_bits_tag = io_MemResp_bits_tag; // @[UnifiedController.scala 85:31]
  assign ReadWriteArbiter_io_MemResp_bits_iswrite = io_MemResp_bits_iswrite; // @[UnifiedController.scala 85:31]
  assign ReadWriteArbiter_io_MemReq_ready = io_MemReq_ready; // @[UnifiedController.scala 82:36]
  assign _GEN_0 = _T & io_MemReq_bits_iswrite; // @[UnifiedController.scala 93:15]
  assign _GEN_1 = io_MemReq_bits_iswrite == 1'h0; // @[UnifiedController.scala 95:15]
  assign _GEN_2 = _T & _GEN_1; // @[UnifiedController.scala 95:15]
  assign _GEN_3 = io_MemResp_valid & io_MemResp_bits_iswrite; // @[UnifiedController.scala 101:15]
  assign _GEN_4 = io_MemResp_bits_iswrite == 1'h0; // @[UnifiedController.scala 103:15]
  assign _GEN_5 = io_MemResp_valid & _GEN_4; // @[UnifiedController.scala 103:15]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_0 & _T_2) begin
          $fwrite(32'h80000002,"[LOG] [MemController] [MemReq]: Addr: %d, Data: %d, IsWrite: ST\n",io_MemReq_bits_addr,io_MemReq_bits_data); // @[UnifiedController.scala 93:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_2 & _T_2) begin
          $fwrite(32'h80000002,"[LOG] [MemController] [MemReq]: Addr: %d, Data: %d, IsWrite: LD\n",io_MemReq_bits_addr,io_MemReq_bits_data); // @[UnifiedController.scala 95:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_3 & _T_2) begin
          $fwrite(32'h80000002,"[LOG] [MemController] [MemResp]: Data: %d, IsWrite: ST\n",io_MemResp_bits_data); // @[UnifiedController.scala 101:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_5 & _T_2) begin
          $fwrite(32'h80000002,"[LOG] [MemController] [MemResp]: Data: %d, IsWrite: LD\n",io_MemReq_bits_data); // @[UnifiedController.scala 103:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module SplitCallNew(
  input         clock,
  input         reset,
  output        io_In_ready,
  input         io_In_valid,
  input  [31:0] io_In_bits_data_field0_data,
  input         io_Out_enable_ready,
  output        io_Out_enable_valid,
  output        io_Out_enable_bits_control,
  input         io_Out_data_field0_0_ready,
  output        io_Out_data_field0_0_valid,
  output [63:0] io_Out_data_field0_0_bits_data,
  input         io_Out_data_field0_1_ready,
  output        io_Out_data_field0_1_valid,
  output [63:0] io_Out_data_field0_1_bits_data
);
  reg  inputReg_enable_control; // @[SplitDecoupled.scala 152:26]
  reg [31:0] _RAND_0;
  reg [31:0] inputReg_data_field0_data; // @[SplitDecoupled.scala 152:26]
  reg [31:0] _RAND_1;
  reg  enableValidReg; // @[SplitDecoupled.scala 154:31]
  reg [31:0] _RAND_2;
  reg  outputValidReg_0_0; // @[SplitDecoupled.scala 157:49]
  reg [31:0] _RAND_3;
  reg  outputValidReg_0_1; // @[SplitDecoupled.scala 157:49]
  reg [31:0] _RAND_4;
  wire  allValid_0; // @[SplitDecoupled.scala 161:51]
  reg  state; // @[SplitDecoupled.scala 166:22]
  reg [31:0] _RAND_5;
  wire  _T_1; // @[SplitDecoupled.scala 168:24]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire  _T_3; // @[Decoupled.scala 40:37]
  wire  _GEN_0; // @[SplitDecoupled.scala 172:27]
  wire  _GEN_2; // @[SplitDecoupled.scala 172:27]
  wire  _T_5; // @[SplitDecoupled.scala 178:13]
  wire  _T_6; // @[SplitDecoupled.scala 178:45]
  wire  _T_7; // @[SplitDecoupled.scala 178:42]
  wire  _T_9; // @[SplitDecoupled.scala 186:24]
  wire  _GEN_14; // @[SplitDecoupled.scala 186:45]
  wire  _T_11; // @[SplitDecoupled.scala 189:32]
  wire  _GEN_16; // @[SplitDecoupled.scala 186:45]
  wire  _T_15; // @[SplitDecoupled.scala 189:32]
  wire  _GEN_18; // @[SplitDecoupled.scala 197:41]
  wire  _T_19; // @[SplitDecoupled.scala 200:28]
  assign allValid_0 = outputValidReg_0_0 | outputValidReg_0_1; // @[SplitDecoupled.scala 161:51]
  assign _T_1 = state == 1'h0; // @[SplitDecoupled.scala 168:24]
  assign _T_2 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_3 = io_In_ready & io_In_valid; // @[Decoupled.scala 40:37]
  assign _GEN_0 = _T_3 | state; // @[SplitDecoupled.scala 172:27]
  assign _GEN_2 = _T_3 | inputReg_enable_control; // @[SplitDecoupled.scala 172:27]
  assign _T_5 = allValid_0 == 1'h0; // @[SplitDecoupled.scala 178:13]
  assign _T_6 = enableValidReg == 1'h0; // @[SplitDecoupled.scala 178:45]
  assign _T_7 = _T_5 & _T_6; // @[SplitDecoupled.scala 178:42]
  assign _T_9 = io_In_valid & _T_1; // @[SplitDecoupled.scala 186:24]
  assign _GEN_14 = _T_9 | outputValidReg_0_0; // @[SplitDecoupled.scala 186:45]
  assign _T_11 = state & io_Out_data_field0_0_ready; // @[SplitDecoupled.scala 189:32]
  assign _GEN_16 = _T_9 | outputValidReg_0_1; // @[SplitDecoupled.scala 186:45]
  assign _T_15 = state & io_Out_data_field0_1_ready; // @[SplitDecoupled.scala 189:32]
  assign _GEN_18 = _T_9 | enableValidReg; // @[SplitDecoupled.scala 197:41]
  assign _T_19 = state & io_Out_enable_ready; // @[SplitDecoupled.scala 200:28]
  assign io_In_ready = state == 1'h0; // @[SplitDecoupled.scala 168:15]
  assign io_Out_enable_valid = enableValidReg; // @[SplitDecoupled.scala 203:23]
  assign io_Out_enable_bits_control = inputReg_enable_control; // @[SplitDecoupled.scala 204:22]
  assign io_Out_data_field0_0_valid = outputValidReg_0_0; // @[SplitDecoupled.scala 192:40]
  assign io_Out_data_field0_0_bits_data = {{32'd0}, inputReg_data_field0_data}; // @[SplitDecoupled.scala 193:39]
  assign io_Out_data_field0_1_valid = outputValidReg_0_1; // @[SplitDecoupled.scala 192:40]
  assign io_Out_data_field0_1_bits_data = {{32'd0}, inputReg_data_field0_data}; // @[SplitDecoupled.scala 193:39]
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
  inputReg_data_field0_data = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enableValidReg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  outputValidReg_0_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  outputValidReg_0_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[0:0];
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
      inputReg_data_field0_data <= 32'h0;
    end else if (_T_2) begin
      if (_T_3) begin
        inputReg_data_field0_data <= io_In_bits_data_field0_data;
      end
    end
    if (reset) begin
      enableValidReg <= 1'h0;
    end else if (_T_19) begin
      enableValidReg <= 1'h0;
    end else begin
      enableValidReg <= _GEN_18;
    end
    if (reset) begin
      outputValidReg_0_0 <= 1'h0;
    end else if (_T_11) begin
      outputValidReg_0_0 <= 1'h0;
    end else begin
      outputValidReg_0_0 <= _GEN_14;
    end
    if (reset) begin
      outputValidReg_0_1 <= 1'h0;
    end else if (_T_15) begin
      outputValidReg_0_1 <= 1'h0;
    end else begin
      outputValidReg_0_1 <= _GEN_16;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_2) begin
      state <= _GEN_0;
    end else if (state) begin
      if (_T_7) begin
        state <= 1'h0;
      end
    end
  end
endmodule
module LoopBlockNode(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input         io_enable_bits_control,
  output        io_InLiveIn_0_ready,
  input         io_InLiveIn_0_valid,
  input  [63:0] io_InLiveIn_0_bits_data,
  input         io_OutLiveIn_field0_0_ready,
  output        io_OutLiveIn_field0_0_valid,
  output [63:0] io_OutLiveIn_field0_0_bits_data,
  input         io_activate_loop_start_ready,
  output        io_activate_loop_start_valid,
  output [4:0]  io_activate_loop_start_bits_taskID,
  output        io_activate_loop_start_bits_control,
  input         io_activate_loop_back_ready,
  output        io_activate_loop_back_valid,
  output [4:0]  io_activate_loop_back_bits_taskID,
  output        io_activate_loop_back_bits_control,
  output        io_loopBack_0_ready,
  input         io_loopBack_0_valid,
  input  [4:0]  io_loopBack_0_bits_taskID,
  input         io_loopBack_0_bits_control,
  output        io_loopFinish_0_ready,
  input         io_loopFinish_0_valid,
  input         io_loopFinish_0_bits_control,
  output        io_CarryDepenIn_0_ready,
  input         io_CarryDepenIn_0_valid,
  input  [4:0]  io_CarryDepenIn_0_bits_taskID,
  input  [63:0] io_CarryDepenIn_0_bits_data,
  input         io_CarryDepenOut_field0_0_ready,
  output        io_CarryDepenOut_field0_0_valid,
  output [4:0]  io_CarryDepenOut_field0_0_bits_taskID,
  output [63:0] io_CarryDepenOut_field0_0_bits_data,
  input         io_loopExit_0_ready,
  output        io_loopExit_0_valid,
  output [4:0]  io_loopExit_0_bits_taskID,
  output        io_loopExit_0_bits_control
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg  enable_R_control; // @[LoopBlock.scala 531:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[LoopBlock.scala 532:31]
  reg [31:0] _RAND_2;
  reg [4:0] loop_back_R_0_taskID; // @[LoopBlock.scala 534:50]
  reg [31:0] _RAND_3;
  reg  loop_back_R_0_control; // @[LoopBlock.scala 534:50]
  reg [31:0] _RAND_4;
  reg  loop_back_valid_R_0; // @[LoopBlock.scala 535:56]
  reg [31:0] _RAND_5;
  reg  loop_finish_R_0_control; // @[LoopBlock.scala 537:54]
  reg [31:0] _RAND_6;
  reg  loop_finish_valid_R_0; // @[LoopBlock.scala 538:60]
  reg [31:0] _RAND_7;
  reg [63:0] in_live_in_R_0_data; // @[LoopBlock.scala 540:53]
  reg [63:0] _RAND_8;
  reg  in_live_in_valid_R_0; // @[LoopBlock.scala 541:59]
  reg [31:0] _RAND_9;
  reg [4:0] in_carry_in_R_0_taskID; // @[LoopBlock.scala 543:56]
  reg [31:0] _RAND_10;
  reg [63:0] in_carry_in_R_0_data; // @[LoopBlock.scala 543:56]
  reg [63:0] _RAND_11;
  reg  in_carry_in_valid_R_0; // @[LoopBlock.scala 544:62]
  reg [31:0] _RAND_12;
  reg  out_live_in_valid_R_0_0; // @[LoopBlock.scala 556:47]
  reg [31:0] _RAND_13;
  reg  out_live_in_fire_R_0_0; // @[LoopBlock.scala 560:47]
  reg [31:0] _RAND_14;
  reg  out_carry_out_valid_R_0_0; // @[LoopBlock.scala 576:44]
  reg [31:0] _RAND_15;
  reg [4:0] active_loop_start_R_taskID; // @[LoopBlock.scala 584:36]
  reg [31:0] _RAND_16;
  reg  active_loop_start_R_control; // @[LoopBlock.scala 584:36]
  reg [31:0] _RAND_17;
  reg  active_loop_start_valid_R; // @[LoopBlock.scala 585:42]
  reg [31:0] _RAND_18;
  reg [4:0] active_loop_back_R_taskID; // @[LoopBlock.scala 587:35]
  reg [31:0] _RAND_19;
  reg  active_loop_back_R_control; // @[LoopBlock.scala 587:35]
  reg [31:0] _RAND_20;
  reg  active_loop_back_valid_R; // @[LoopBlock.scala 588:41]
  reg [31:0] _RAND_21;
  reg [4:0] loop_exit_R_0_taskID; // @[LoopBlock.scala 590:47]
  reg [31:0] _RAND_22;
  reg  loop_exit_R_0_control; // @[LoopBlock.scala 590:47]
  reg [31:0] _RAND_23;
  reg  loop_exit_valid_R_0; // @[LoopBlock.scala 591:53]
  reg [31:0] _RAND_24;
  reg  loop_exit_fire_R_0; // @[LoopBlock.scala 592:52]
  reg [31:0] _RAND_25;
  wire  _T_13; // @[Decoupled.scala 40:37]
  wire  _GEN_3; // @[LoopBlock.scala 599:26]
  wire  _T_15; // @[Decoupled.scala 40:37]
  wire [4:0] _GEN_4; // @[LoopBlock.scala 606:33]
  wire  _GEN_5; // @[LoopBlock.scala 606:33]
  wire  _GEN_6; // @[LoopBlock.scala 606:33]
  wire  _T_17; // @[Decoupled.scala 40:37]
  wire  _GEN_8; // @[LoopBlock.scala 615:35]
  wire  _GEN_9; // @[LoopBlock.scala 615:35]
  wire  _T_19; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[LoopBlock.scala 626:33]
  wire  _T_21; // @[Decoupled.scala 40:37]
  wire  _GEN_17; // @[LoopBlock.scala 644:37]
  wire  _T_22; // @[Decoupled.scala 40:37]
  wire  _GEN_18; // @[LoopBlock.scala 707:39]
  wire  _T_23; // @[Decoupled.scala 40:37]
  wire  _GEN_19; // @[LoopBlock.scala 711:38]
  wire  _T_24; // @[Decoupled.scala 40:37]
  wire  _GEN_20; // @[LoopBlock.scala 716:33]
  wire  _GEN_21; // @[LoopBlock.scala 716:33]
  wire  _T_25; // @[Decoupled.scala 40:37]
  wire  _GEN_22; // @[LoopBlock.scala 725:57]
  wire  _GEN_23; // @[LoopBlock.scala 725:57]
  wire  _T_26; // @[Decoupled.scala 40:37]
  wire  _GEN_24; // @[LoopBlock.scala 745:61]
  reg [1:0] state; // @[LoopBlock.scala 864:22]
  reg [31:0] _RAND_26;
  wire  _T_27; // @[Conditional.scala 37:30]
  wire  _T_28; // @[LoopBlock.scala 872:28]
  wire  _GEN_26; // @[LoopBlock.scala 873:26]
  wire  _GEN_27; // @[LoopBlock.scala 873:26]
  wire  _GEN_28; // @[LoopBlock.scala 873:26]
  wire  _GEN_30; // @[LoopBlock.scala 873:26]
  wire  _GEN_33; // @[LoopBlock.scala 873:26]
  wire  _GEN_35; // @[LoopBlock.scala 873:26]
  wire  _T_32; // @[Conditional.scala 37:30]
  wire  _T_33; // @[LoopBlock.scala 901:30]
  wire  _T_35; // @[LoopBlock.scala 902:29]
  wire  _T_42; // @[LoopBlock.scala 935:19]
  wire  _T_43; // @[LoopBlock.scala 935:19]
  wire  _GEN_50; // @[LoopBlock.scala 939:64]
  wire  _GEN_53; // @[LoopBlock.scala 939:64]
  wire  _GEN_55; // @[LoopBlock.scala 939:64]
  wire  _GEN_60; // @[LoopBlock.scala 906:56]
  wire  _GEN_61; // @[LoopBlock.scala 906:56]
  wire  _GEN_63; // @[LoopBlock.scala 906:56]
  wire  _GEN_66; // @[LoopBlock.scala 906:56]
  wire  _GEN_67; // @[LoopBlock.scala 906:56]
  wire  _T_51; // @[Conditional.scala 37:30]
  wire  _GEN_186; // @[LoopBlock.scala 935:19]
  wire  _GEN_187; // @[LoopBlock.scala 935:19]
  wire  _GEN_188; // @[LoopBlock.scala 935:19]
  wire  _GEN_189; // @[LoopBlock.scala 935:19]
  wire  _GEN_193; // @[LoopBlock.scala 953:19]
  wire  _GEN_194; // @[LoopBlock.scala 953:19]
  wire  _GEN_195; // @[LoopBlock.scala 953:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_13 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _GEN_3 = _T_13 | enable_valid_R; // @[LoopBlock.scala 599:26]
  assign _T_15 = io_loopBack_0_ready & io_loopBack_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_4 = _T_15 ? io_loopBack_0_bits_taskID : loop_back_R_0_taskID; // @[LoopBlock.scala 606:33]
  assign _GEN_5 = _T_15 ? io_loopBack_0_bits_control : loop_back_R_0_control; // @[LoopBlock.scala 606:33]
  assign _GEN_6 = _T_15 | loop_back_valid_R_0; // @[LoopBlock.scala 606:33]
  assign _T_17 = io_loopFinish_0_ready & io_loopFinish_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_8 = _T_17 ? io_loopFinish_0_bits_control : loop_finish_R_0_control; // @[LoopBlock.scala 615:35]
  assign _GEN_9 = _T_17 | loop_finish_valid_R_0; // @[LoopBlock.scala 615:35]
  assign _T_19 = io_InLiveIn_0_ready & io_InLiveIn_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_19 | in_live_in_valid_R_0; // @[LoopBlock.scala 626:33]
  assign _T_21 = io_CarryDepenIn_0_ready & io_CarryDepenIn_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_17 = _T_21 | in_carry_in_valid_R_0; // @[LoopBlock.scala 644:37]
  assign _T_22 = io_activate_loop_start_ready & io_activate_loop_start_valid; // @[Decoupled.scala 40:37]
  assign _GEN_18 = _T_22 ? 1'h0 : active_loop_start_valid_R; // @[LoopBlock.scala 707:39]
  assign _T_23 = io_activate_loop_back_ready & io_activate_loop_back_valid; // @[Decoupled.scala 40:37]
  assign _GEN_19 = _T_23 ? 1'h0 : active_loop_back_valid_R; // @[LoopBlock.scala 711:38]
  assign _T_24 = io_loopExit_0_ready & io_loopExit_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_20 = _T_24 ? 1'h0 : loop_exit_valid_R_0; // @[LoopBlock.scala 716:33]
  assign _GEN_21 = _T_24 | loop_exit_fire_R_0; // @[LoopBlock.scala 716:33]
  assign _T_25 = io_OutLiveIn_field0_0_ready & io_OutLiveIn_field0_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_22 = _T_25 ? 1'h0 : out_live_in_valid_R_0_0; // @[LoopBlock.scala 725:57]
  assign _GEN_23 = _T_25 | out_live_in_fire_R_0_0; // @[LoopBlock.scala 725:57]
  assign _T_26 = io_CarryDepenOut_field0_0_ready & io_CarryDepenOut_field0_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_24 = _T_26 ? 1'h0 : out_carry_out_valid_R_0_0; // @[LoopBlock.scala 745:61]
  assign _T_27 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_28 = in_live_in_valid_R_0 & enable_valid_R; // @[LoopBlock.scala 872:28]
  assign _GEN_26 = enable_R_control | _GEN_22; // @[LoopBlock.scala 873:26]
  assign _GEN_27 = enable_R_control | _GEN_24; // @[LoopBlock.scala 873:26]
  assign _GEN_28 = enable_R_control | active_loop_start_R_control; // @[LoopBlock.scala 873:26]
  assign _GEN_30 = enable_R_control | _GEN_18; // @[LoopBlock.scala 873:26]
  assign _GEN_33 = enable_R_control | _GEN_19; // @[LoopBlock.scala 873:26]
  assign _GEN_35 = enable_R_control & loop_exit_R_0_control; // @[LoopBlock.scala 873:26]
  assign _T_32 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_33 = loop_back_valid_R_0 & loop_finish_valid_R_0; // @[LoopBlock.scala 901:30]
  assign _T_35 = _T_33 & out_live_in_fire_R_0_0; // @[LoopBlock.scala 902:29]
  assign _T_42 = $unsigned(reset); // @[LoopBlock.scala 935:19]
  assign _T_43 = _T_42 == 1'h0; // @[LoopBlock.scala 935:19]
  assign _GEN_50 = loop_finish_R_0_control | _GEN_20; // @[LoopBlock.scala 939:64]
  assign _GEN_53 = loop_finish_R_0_control ? 1'h0 : active_loop_back_R_control; // @[LoopBlock.scala 939:64]
  assign _GEN_55 = loop_finish_R_0_control | loop_exit_R_0_control; // @[LoopBlock.scala 939:64]
  assign _GEN_60 = loop_back_R_0_control | _GEN_18; // @[LoopBlock.scala 906:56]
  assign _GEN_61 = loop_back_R_0_control | _GEN_53; // @[LoopBlock.scala 906:56]
  assign _GEN_63 = loop_back_R_0_control | _GEN_19; // @[LoopBlock.scala 906:56]
  assign _GEN_66 = loop_back_R_0_control | _GEN_22; // @[LoopBlock.scala 906:56]
  assign _GEN_67 = loop_back_R_0_control | _GEN_24; // @[LoopBlock.scala 906:56]
  assign _T_51 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign io_enable_ready = ~ enable_valid_R; // @[LoopBlock.scala 598:19]
  assign io_InLiveIn_0_ready = ~ in_live_in_valid_R_0; // @[LoopBlock.scala 625:26]
  assign io_OutLiveIn_field0_0_valid = out_live_in_valid_R_0_0; // @[LoopBlock.scala 668:50]
  assign io_OutLiveIn_field0_0_bits_data = in_live_in_R_0_data; // @[LoopBlock.scala 667:49]
  assign io_activate_loop_start_valid = active_loop_start_valid_R; // @[LoopBlock.scala 692:32]
  assign io_activate_loop_start_bits_taskID = active_loop_start_R_taskID; // @[LoopBlock.scala 691:31]
  assign io_activate_loop_start_bits_control = active_loop_start_R_control; // @[LoopBlock.scala 691:31]
  assign io_activate_loop_back_valid = active_loop_back_valid_R; // @[LoopBlock.scala 695:31]
  assign io_activate_loop_back_bits_taskID = active_loop_back_R_taskID; // @[LoopBlock.scala 694:30]
  assign io_activate_loop_back_bits_control = active_loop_back_R_control; // @[LoopBlock.scala 694:30]
  assign io_loopBack_0_ready = ~ loop_back_valid_R_0; // @[LoopBlock.scala 605:26]
  assign io_loopFinish_0_ready = ~ loop_finish_valid_R_0; // @[LoopBlock.scala 614:28]
  assign io_CarryDepenIn_0_ready = ~ in_carry_in_valid_R_0; // @[LoopBlock.scala 643:30]
  assign io_CarryDepenOut_field0_0_valid = out_carry_out_valid_R_0_0; // @[LoopBlock.scala 684:54]
  assign io_CarryDepenOut_field0_0_bits_taskID = in_carry_in_R_0_taskID; // @[LoopBlock.scala 683:53]
  assign io_CarryDepenOut_field0_0_bits_data = in_carry_in_R_0_data; // @[LoopBlock.scala 683:53]
  assign io_loopExit_0_valid = loop_exit_valid_R_0; // @[LoopBlock.scala 699:26]
  assign io_loopExit_0_bits_taskID = loop_exit_R_0_taskID; // @[LoopBlock.scala 698:25]
  assign io_loopExit_0_bits_control = loop_exit_R_0_control; // @[LoopBlock.scala 698:25]
  assign _GEN_186 = _T_27 == 1'h0; // @[LoopBlock.scala 935:19]
  assign _GEN_187 = _GEN_186 & _T_32; // @[LoopBlock.scala 935:19]
  assign _GEN_188 = _GEN_187 & _T_35; // @[LoopBlock.scala 935:19]
  assign _GEN_189 = _GEN_188 & loop_back_R_0_control; // @[LoopBlock.scala 935:19]
  assign _GEN_193 = loop_back_R_0_control == 1'h0; // @[LoopBlock.scala 953:19]
  assign _GEN_194 = _GEN_188 & _GEN_193; // @[LoopBlock.scala 953:19]
  assign _GEN_195 = _GEN_194 & loop_finish_R_0_control; // @[LoopBlock.scala 953:19]
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
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  loop_back_R_0_taskID = _RAND_3[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  loop_back_R_0_control = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  loop_back_valid_R_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  loop_finish_R_0_control = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  loop_finish_valid_R_0 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  in_live_in_R_0_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  in_live_in_valid_R_0 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  in_carry_in_R_0_taskID = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  in_carry_in_R_0_data = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  in_carry_in_valid_R_0 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  out_live_in_valid_R_0_0 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  out_live_in_fire_R_0_0 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  out_carry_out_valid_R_0_0 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  active_loop_start_R_taskID = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  active_loop_start_R_control = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  active_loop_start_valid_R = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  active_loop_back_R_taskID = _RAND_19[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  active_loop_back_R_control = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  active_loop_back_valid_R = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  loop_exit_R_0_taskID = _RAND_22[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  loop_exit_R_0_control = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  loop_exit_valid_R_0 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  loop_exit_fire_R_0 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  state = _RAND_26[1:0];
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
      enable_R_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_13) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_32) begin
      if (_T_13) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        enable_R_control <= 1'h0;
      end else if (_T_13) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_13) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_27) begin
      enable_valid_R <= _GEN_3;
    end else if (_T_32) begin
      enable_valid_R <= _GEN_3;
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        enable_valid_R <= 1'h0;
      end else begin
        enable_valid_R <= _GEN_3;
      end
    end else begin
      enable_valid_R <= _GEN_3;
    end
    if (reset) begin
      loop_back_R_0_taskID <= 5'h0;
    end else if (_T_27) begin
      if (_T_15) begin
        loop_back_R_0_taskID <= io_loopBack_0_bits_taskID;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          loop_back_R_0_taskID <= 5'h0;
        end else if (_T_15) begin
          loop_back_R_0_taskID <= io_loopBack_0_bits_taskID;
        end
      end else if (_T_15) begin
        loop_back_R_0_taskID <= io_loopBack_0_bits_taskID;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        loop_back_R_0_taskID <= 5'h0;
      end else if (_T_15) begin
        loop_back_R_0_taskID <= io_loopBack_0_bits_taskID;
      end
    end else begin
      loop_back_R_0_taskID <= _GEN_4;
    end
    if (reset) begin
      loop_back_R_0_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_15) begin
        loop_back_R_0_control <= io_loopBack_0_bits_control;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          loop_back_R_0_control <= 1'h0;
        end else if (_T_15) begin
          loop_back_R_0_control <= io_loopBack_0_bits_control;
        end
      end else if (_T_15) begin
        loop_back_R_0_control <= io_loopBack_0_bits_control;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        loop_back_R_0_control <= 1'h0;
      end else if (_T_15) begin
        loop_back_R_0_control <= io_loopBack_0_bits_control;
      end
    end else begin
      loop_back_R_0_control <= _GEN_5;
    end
    if (reset) begin
      loop_back_valid_R_0 <= 1'h0;
    end else if (_T_27) begin
      loop_back_valid_R_0 <= _GEN_6;
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          loop_back_valid_R_0 <= 1'h0;
        end else begin
          loop_back_valid_R_0 <= _GEN_6;
        end
      end else begin
        loop_back_valid_R_0 <= _GEN_6;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        loop_back_valid_R_0 <= 1'h0;
      end else begin
        loop_back_valid_R_0 <= _GEN_6;
      end
    end else begin
      loop_back_valid_R_0 <= _GEN_6;
    end
    if (reset) begin
      loop_finish_R_0_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_17) begin
        loop_finish_R_0_control <= io_loopFinish_0_bits_control;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          loop_finish_R_0_control <= 1'h0;
        end else if (_T_17) begin
          loop_finish_R_0_control <= io_loopFinish_0_bits_control;
        end
      end else if (_T_17) begin
        loop_finish_R_0_control <= io_loopFinish_0_bits_control;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        loop_finish_R_0_control <= 1'h0;
      end else if (_T_17) begin
        loop_finish_R_0_control <= io_loopFinish_0_bits_control;
      end
    end else begin
      loop_finish_R_0_control <= _GEN_8;
    end
    if (reset) begin
      loop_finish_valid_R_0 <= 1'h0;
    end else if (_T_27) begin
      loop_finish_valid_R_0 <= _GEN_9;
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          loop_finish_valid_R_0 <= 1'h0;
        end else begin
          loop_finish_valid_R_0 <= _GEN_9;
        end
      end else begin
        loop_finish_valid_R_0 <= _GEN_9;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        loop_finish_valid_R_0 <= 1'h0;
      end else begin
        loop_finish_valid_R_0 <= _GEN_9;
      end
    end else begin
      loop_finish_valid_R_0 <= _GEN_9;
    end
    if (reset) begin
      in_live_in_R_0_data <= 64'h0;
    end else if (_T_27) begin
      if (_T_19) begin
        in_live_in_R_0_data <= io_InLiveIn_0_bits_data;
      end
    end else if (_T_32) begin
      if (_T_19) begin
        in_live_in_R_0_data <= io_InLiveIn_0_bits_data;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        in_live_in_R_0_data <= 64'h0;
      end else if (_T_19) begin
        in_live_in_R_0_data <= io_InLiveIn_0_bits_data;
      end
    end else if (_T_19) begin
      in_live_in_R_0_data <= io_InLiveIn_0_bits_data;
    end
    if (reset) begin
      in_live_in_valid_R_0 <= 1'h0;
    end else if (_T_27) begin
      in_live_in_valid_R_0 <= _GEN_13;
    end else if (_T_32) begin
      in_live_in_valid_R_0 <= _GEN_13;
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        in_live_in_valid_R_0 <= 1'h0;
      end else begin
        in_live_in_valid_R_0 <= _GEN_13;
      end
    end else begin
      in_live_in_valid_R_0 <= _GEN_13;
    end
    if (reset) begin
      in_carry_in_R_0_taskID <= 5'h0;
    end else if (_T_21) begin
      in_carry_in_R_0_taskID <= io_CarryDepenIn_0_bits_taskID;
    end
    if (reset) begin
      in_carry_in_R_0_data <= 64'h0;
    end else if (_T_21) begin
      in_carry_in_R_0_data <= io_CarryDepenIn_0_bits_data;
    end
    if (reset) begin
      in_carry_in_valid_R_0 <= 1'h0;
    end else if (_T_27) begin
      in_carry_in_valid_R_0 <= _GEN_17;
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          in_carry_in_valid_R_0 <= 1'h0;
        end else begin
          in_carry_in_valid_R_0 <= _GEN_17;
        end
      end else begin
        in_carry_in_valid_R_0 <= _GEN_17;
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        in_carry_in_valid_R_0 <= 1'h0;
      end else begin
        in_carry_in_valid_R_0 <= _GEN_17;
      end
    end else begin
      in_carry_in_valid_R_0 <= _GEN_17;
    end
    if (reset) begin
      out_live_in_valid_R_0_0 <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        out_live_in_valid_R_0_0 <= _GEN_26;
      end else if (_T_25) begin
        out_live_in_valid_R_0_0 <= 1'h0;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        out_live_in_valid_R_0_0 <= _GEN_66;
      end else if (_T_25) begin
        out_live_in_valid_R_0_0 <= 1'h0;
      end
    end else if (_T_25) begin
      out_live_in_valid_R_0_0 <= 1'h0;
    end
    if (reset) begin
      out_live_in_fire_R_0_0 <= 1'h0;
    end else if (_T_27) begin
      out_live_in_fire_R_0_0 <= _GEN_23;
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          out_live_in_fire_R_0_0 <= 1'h0;
        end else begin
          out_live_in_fire_R_0_0 <= _GEN_23;
        end
      end else begin
        out_live_in_fire_R_0_0 <= _GEN_23;
      end
    end else begin
      out_live_in_fire_R_0_0 <= _GEN_23;
    end
    if (reset) begin
      out_carry_out_valid_R_0_0 <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        out_carry_out_valid_R_0_0 <= _GEN_27;
      end else if (_T_26) begin
        out_carry_out_valid_R_0_0 <= 1'h0;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        out_carry_out_valid_R_0_0 <= _GEN_67;
      end else if (_T_26) begin
        out_carry_out_valid_R_0_0 <= 1'h0;
      end
    end else if (_T_26) begin
      out_carry_out_valid_R_0_0 <= 1'h0;
    end
    if (reset) begin
      active_loop_start_R_taskID <= 5'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (enable_R_control) begin
          active_loop_start_R_taskID <= 5'h0;
        end
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          active_loop_start_R_taskID <= loop_back_R_0_taskID;
        end else if (loop_finish_R_0_control) begin
          active_loop_start_R_taskID <= 5'h0;
        end
      end
    end
    if (reset) begin
      active_loop_start_R_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        active_loop_start_R_control <= _GEN_28;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          active_loop_start_R_control <= 1'h0;
        end else if (loop_finish_R_0_control) begin
          active_loop_start_R_control <= 1'h0;
        end
      end
    end
    if (reset) begin
      active_loop_start_valid_R <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        active_loop_start_valid_R <= _GEN_30;
      end else if (_T_22) begin
        active_loop_start_valid_R <= 1'h0;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        active_loop_start_valid_R <= _GEN_60;
      end else if (_T_22) begin
        active_loop_start_valid_R <= 1'h0;
      end
    end else if (_T_22) begin
      active_loop_start_valid_R <= 1'h0;
    end
    if (reset) begin
      active_loop_back_R_taskID <= 5'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (enable_R_control) begin
          active_loop_back_R_taskID <= 5'h0;
        end
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          active_loop_back_R_taskID <= loop_back_R_0_taskID;
        end else if (loop_finish_R_0_control) begin
          active_loop_back_R_taskID <= 5'h0;
        end
      end
    end
    if (reset) begin
      active_loop_back_R_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (enable_R_control) begin
          active_loop_back_R_control <= 1'h0;
        end
      end
    end else if (_T_32) begin
      if (_T_35) begin
        active_loop_back_R_control <= _GEN_61;
      end
    end
    if (reset) begin
      active_loop_back_valid_R <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        active_loop_back_valid_R <= _GEN_33;
      end else if (_T_23) begin
        active_loop_back_valid_R <= 1'h0;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        active_loop_back_valid_R <= _GEN_63;
      end else if (_T_23) begin
        active_loop_back_valid_R <= 1'h0;
      end
    end else if (_T_23) begin
      active_loop_back_valid_R <= 1'h0;
    end
    if (reset) begin
      loop_exit_R_0_taskID <= 5'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (!(enable_R_control)) begin
          loop_exit_R_0_taskID <= 5'h0;
        end
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (!(loop_back_R_0_control)) begin
          if (loop_finish_R_0_control) begin
            loop_exit_R_0_taskID <= loop_back_R_0_taskID;
          end
        end
      end
    end
    if (reset) begin
      loop_exit_R_0_control <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        loop_exit_R_0_control <= _GEN_35;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (!(loop_back_R_0_control)) begin
          loop_exit_R_0_control <= _GEN_55;
        end
      end
    end
    if (reset) begin
      loop_exit_valid_R_0 <= 1'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (enable_R_control) begin
          if (_T_24) begin
            loop_exit_valid_R_0 <= 1'h0;
          end
        end else begin
          loop_exit_valid_R_0 <= 1'h1;
        end
      end else if (_T_24) begin
        loop_exit_valid_R_0 <= 1'h0;
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          if (_T_24) begin
            loop_exit_valid_R_0 <= 1'h0;
          end
        end else begin
          loop_exit_valid_R_0 <= _GEN_50;
        end
      end else if (_T_24) begin
        loop_exit_valid_R_0 <= 1'h0;
      end
    end else begin
      loop_exit_valid_R_0 <= _GEN_20;
    end
    if (reset) begin
      loop_exit_fire_R_0 <= 1'h0;
    end else begin
      loop_exit_fire_R_0 <= _GEN_21;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        if (enable_R_control) begin
          state <= 2'h1;
        end else begin
          state <= 2'h2;
        end
      end
    end else if (_T_32) begin
      if (_T_35) begin
        if (loop_back_R_0_control) begin
          state <= 2'h1;
        end else if (loop_finish_R_0_control) begin
          state <= 2'h2;
        end
      end
    end else if (_T_51) begin
      if (loop_exit_fire_R_0) begin
        state <= 2'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_189 & _T_43) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOOP]   Loop_0: Restarted fired @ %d\n",io_activate_loop_start_bits_taskID,cycleCount); // @[LoopBlock.scala 935:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_195 & _T_43) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOOP]   Loop_0: Output fired @ %d ",io_activate_loop_start_bits_taskID,cycleCount); // @[LoopBlock.scala 953:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_195 & _T_43) begin
          $fwrite(32'h80000002,"\n"); // @[LoopBlock.scala 958:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  output  io_Out_0_bits_control
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
  reg  output_fire_R_0; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_4;
  wire  _T_7; // @[Decoupled.scala 40:37]
  wire  _GEN_3; // @[BasicBlock.scala 233:36]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _GEN_4; // @[BasicBlock.scala 245:28]
  wire  out_fire_mask_0; // @[BasicBlock.scala 257:85]
  reg  state; // @[BasicBlock.scala 293:22]
  reg [31:0] _RAND_5;
  wire  _T_15; // @[Conditional.scala 37:30]
  wire  _T_17; // @[BasicBlock.scala 310:81]
  wire  _T_18; // @[BasicBlock.scala 316:19]
  wire  _T_19; // @[BasicBlock.scala 316:19]
  wire  _GEN_6; // @[BasicBlock.scala 305:8]
  wire  _GEN_8; // @[BasicBlock.scala 305:8]
  wire  _GEN_26; // @[BasicBlock.scala 316:19]
  wire  _GEN_27; // @[BasicBlock.scala 316:19]
  wire  _GEN_29; // @[BasicBlock.scala 321:19]
  wire  _GEN_30; // @[BasicBlock.scala 321:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_7 = io_predicateIn_0_ready & io_predicateIn_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_3 = _T_7 | in_data_valid_R_0; // @[BasicBlock.scala 233:36]
  assign _T_8 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_4 = _T_8 | output_fire_R_0; // @[BasicBlock.scala 245:28]
  assign out_fire_mask_0 = output_fire_R_0 | _T_8; // @[BasicBlock.scala 257:85]
  assign _T_15 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_17 = _T_8 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_18 = $unsigned(reset); // @[BasicBlock.scala 316:19]
  assign _T_19 = _T_18 == 1'h0; // @[BasicBlock.scala 316:19]
  assign _GEN_6 = _GEN_3 | output_valid_R_0; // @[BasicBlock.scala 305:8]
  assign _GEN_8 = _GEN_3 | state; // @[BasicBlock.scala 305:8]
  assign io_predicateIn_0_ready = ~ in_data_valid_R_0; // @[BasicBlock.scala 232:29]
  assign io_Out_0_valid = _T_15 ? _GEN_6 : output_valid_R_0; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_0_bits_control = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 283:22]
  assign _GEN_26 = _T_15 & _GEN_3; // @[BasicBlock.scala 316:19]
  assign _GEN_27 = _GEN_26 & in_data_R_0_control; // @[BasicBlock.scala 316:19]
  assign _GEN_29 = in_data_R_0_control == 1'h0; // @[BasicBlock.scala 321:19]
  assign _GEN_30 = _GEN_26 & _GEN_29; // @[BasicBlock.scala 321:19]
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
  output_fire_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[0:0];
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
    end else if (_T_15) begin
      if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (state) begin
      if (out_fire_mask_0) begin
        in_data_R_0_control <= 1'h0;
      end else if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (_T_7) begin
      in_data_R_0_control <= io_predicateIn_0_bits_control;
    end
    if (reset) begin
      in_data_valid_R_0 <= 1'h0;
    end else if (_T_15) begin
      in_data_valid_R_0 <= _GEN_3;
    end else if (state) begin
      if (out_fire_mask_0) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_3;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_3;
    end
    if (reset) begin
      output_valid_R_0 <= 1'h0;
    end else if (_T_15) begin
      if (_GEN_3) begin
        output_valid_R_0 <= _T_17;
      end else if (_T_8) begin
        output_valid_R_0 <= 1'h0;
      end
    end else if (_T_8) begin
      output_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      output_fire_R_0 <= 1'h0;
    end else if (_T_15) begin
      output_fire_R_0 <= _GEN_4;
    end else if (state) begin
      if (out_fire_mask_0) begin
        output_fire_R_0 <= 1'h0;
      end else begin
        output_fire_R_0 <= _GEN_4;
      end
    end else begin
      output_fire_R_0 <= _GEN_4;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_15) begin
      state <= _GEN_8;
    end else if (state) begin
      if (out_fire_mask_0) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_27 & _T_19) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [BB]   bb_entry0: Output [T] fired @ %d\n",5'h0,cycleCount); // @[BasicBlock.scala 316:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_30 & _T_19) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [BB]   bb_entry0: Output [F] fired @ %d\n",5'h0,cycleCount); // @[BasicBlock.scala 321:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BasicBlockNoMaskFastNode_1(
  input        clock,
  input        reset,
  output       io_predicateIn_0_ready,
  input        io_predicateIn_0_valid,
  input  [4:0] io_predicateIn_0_bits_taskID,
  input        io_predicateIn_0_bits_control,
  input        io_Out_0_ready,
  output       io_Out_0_valid,
  output [4:0] io_Out_0_bits_taskID,
  input        io_Out_1_ready,
  output       io_Out_1_valid,
  output [4:0] io_Out_1_bits_taskID,
  output       io_Out_1_bits_control,
  input        io_Out_2_ready,
  output       io_Out_2_valid,
  output [4:0] io_Out_2_bits_taskID,
  output       io_Out_2_bits_control,
  input        io_Out_3_ready,
  output       io_Out_3_valid,
  output [4:0] io_Out_3_bits_taskID
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] in_data_R_0_taskID; // @[BasicBlock.scala 223:46]
  reg [31:0] _RAND_1;
  reg  in_data_R_0_control; // @[BasicBlock.scala 223:46]
  reg [31:0] _RAND_2;
  reg  in_data_valid_R_0; // @[BasicBlock.scala 224:52]
  reg [31:0] _RAND_3;
  reg [4:0] output_R_taskID; // @[BasicBlock.scala 226:25]
  reg [31:0] _RAND_4;
  reg  output_valid_R_0; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_5;
  reg  output_valid_R_1; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_6;
  reg  output_valid_R_2; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_7;
  reg  output_valid_R_3; // @[BasicBlock.scala 227:49]
  reg [31:0] _RAND_8;
  reg  output_fire_R_0; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_9;
  reg  output_fire_R_1; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_10;
  reg  output_fire_R_2; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_11;
  reg  output_fire_R_3; // @[BasicBlock.scala 228:48]
  reg [31:0] _RAND_12;
  wire  _T_7; // @[Decoupled.scala 40:37]
  wire  _GEN_3; // @[BasicBlock.scala 233:36]
  wire [4:0] in_task_ID; // @[BasicBlock.scala 240:34]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _GEN_4; // @[BasicBlock.scala 245:28]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _GEN_6; // @[BasicBlock.scala 245:28]
  wire  _T_10; // @[Decoupled.scala 40:37]
  wire  _GEN_8; // @[BasicBlock.scala 245:28]
  wire  _T_11; // @[Decoupled.scala 40:37]
  wire  _GEN_10; // @[BasicBlock.scala 245:28]
  wire  out_fire_mask_0; // @[BasicBlock.scala 257:85]
  wire  out_fire_mask_1; // @[BasicBlock.scala 257:85]
  wire  out_fire_mask_2; // @[BasicBlock.scala 257:85]
  wire  out_fire_mask_3; // @[BasicBlock.scala 257:85]
  reg  state; // @[BasicBlock.scala 293:22]
  reg [31:0] _RAND_13;
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _T_29; // @[BasicBlock.scala 310:81]
  wire  _T_30; // @[BasicBlock.scala 310:81]
  wire  _T_31; // @[BasicBlock.scala 310:81]
  wire  _T_32; // @[BasicBlock.scala 310:81]
  wire  _T_33; // @[BasicBlock.scala 316:19]
  wire  _T_34; // @[BasicBlock.scala 316:19]
  wire  _GEN_12; // @[BasicBlock.scala 305:8]
  wire  _GEN_13; // @[BasicBlock.scala 305:8]
  wire  _GEN_14; // @[BasicBlock.scala 305:8]
  wire  _GEN_15; // @[BasicBlock.scala 305:8]
  wire  _GEN_20; // @[BasicBlock.scala 305:8]
  wire  _T_38; // @[BasicBlock.scala 329:35]
  wire  _T_39; // @[BasicBlock.scala 329:35]
  wire  _T_40; // @[BasicBlock.scala 329:35]
  wire  _GEN_53; // @[BasicBlock.scala 316:19]
  wire  _GEN_54; // @[BasicBlock.scala 316:19]
  wire  _GEN_56; // @[BasicBlock.scala 321:19]
  wire  _GEN_57; // @[BasicBlock.scala 321:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_7 = io_predicateIn_0_ready & io_predicateIn_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_3 = _T_7 | in_data_valid_R_0; // @[BasicBlock.scala 233:36]
  assign in_task_ID = io_predicateIn_0_bits_taskID | in_data_R_0_taskID; // @[BasicBlock.scala 240:34]
  assign _T_8 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_4 = _T_8 | output_fire_R_0; // @[BasicBlock.scala 245:28]
  assign _T_9 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _GEN_6 = _T_9 | output_fire_R_1; // @[BasicBlock.scala 245:28]
  assign _T_10 = io_Out_2_ready & io_Out_2_valid; // @[Decoupled.scala 40:37]
  assign _GEN_8 = _T_10 | output_fire_R_2; // @[BasicBlock.scala 245:28]
  assign _T_11 = io_Out_3_ready & io_Out_3_valid; // @[Decoupled.scala 40:37]
  assign _GEN_10 = _T_11 | output_fire_R_3; // @[BasicBlock.scala 245:28]
  assign out_fire_mask_0 = output_fire_R_0 | _T_8; // @[BasicBlock.scala 257:85]
  assign out_fire_mask_1 = output_fire_R_1 | _T_9; // @[BasicBlock.scala 257:85]
  assign out_fire_mask_2 = output_fire_R_2 | _T_10; // @[BasicBlock.scala 257:85]
  assign out_fire_mask_3 = output_fire_R_3 | _T_11; // @[BasicBlock.scala 257:85]
  assign _T_24 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_29 = _T_8 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_30 = _T_9 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_31 = _T_10 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_32 = _T_11 ^ 1'h1; // @[BasicBlock.scala 310:81]
  assign _T_33 = $unsigned(reset); // @[BasicBlock.scala 316:19]
  assign _T_34 = _T_33 == 1'h0; // @[BasicBlock.scala 316:19]
  assign _GEN_12 = _GEN_3 | output_valid_R_0; // @[BasicBlock.scala 305:8]
  assign _GEN_13 = _GEN_3 | output_valid_R_1; // @[BasicBlock.scala 305:8]
  assign _GEN_14 = _GEN_3 | output_valid_R_2; // @[BasicBlock.scala 305:8]
  assign _GEN_15 = _GEN_3 | output_valid_R_3; // @[BasicBlock.scala 305:8]
  assign _GEN_20 = _GEN_3 | state; // @[BasicBlock.scala 305:8]
  assign _T_38 = out_fire_mask_0 & out_fire_mask_1; // @[BasicBlock.scala 329:35]
  assign _T_39 = _T_38 & out_fire_mask_2; // @[BasicBlock.scala 329:35]
  assign _T_40 = _T_39 & out_fire_mask_3; // @[BasicBlock.scala 329:35]
  assign io_predicateIn_0_ready = ~ in_data_valid_R_0; // @[BasicBlock.scala 232:29]
  assign io_Out_0_valid = _T_24 ? _GEN_12 : output_valid_R_0; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_0_bits_taskID = io_predicateIn_0_bits_taskID | in_data_R_0_taskID; // @[BasicBlock.scala 283:22]
  assign io_Out_1_valid = _T_24 ? _GEN_13 : output_valid_R_1; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_1_bits_taskID = io_predicateIn_0_bits_taskID | in_data_R_0_taskID; // @[BasicBlock.scala 283:22]
  assign io_Out_1_bits_control = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 283:22]
  assign io_Out_2_valid = _T_24 ? _GEN_14 : output_valid_R_2; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_2_bits_taskID = io_predicateIn_0_bits_taskID | in_data_R_0_taskID; // @[BasicBlock.scala 283:22]
  assign io_Out_2_bits_control = _T_7 ? io_predicateIn_0_bits_control : in_data_R_0_control; // @[BasicBlock.scala 283:22]
  assign io_Out_3_valid = _T_24 ? _GEN_15 : output_valid_R_3; // @[BasicBlock.scala 288:21 BasicBlock.scala 307:34]
  assign io_Out_3_bits_taskID = io_predicateIn_0_bits_taskID | in_data_R_0_taskID; // @[BasicBlock.scala 283:22]
  assign _GEN_53 = _T_24 & _GEN_3; // @[BasicBlock.scala 316:19]
  assign _GEN_54 = _GEN_53 & in_data_R_0_control; // @[BasicBlock.scala 316:19]
  assign _GEN_56 = in_data_R_0_control == 1'h0; // @[BasicBlock.scala 321:19]
  assign _GEN_57 = _GEN_53 & _GEN_56; // @[BasicBlock.scala 321:19]
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
  in_data_R_0_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_data_R_0_control = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  output_R_taskID = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  output_valid_R_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  output_valid_R_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  output_valid_R_2 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  output_valid_R_3 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  output_fire_R_0 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  output_fire_R_1 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  output_fire_R_2 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  output_fire_R_3 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  state = _RAND_13[0:0];
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
      in_data_R_0_taskID <= 5'h0;
    end else if (_T_24) begin
      if (_T_7) begin
        in_data_R_0_taskID <= io_predicateIn_0_bits_taskID;
      end
    end else if (state) begin
      if (_T_40) begin
        in_data_R_0_taskID <= 5'h0;
      end else if (_T_7) begin
        in_data_R_0_taskID <= io_predicateIn_0_bits_taskID;
      end
    end else if (_T_7) begin
      in_data_R_0_taskID <= io_predicateIn_0_bits_taskID;
    end
    if (reset) begin
      in_data_R_0_control <= 1'h0;
    end else if (_T_24) begin
      if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (state) begin
      if (_T_40) begin
        in_data_R_0_control <= 1'h0;
      end else if (_T_7) begin
        in_data_R_0_control <= io_predicateIn_0_bits_control;
      end
    end else if (_T_7) begin
      in_data_R_0_control <= io_predicateIn_0_bits_control;
    end
    if (reset) begin
      in_data_valid_R_0 <= 1'h0;
    end else if (_T_24) begin
      in_data_valid_R_0 <= _GEN_3;
    end else if (state) begin
      if (_T_40) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_3;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_3;
    end
    if (reset) begin
      output_R_taskID <= 5'h0;
    end else begin
      output_R_taskID <= in_task_ID;
    end
    if (reset) begin
      output_valid_R_0 <= 1'h0;
    end else if (_T_24) begin
      if (_GEN_3) begin
        output_valid_R_0 <= _T_29;
      end else if (_T_8) begin
        output_valid_R_0 <= 1'h0;
      end
    end else if (_T_8) begin
      output_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      output_valid_R_1 <= 1'h0;
    end else if (_T_24) begin
      if (_GEN_3) begin
        output_valid_R_1 <= _T_30;
      end else if (_T_9) begin
        output_valid_R_1 <= 1'h0;
      end
    end else if (_T_9) begin
      output_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      output_valid_R_2 <= 1'h0;
    end else if (_T_24) begin
      if (_GEN_3) begin
        output_valid_R_2 <= _T_31;
      end else if (_T_10) begin
        output_valid_R_2 <= 1'h0;
      end
    end else if (_T_10) begin
      output_valid_R_2 <= 1'h0;
    end
    if (reset) begin
      output_valid_R_3 <= 1'h0;
    end else if (_T_24) begin
      if (_GEN_3) begin
        output_valid_R_3 <= _T_32;
      end else if (_T_11) begin
        output_valid_R_3 <= 1'h0;
      end
    end else if (_T_11) begin
      output_valid_R_3 <= 1'h0;
    end
    if (reset) begin
      output_fire_R_0 <= 1'h0;
    end else if (_T_24) begin
      output_fire_R_0 <= _GEN_4;
    end else if (state) begin
      if (_T_40) begin
        output_fire_R_0 <= 1'h0;
      end else begin
        output_fire_R_0 <= _GEN_4;
      end
    end else begin
      output_fire_R_0 <= _GEN_4;
    end
    if (reset) begin
      output_fire_R_1 <= 1'h0;
    end else if (_T_24) begin
      output_fire_R_1 <= _GEN_6;
    end else if (state) begin
      if (_T_40) begin
        output_fire_R_1 <= 1'h0;
      end else begin
        output_fire_R_1 <= _GEN_6;
      end
    end else begin
      output_fire_R_1 <= _GEN_6;
    end
    if (reset) begin
      output_fire_R_2 <= 1'h0;
    end else if (_T_24) begin
      output_fire_R_2 <= _GEN_8;
    end else if (state) begin
      if (_T_40) begin
        output_fire_R_2 <= 1'h0;
      end else begin
        output_fire_R_2 <= _GEN_8;
      end
    end else begin
      output_fire_R_2 <= _GEN_8;
    end
    if (reset) begin
      output_fire_R_3 <= 1'h0;
    end else if (_T_24) begin
      output_fire_R_3 <= _GEN_10;
    end else if (state) begin
      if (_T_40) begin
        output_fire_R_3 <= 1'h0;
      end else begin
        output_fire_R_3 <= _GEN_10;
      end
    end else begin
      output_fire_R_3 <= _GEN_10;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_24) begin
      state <= _GEN_20;
    end else if (state) begin
      if (_T_40) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_54 & _T_34) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [BB]   bb_for_cond_cleanup1: Output [T] fired @ %d\n",output_R_taskID,cycleCount); // @[BasicBlock.scala 316:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_34) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [BB]   bb_for_cond_cleanup1: Output [F] fired @ %d\n",output_R_taskID,cycleCount); // @[BasicBlock.scala 321:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BasicBlockNode(
  input        clock,
  input        reset,
  input        io_MaskBB_0_ready,
  output       io_MaskBB_0_valid,
  output [1:0] io_MaskBB_0_bits,
  input        io_Out_0_ready,
  output       io_Out_0_valid,
  output [4:0] io_Out_0_bits_taskID,
  input        io_Out_1_ready,
  output       io_Out_1_valid,
  output [4:0] io_Out_1_bits_taskID,
  input        io_Out_2_ready,
  output       io_Out_2_valid,
  output [4:0] io_Out_2_bits_taskID,
  input        io_Out_3_ready,
  output       io_Out_3_valid,
  output [4:0] io_Out_3_bits_taskID,
  input        io_Out_4_ready,
  output       io_Out_4_valid,
  output       io_Out_4_bits_control,
  input        io_Out_5_ready,
  output       io_Out_5_valid,
  output [4:0] io_Out_5_bits_taskID,
  output       io_Out_5_bits_control,
  input        io_Out_6_ready,
  output       io_Out_6_valid,
  output [4:0] io_Out_6_bits_taskID,
  output       io_Out_6_bits_control,
  input        io_Out_7_ready,
  output       io_Out_7_valid,
  output [4:0] io_Out_7_bits_taskID,
  output       io_Out_7_bits_control,
  input        io_Out_8_ready,
  output       io_Out_8_valid,
  output [4:0] io_Out_8_bits_taskID,
  output       io_Out_8_bits_control,
  input        io_Out_9_ready,
  output       io_Out_9_valid,
  output [4:0] io_Out_9_bits_taskID,
  output       io_Out_9_bits_control,
  input        io_Out_10_ready,
  output       io_Out_10_valid,
  output [4:0] io_Out_10_bits_taskID,
  output       io_Out_10_bits_control,
  input        io_Out_11_ready,
  output       io_Out_11_valid,
  output [4:0] io_Out_11_bits_taskID,
  output       io_Out_11_bits_control,
  output       io_predicateIn_0_ready,
  input        io_predicateIn_0_valid,
  input  [4:0] io_predicateIn_0_bits_taskID,
  input        io_predicateIn_0_bits_control,
  output       io_predicateIn_1_ready,
  input        io_predicateIn_1_valid,
  input  [4:0] io_predicateIn_1_bits_taskID,
  input        io_predicateIn_1_bits_control
);
  reg  out_ready_R_0; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_0;
  reg  out_ready_R_1; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_1;
  reg  out_ready_R_2; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_2;
  reg  out_ready_R_3; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_3;
  reg  out_ready_R_4; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_4;
  reg  out_ready_R_5; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_5;
  reg  out_ready_R_6; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_6;
  reg  out_ready_R_7; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_7;
  reg  out_ready_R_8; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_8;
  reg  out_ready_R_9; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_9;
  reg  out_ready_R_10; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_10;
  reg  out_ready_R_11; // @[HandShaking.scala 703:28]
  reg [31:0] _RAND_11;
  reg  out_valid_R_0; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_12;
  reg  out_valid_R_1; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_13;
  reg  out_valid_R_2; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_14;
  reg  out_valid_R_3; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_15;
  reg  out_valid_R_4; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_16;
  reg  out_valid_R_5; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_17;
  reg  out_valid_R_6; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_18;
  reg  out_valid_R_7; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_19;
  reg  out_valid_R_8; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_20;
  reg  out_valid_R_9; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_21;
  reg  out_valid_R_10; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_22;
  reg  out_valid_R_11; // @[HandShaking.scala 704:28]
  reg [31:0] _RAND_23;
  reg  mask_valid_R_0; // @[HandShaking.scala 708:46]
  reg [31:0] _RAND_24;
  wire  _T_2; // @[Decoupled.scala 40:37]
  wire  _GEN_1; // @[HandShaking.scala 717:29]
  wire  _T_3; // @[Decoupled.scala 40:37]
  wire  _GEN_3; // @[HandShaking.scala 717:29]
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire  _GEN_5; // @[HandShaking.scala 717:29]
  wire  _T_5; // @[Decoupled.scala 40:37]
  wire  _GEN_7; // @[HandShaking.scala 717:29]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[HandShaking.scala 717:29]
  wire  _T_7; // @[Decoupled.scala 40:37]
  wire  _GEN_11; // @[HandShaking.scala 717:29]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[HandShaking.scala 717:29]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _GEN_15; // @[HandShaking.scala 717:29]
  wire  _T_10; // @[Decoupled.scala 40:37]
  wire  _GEN_17; // @[HandShaking.scala 717:29]
  wire  _T_11; // @[Decoupled.scala 40:37]
  wire  _GEN_19; // @[HandShaking.scala 717:29]
  wire  _T_12; // @[Decoupled.scala 40:37]
  wire  _GEN_21; // @[HandShaking.scala 717:29]
  wire  _T_13; // @[Decoupled.scala 40:37]
  wire  _GEN_23; // @[HandShaking.scala 717:29]
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_25; // @[HandShaking.scala 728:32]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_25;
  wire [14:0] _T_17; // @[Counter.scala 38:22]
  reg [4:0] predicate_in_R_0_taskID; // @[BasicBlock.scala 65:51]
  reg [31:0] _RAND_26;
  reg  predicate_in_R_0_control; // @[BasicBlock.scala 65:51]
  reg [31:0] _RAND_27;
  reg [4:0] predicate_in_R_1_taskID; // @[BasicBlock.scala 65:51]
  reg [31:0] _RAND_28;
  reg  predicate_in_R_1_control; // @[BasicBlock.scala 65:51]
  reg [31:0] _RAND_29;
  reg  predicate_control_R_0; // @[BasicBlock.scala 66:36]
  reg [31:0] _RAND_30;
  reg  predicate_control_R_1; // @[BasicBlock.scala 66:36]
  reg [31:0] _RAND_31;
  reg  predicate_valid_R_0; // @[BasicBlock.scala 67:54]
  reg [31:0] _RAND_32;
  reg  predicate_valid_R_1; // @[BasicBlock.scala 67:54]
  reg [31:0] _RAND_33;
  reg  state; // @[BasicBlock.scala 70:22]
  reg [31:0] _RAND_34;
  wire  predicate; // @[BasicBlock.scala 76:58]
  wire [4:0] predicate_task; // @[BasicBlock.scala 77:62]
  wire  _T_22; // @[Decoupled.scala 40:37]
  wire  _T_23; // @[Decoupled.scala 40:37]
  wire  _T_24; // @[BasicBlock.scala 79:91]
  wire  _T_25; // @[BasicBlock.scala 79:91]
  wire  start; // @[BasicBlock.scala 79:107]
  wire [1:0] _T_30; // @[BasicBlock.scala 103:52]
  wire  _T_31; // @[Conditional.scala 37:30]
  wire  _GEN_35; // @[BasicBlock.scala 113:19]
  wire  _GEN_36; // @[BasicBlock.scala 113:19]
  wire  _GEN_37; // @[BasicBlock.scala 113:19]
  wire  _GEN_38; // @[BasicBlock.scala 113:19]
  wire  _GEN_39; // @[BasicBlock.scala 113:19]
  wire  _GEN_40; // @[BasicBlock.scala 113:19]
  wire  _GEN_41; // @[BasicBlock.scala 113:19]
  wire  _GEN_42; // @[BasicBlock.scala 113:19]
  wire  _GEN_43; // @[BasicBlock.scala 113:19]
  wire  _GEN_44; // @[BasicBlock.scala 113:19]
  wire  _GEN_45; // @[BasicBlock.scala 113:19]
  wire  _GEN_46; // @[BasicBlock.scala 113:19]
  wire  _GEN_47; // @[BasicBlock.scala 113:19]
  wire  _GEN_48; // @[BasicBlock.scala 113:19]
  wire [5:0] _T_38; // @[HandShaking.scala 742:17]
  wire [11:0] _T_44; // @[HandShaking.scala 742:17]
  wire  _T_45; // @[HandShaking.scala 742:24]
  wire  _T_48; // @[BasicBlock.scala 127:19]
  wire  _T_49; // @[BasicBlock.scala 127:19]
  wire  _GEN_110; // @[BasicBlock.scala 127:19]
  wire  _GEN_111; // @[BasicBlock.scala 127:19]
  wire  _GEN_112; // @[BasicBlock.scala 127:19]
  wire  _GEN_113; // @[BasicBlock.scala 127:19]
  wire  _GEN_117; // @[BasicBlock.scala 133:19]
  wire  _GEN_118; // @[BasicBlock.scala 133:19]
  assign _T_2 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_1 = _T_2 ? 1'h0 : out_valid_R_0; // @[HandShaking.scala 717:29]
  assign _T_3 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _GEN_3 = _T_3 ? 1'h0 : out_valid_R_1; // @[HandShaking.scala 717:29]
  assign _T_4 = io_Out_2_ready & io_Out_2_valid; // @[Decoupled.scala 40:37]
  assign _GEN_5 = _T_4 ? 1'h0 : out_valid_R_2; // @[HandShaking.scala 717:29]
  assign _T_5 = io_Out_3_ready & io_Out_3_valid; // @[Decoupled.scala 40:37]
  assign _GEN_7 = _T_5 ? 1'h0 : out_valid_R_3; // @[HandShaking.scala 717:29]
  assign _T_6 = io_Out_4_ready & io_Out_4_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_6 ? 1'h0 : out_valid_R_4; // @[HandShaking.scala 717:29]
  assign _T_7 = io_Out_5_ready & io_Out_5_valid; // @[Decoupled.scala 40:37]
  assign _GEN_11 = _T_7 ? 1'h0 : out_valid_R_5; // @[HandShaking.scala 717:29]
  assign _T_8 = io_Out_6_ready & io_Out_6_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_8 ? 1'h0 : out_valid_R_6; // @[HandShaking.scala 717:29]
  assign _T_9 = io_Out_7_ready & io_Out_7_valid; // @[Decoupled.scala 40:37]
  assign _GEN_15 = _T_9 ? 1'h0 : out_valid_R_7; // @[HandShaking.scala 717:29]
  assign _T_10 = io_Out_8_ready & io_Out_8_valid; // @[Decoupled.scala 40:37]
  assign _GEN_17 = _T_10 ? 1'h0 : out_valid_R_8; // @[HandShaking.scala 717:29]
  assign _T_11 = io_Out_9_ready & io_Out_9_valid; // @[Decoupled.scala 40:37]
  assign _GEN_19 = _T_11 ? 1'h0 : out_valid_R_9; // @[HandShaking.scala 717:29]
  assign _T_12 = io_Out_10_ready & io_Out_10_valid; // @[Decoupled.scala 40:37]
  assign _GEN_21 = _T_12 ? 1'h0 : out_valid_R_10; // @[HandShaking.scala 717:29]
  assign _T_13 = io_Out_11_ready & io_Out_11_valid; // @[Decoupled.scala 40:37]
  assign _GEN_23 = _T_13 ? 1'h0 : out_valid_R_11; // @[HandShaking.scala 717:29]
  assign _T_14 = io_MaskBB_0_ready & io_MaskBB_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_25 = _T_14 ? 1'h0 : mask_valid_R_0; // @[HandShaking.scala 728:32]
  assign _T_17 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign predicate = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 76:58]
  assign predicate_task = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 77:62]
  assign _T_22 = io_predicateIn_0_ready & io_predicateIn_0_valid; // @[Decoupled.scala 40:37]
  assign _T_23 = io_predicateIn_1_ready & io_predicateIn_1_valid; // @[Decoupled.scala 40:37]
  assign _T_24 = _T_22 | predicate_valid_R_0; // @[BasicBlock.scala 79:91]
  assign _T_25 = _T_23 | predicate_valid_R_1; // @[BasicBlock.scala 79:91]
  assign start = _T_24 & _T_25; // @[BasicBlock.scala 79:107]
  assign _T_30 = {predicate_control_R_1,predicate_control_R_0}; // @[BasicBlock.scala 103:52]
  assign _T_31 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _GEN_35 = start | _GEN_1; // @[BasicBlock.scala 113:19]
  assign _GEN_36 = start | _GEN_3; // @[BasicBlock.scala 113:19]
  assign _GEN_37 = start | _GEN_5; // @[BasicBlock.scala 113:19]
  assign _GEN_38 = start | _GEN_7; // @[BasicBlock.scala 113:19]
  assign _GEN_39 = start | _GEN_9; // @[BasicBlock.scala 113:19]
  assign _GEN_40 = start | _GEN_11; // @[BasicBlock.scala 113:19]
  assign _GEN_41 = start | _GEN_13; // @[BasicBlock.scala 113:19]
  assign _GEN_42 = start | _GEN_15; // @[BasicBlock.scala 113:19]
  assign _GEN_43 = start | _GEN_17; // @[BasicBlock.scala 113:19]
  assign _GEN_44 = start | _GEN_19; // @[BasicBlock.scala 113:19]
  assign _GEN_45 = start | _GEN_21; // @[BasicBlock.scala 113:19]
  assign _GEN_46 = start | _GEN_23; // @[BasicBlock.scala 113:19]
  assign _GEN_47 = start | _GEN_25; // @[BasicBlock.scala 113:19]
  assign _GEN_48 = start | state; // @[BasicBlock.scala 113:19]
  assign _T_38 = {out_ready_R_5,out_ready_R_4,out_ready_R_3,out_ready_R_2,out_ready_R_1,out_ready_R_0}; // @[HandShaking.scala 742:17]
  assign _T_44 = {out_ready_R_11,out_ready_R_10,out_ready_R_9,out_ready_R_8,out_ready_R_7,out_ready_R_6,_T_38}; // @[HandShaking.scala 742:17]
  assign _T_45 = _T_44 == 12'hfff; // @[HandShaking.scala 742:24]
  assign _T_48 = $unsigned(reset); // @[BasicBlock.scala 127:19]
  assign _T_49 = _T_48 == 1'h0; // @[BasicBlock.scala 127:19]
  assign io_MaskBB_0_valid = mask_valid_R_0; // @[HandShaking.scala 727:24]
  assign io_MaskBB_0_bits = {predicate_control_R_1,predicate_control_R_0}; // @[BasicBlock.scala 103:23]
  assign io_Out_0_valid = out_valid_R_0; // @[HandShaking.scala 716:21]
  assign io_Out_0_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_1_valid = out_valid_R_1; // @[HandShaking.scala 716:21]
  assign io_Out_1_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_2_valid = out_valid_R_2; // @[HandShaking.scala 716:21]
  assign io_Out_2_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_3_valid = out_valid_R_3; // @[HandShaking.scala 716:21]
  assign io_Out_3_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_4_valid = out_valid_R_4; // @[HandShaking.scala 716:21]
  assign io_Out_4_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_5_valid = out_valid_R_5; // @[HandShaking.scala 716:21]
  assign io_Out_5_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_5_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_6_valid = out_valid_R_6; // @[HandShaking.scala 716:21]
  assign io_Out_6_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_6_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_7_valid = out_valid_R_7; // @[HandShaking.scala 716:21]
  assign io_Out_7_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_7_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_8_valid = out_valid_R_8; // @[HandShaking.scala 716:21]
  assign io_Out_8_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_8_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_9_valid = out_valid_R_9; // @[HandShaking.scala 716:21]
  assign io_Out_9_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_9_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_10_valid = out_valid_R_10; // @[HandShaking.scala 716:21]
  assign io_Out_10_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_10_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_Out_11_valid = out_valid_R_11; // @[HandShaking.scala 716:21]
  assign io_Out_11_bits_taskID = predicate_in_R_0_taskID | predicate_in_R_1_taskID; // @[BasicBlock.scala 98:27]
  assign io_Out_11_bits_control = predicate_in_R_0_control | predicate_in_R_1_control; // @[BasicBlock.scala 97:28]
  assign io_predicateIn_0_ready = ~ predicate_valid_R_0; // @[BasicBlock.scala 87:29]
  assign io_predicateIn_1_ready = ~ predicate_valid_R_1; // @[BasicBlock.scala 87:29]
  assign _GEN_110 = _T_31 == 1'h0; // @[BasicBlock.scala 127:19]
  assign _GEN_111 = _GEN_110 & state; // @[BasicBlock.scala 127:19]
  assign _GEN_112 = _GEN_111 & _T_45; // @[BasicBlock.scala 127:19]
  assign _GEN_113 = _GEN_112 & predicate; // @[BasicBlock.scala 127:19]
  assign _GEN_117 = predicate == 1'h0; // @[BasicBlock.scala 133:19]
  assign _GEN_118 = _GEN_112 & _GEN_117; // @[BasicBlock.scala 133:19]
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
  out_ready_R_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  out_ready_R_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  out_ready_R_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_3 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_ready_R_4 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_ready_R_5 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_ready_R_6 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  out_ready_R_7 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  out_ready_R_8 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  out_ready_R_9 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  out_ready_R_10 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  out_ready_R_11 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  out_valid_R_1 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  out_valid_R_2 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  out_valid_R_3 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  out_valid_R_4 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  out_valid_R_5 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  out_valid_R_6 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  out_valid_R_7 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  out_valid_R_8 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  out_valid_R_9 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  out_valid_R_10 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  out_valid_R_11 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mask_valid_R_0 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  cycleCount = _RAND_25[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  predicate_in_R_0_taskID = _RAND_26[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  predicate_in_R_0_control = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  predicate_in_R_1_taskID = _RAND_28[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  predicate_in_R_1_control = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  predicate_control_R_0 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  predicate_control_R_1 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  predicate_valid_R_0 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  predicate_valid_R_1 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  state = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_31) begin
      if (_T_2) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_2) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_2) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_ready_R_1 <= 1'h0;
    end else if (_T_31) begin
      if (_T_3) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_1 <= 1'h0;
      end else if (_T_3) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (_T_3) begin
      out_ready_R_1 <= io_Out_1_ready;
    end
    if (reset) begin
      out_ready_R_2 <= 1'h0;
    end else if (_T_31) begin
      if (_T_4) begin
        out_ready_R_2 <= io_Out_2_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_2 <= 1'h0;
      end else if (_T_4) begin
        out_ready_R_2 <= io_Out_2_ready;
      end
    end else if (_T_4) begin
      out_ready_R_2 <= io_Out_2_ready;
    end
    if (reset) begin
      out_ready_R_3 <= 1'h0;
    end else if (_T_31) begin
      if (_T_5) begin
        out_ready_R_3 <= io_Out_3_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_3 <= 1'h0;
      end else if (_T_5) begin
        out_ready_R_3 <= io_Out_3_ready;
      end
    end else if (_T_5) begin
      out_ready_R_3 <= io_Out_3_ready;
    end
    if (reset) begin
      out_ready_R_4 <= 1'h0;
    end else if (_T_31) begin
      if (_T_6) begin
        out_ready_R_4 <= io_Out_4_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_4 <= 1'h0;
      end else if (_T_6) begin
        out_ready_R_4 <= io_Out_4_ready;
      end
    end else if (_T_6) begin
      out_ready_R_4 <= io_Out_4_ready;
    end
    if (reset) begin
      out_ready_R_5 <= 1'h0;
    end else if (_T_31) begin
      if (_T_7) begin
        out_ready_R_5 <= io_Out_5_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_5 <= 1'h0;
      end else if (_T_7) begin
        out_ready_R_5 <= io_Out_5_ready;
      end
    end else if (_T_7) begin
      out_ready_R_5 <= io_Out_5_ready;
    end
    if (reset) begin
      out_ready_R_6 <= 1'h0;
    end else if (_T_31) begin
      if (_T_8) begin
        out_ready_R_6 <= io_Out_6_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_6 <= 1'h0;
      end else if (_T_8) begin
        out_ready_R_6 <= io_Out_6_ready;
      end
    end else if (_T_8) begin
      out_ready_R_6 <= io_Out_6_ready;
    end
    if (reset) begin
      out_ready_R_7 <= 1'h0;
    end else if (_T_31) begin
      if (_T_9) begin
        out_ready_R_7 <= io_Out_7_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_7 <= 1'h0;
      end else if (_T_9) begin
        out_ready_R_7 <= io_Out_7_ready;
      end
    end else if (_T_9) begin
      out_ready_R_7 <= io_Out_7_ready;
    end
    if (reset) begin
      out_ready_R_8 <= 1'h0;
    end else if (_T_31) begin
      if (_T_10) begin
        out_ready_R_8 <= io_Out_8_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_8 <= 1'h0;
      end else if (_T_10) begin
        out_ready_R_8 <= io_Out_8_ready;
      end
    end else if (_T_10) begin
      out_ready_R_8 <= io_Out_8_ready;
    end
    if (reset) begin
      out_ready_R_9 <= 1'h0;
    end else if (_T_31) begin
      if (_T_11) begin
        out_ready_R_9 <= io_Out_9_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_9 <= 1'h0;
      end else if (_T_11) begin
        out_ready_R_9 <= io_Out_9_ready;
      end
    end else if (_T_11) begin
      out_ready_R_9 <= io_Out_9_ready;
    end
    if (reset) begin
      out_ready_R_10 <= 1'h0;
    end else if (_T_31) begin
      if (_T_12) begin
        out_ready_R_10 <= io_Out_10_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_10 <= 1'h0;
      end else if (_T_12) begin
        out_ready_R_10 <= io_Out_10_ready;
      end
    end else if (_T_12) begin
      out_ready_R_10 <= io_Out_10_ready;
    end
    if (reset) begin
      out_ready_R_11 <= 1'h0;
    end else if (_T_31) begin
      if (_T_13) begin
        out_ready_R_11 <= io_Out_11_ready;
      end
    end else if (state) begin
      if (_T_45) begin
        out_ready_R_11 <= 1'h0;
      end else if (_T_13) begin
        out_ready_R_11 <= io_Out_11_ready;
      end
    end else if (_T_13) begin
      out_ready_R_11 <= io_Out_11_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_0 <= _GEN_35;
    end else if (_T_2) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_1 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_1 <= _GEN_36;
    end else if (_T_3) begin
      out_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_2 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_2 <= _GEN_37;
    end else if (_T_4) begin
      out_valid_R_2 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_3 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_3 <= _GEN_38;
    end else if (_T_5) begin
      out_valid_R_3 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_4 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_4 <= _GEN_39;
    end else if (_T_6) begin
      out_valid_R_4 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_5 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_5 <= _GEN_40;
    end else if (_T_7) begin
      out_valid_R_5 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_6 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_6 <= _GEN_41;
    end else if (_T_8) begin
      out_valid_R_6 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_7 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_7 <= _GEN_42;
    end else if (_T_9) begin
      out_valid_R_7 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_8 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_8 <= _GEN_43;
    end else if (_T_10) begin
      out_valid_R_8 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_9 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_9 <= _GEN_44;
    end else if (_T_11) begin
      out_valid_R_9 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_10 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_10 <= _GEN_45;
    end else if (_T_12) begin
      out_valid_R_10 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_11 <= 1'h0;
    end else if (_T_31) begin
      out_valid_R_11 <= _GEN_46;
    end else if (_T_13) begin
      out_valid_R_11 <= 1'h0;
    end
    if (reset) begin
      mask_valid_R_0 <= 1'h0;
    end else if (_T_31) begin
      mask_valid_R_0 <= _GEN_47;
    end else if (_T_14) begin
      mask_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_17;
    end
    if (reset) begin
      predicate_in_R_0_taskID <= 5'h0;
    end else if (_T_22) begin
      predicate_in_R_0_taskID <= io_predicateIn_0_bits_taskID;
    end
    if (reset) begin
      predicate_in_R_0_control <= 1'h0;
    end else if (_T_22) begin
      predicate_in_R_0_control <= io_predicateIn_0_bits_control;
    end
    if (reset) begin
      predicate_in_R_1_taskID <= 5'h0;
    end else if (_T_23) begin
      predicate_in_R_1_taskID <= io_predicateIn_1_bits_taskID;
    end
    if (reset) begin
      predicate_in_R_1_control <= 1'h0;
    end else if (_T_23) begin
      predicate_in_R_1_control <= io_predicateIn_1_bits_control;
    end
    if (reset) begin
      predicate_control_R_0 <= 1'h0;
    end else if (_T_22) begin
      predicate_control_R_0 <= io_predicateIn_0_bits_control;
    end
    if (reset) begin
      predicate_control_R_1 <= 1'h0;
    end else if (_T_23) begin
      predicate_control_R_1 <= io_predicateIn_1_bits_control;
    end
    if (reset) begin
      predicate_valid_R_0 <= 1'h0;
    end else if (_T_31) begin
      predicate_valid_R_0 <= _T_24;
    end else if (state) begin
      if (_T_45) begin
        predicate_valid_R_0 <= 1'h0;
      end else begin
        predicate_valid_R_0 <= _T_24;
      end
    end else begin
      predicate_valid_R_0 <= _T_24;
    end
    if (reset) begin
      predicate_valid_R_1 <= 1'h0;
    end else if (_T_31) begin
      predicate_valid_R_1 <= _T_25;
    end else if (state) begin
      if (_T_45) begin
        predicate_valid_R_1 <= 1'h0;
      end else begin
        predicate_valid_R_1 <= _T_25;
      end
    end else begin
      predicate_valid_R_1 <= _T_25;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_31) begin
      state <= _GEN_48;
    end else if (state) begin
      if (_T_45) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_113 & _T_49) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [BB]   bb_for_body2: Output fired @ %d, Mask: %d\n",predicate_task,cycleCount,_T_30); // @[BasicBlock.scala 127:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_118 & _T_49) begin
          $fwrite(32'h80000002,"[LOG] [Test05] bb_for_body2: Output fired @ %d -> 0 predicate\n",cycleCount); // @[BasicBlock.scala 133:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UBranchNode(
  input   clock,
  input   reset,
  output  io_enable_ready,
  input   io_enable_valid,
  input   io_enable_bits_control,
  input   io_Out_0_ready,
  output  io_Out_0_valid,
  output  io_Out_0_bits_control
);
  reg  enable_R_control; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_0;
  reg  enable_valid_R; // @[HandShaking.scala 519:31]
  reg [31:0] _RAND_1;
  reg  out_ready_R_0; // @[HandShaking.scala 531:28]
  reg [31:0] _RAND_2;
  reg  out_valid_R_0; // @[HandShaking.scala 532:28]
  reg [31:0] _RAND_3;
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire  _T_6; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_4;
  wire [14:0] _T_9; // @[Counter.scala 38:22]
  reg  state; // @[BranchNode.scala 587:22]
  reg [31:0] _RAND_5;
  wire  _T_11; // @[Conditional.scala 37:30]
  wire  _T_14; // @[HandShaking.scala 653:72]
  wire  _T_15; // @[BranchNode.scala 616:19]
  wire  _T_16; // @[BranchNode.scala 616:19]
  wire  _GEN_6; // @[BranchNode.scala 610:46]
  wire  _GEN_8; // @[BranchNode.scala 610:46]
  wire  _T_22; // @[HandShaking.scala 649:29]
  wire  _GEN_26; // @[BranchNode.scala 616:19]
  wire  _GEN_27; // @[BranchNode.scala 616:19]
  wire  _GEN_29; // @[BranchNode.scala 622:19]
  wire  _GEN_30; // @[BranchNode.scala 622:19]
  assign _T_4 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_11 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_14 = _T_4 ^ 1'h1; // @[HandShaking.scala 653:72]
  assign _T_15 = $unsigned(reset); // @[BranchNode.scala 616:19]
  assign _T_16 = _T_15 == 1'h0; // @[BranchNode.scala 616:19]
  assign _GEN_6 = enable_valid_R | state; // @[BranchNode.scala 610:46]
  assign _GEN_8 = enable_valid_R | out_valid_R_0; // @[BranchNode.scala 610:46]
  assign _T_22 = out_ready_R_0 | io_Out_0_ready; // @[HandShaking.scala 649:29]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 576:19]
  assign io_Out_0_valid = _T_11 ? _GEN_8 : out_valid_R_0; // @[HandShaking.scala 556:21 BranchNode.scala 613:32]
  assign io_Out_0_bits_control = enable_R_control; // @[BranchNode.scala 606:25]
  assign _GEN_26 = _T_11 & enable_valid_R; // @[BranchNode.scala 616:19]
  assign _GEN_27 = _GEN_26 & enable_R_control; // @[BranchNode.scala 616:19]
  assign _GEN_29 = enable_R_control == 1'h0; // @[BranchNode.scala 622:19]
  assign _GEN_30 = _GEN_26 & _GEN_29; // @[BranchNode.scala 622:19]
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
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_11) begin
      if (_T_6) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (state) begin
      if (_T_22) begin
        enable_R_control <= 1'h0;
      end else if (_T_6) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_6) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_11) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_22) begin
        enable_valid_R <= 1'h0;
      end else if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_6) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_11) begin
      if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_22) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_4) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_11) begin
      if (enable_valid_R) begin
        out_valid_R_0 <= _T_14;
      end else if (_T_4) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_4) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_9;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_11) begin
      state <= _GEN_6;
    end else if (state) begin
      if (_T_22) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_27 & _T_16) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [UBR] br_0: Output fired [T] @ %d,\n",5'h0,cycleCount); // @[BranchNode.scala 616:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_30 & _T_16) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [UBR] br_0: Output fired [F] @ %d,\n",5'h0,cycleCount); // @[BranchNode.scala 622:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module GepNode(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output        io_Out_0_bits_predicate,
  output [63:0] io_Out_0_bits_data,
  output        io_baseAddress_ready,
  input         io_baseAddress_valid,
  input  [63:0] io_baseAddress_bits_data,
  output        io_idx_0_ready,
  input         io_idx_0_valid
);
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_3;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_4;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_3; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_5;
  wire [14:0] _T_6; // @[Counter.scala 38:22]
  reg [63:0] base_addr_R_data; // @[GepNode.scala 881:28]
  reg [63:0] _RAND_6;
  reg  base_addr_valid_R; // @[GepNode.scala 882:34]
  reg [31:0] _RAND_7;
  reg [63:0] idx_R_0_data; // @[GepNode.scala 885:39]
  reg [63:0] _RAND_8;
  reg  idx_valid_R_0; // @[GepNode.scala 886:45]
  reg [31:0] _RAND_9;
  reg  state; // @[GepNode.scala 890:22]
  reg [31:0] _RAND_10;
  wire  _T_11; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[GepNode.scala 906:31]
  wire  _T_13; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[GepNode.scala 913:28]
  wire [67:0] seek_value; // @[GepNode.scala 921:21]
  wire [67:0] _GEN_50; // @[GepNode.scala 929:35]
  wire [67:0] data_out; // @[GepNode.scala 929:35]
  wire  _T_15; // @[Conditional.scala 37:30]
  wire  _T_16; // @[GepNode.scala 945:27]
  wire  _T_17; // @[GepNode.scala 945:48]
  wire  _T_19; // @[HandShaking.scala 233:72]
  wire  _GEN_15; // @[GepNode.scala 945:78]
  wire  _T_22; // @[HandShaking.scala 218:83]
  wire  _T_25; // @[GepNode.scala 965:17]
  wire  _T_26; // @[GepNode.scala 965:17]
  wire  _GEN_51; // @[GepNode.scala 965:17]
  wire  _GEN_52; // @[GepNode.scala 965:17]
  wire  _GEN_53; // @[GepNode.scala 965:17]
  assign _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_3 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_11 = io_baseAddress_ready & io_baseAddress_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_11 | base_addr_valid_R; // @[GepNode.scala 906:31]
  assign _T_13 = io_idx_0_ready & io_idx_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_13 | idx_valid_R_0; // @[GepNode.scala 913:28]
  assign seek_value = idx_R_0_data * 64'h8; // @[GepNode.scala 921:21]
  assign _GEN_50 = {{4'd0}, base_addr_R_data}; // @[GepNode.scala 929:35]
  assign data_out = _GEN_50 + seek_value; // @[GepNode.scala 929:35]
  assign _T_15 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_16 = enable_valid_R & base_addr_valid_R; // @[GepNode.scala 945:27]
  assign _T_17 = _T_16 & idx_valid_R_0; // @[GepNode.scala 945:48]
  assign _T_19 = _T_1 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _GEN_15 = _T_17 | state; // @[GepNode.scala 945:78]
  assign _T_22 = out_ready_R_0 | _T_1; // @[HandShaking.scala 218:83]
  assign _T_25 = $unsigned(reset); // @[GepNode.scala 965:17]
  assign _T_26 = _T_25 == 1'h0; // @[GepNode.scala 965:17]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 192:19]
  assign io_Out_0_valid = out_valid_R_0; // @[HandShaking.scala 181:21]
  assign io_Out_0_bits_predicate = enable_R_control; // @[GepNode.scala 934:30]
  assign io_Out_0_bits_data = data_out[63:0]; // @[GepNode.scala 933:25]
  assign io_baseAddress_ready = ~ base_addr_valid_R; // @[GepNode.scala 905:24]
  assign io_idx_0_ready = ~ idx_valid_R_0; // @[GepNode.scala 912:21]
  assign _GEN_51 = _T_15 == 1'h0; // @[GepNode.scala 965:17]
  assign _GEN_52 = _GEN_51 & state; // @[GepNode.scala 965:17]
  assign _GEN_53 = _GEN_52 & _T_22; // @[GepNode.scala 965:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  cycleCount = _RAND_5[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  base_addr_R_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  base_addr_valid_R = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  idx_R_0_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  idx_valid_R_0 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_3) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_3) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_15) begin
      if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_22) begin
        enable_valid_R <= 1'h0;
      end else if (_T_3) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_3) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_15) begin
      if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_22) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_1) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_15) begin
      if (_T_17) begin
        out_valid_R_0 <= _T_19;
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
      base_addr_R_data <= 64'h0;
    end else if (_T_15) begin
      if (_T_11) begin
        base_addr_R_data <= io_baseAddress_bits_data;
      end
    end else if (state) begin
      if (_T_22) begin
        base_addr_R_data <= 64'h0;
      end else if (_T_11) begin
        base_addr_R_data <= io_baseAddress_bits_data;
      end
    end else if (_T_11) begin
      base_addr_R_data <= io_baseAddress_bits_data;
    end
    if (reset) begin
      base_addr_valid_R <= 1'h0;
    end else if (_T_15) begin
      base_addr_valid_R <= _GEN_9;
    end else if (state) begin
      if (_T_22) begin
        base_addr_valid_R <= 1'h0;
      end else begin
        base_addr_valid_R <= _GEN_9;
      end
    end else begin
      base_addr_valid_R <= _GEN_9;
    end
    if (reset) begin
      idx_R_0_data <= 64'h0;
    end else if (_T_15) begin
      if (_T_13) begin
        idx_R_0_data <= 64'h9;
      end
    end else if (state) begin
      if (_T_22) begin
        idx_R_0_data <= 64'h0;
      end else if (_T_13) begin
        idx_R_0_data <= 64'h9;
      end
    end else if (_T_13) begin
      idx_R_0_data <= 64'h9;
    end
    if (reset) begin
      idx_valid_R_0 <= 1'h0;
    end else if (_T_15) begin
      idx_valid_R_0 <= _GEN_13;
    end else if (state) begin
      if (_T_22) begin
        idx_valid_R_0 <= 1'h0;
      end else begin
        idx_valid_R_0 <= _GEN_13;
      end
    end else begin
      idx_valid_R_0 <= _GEN_13;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_15) begin
      state <= _GEN_15;
    end else if (state) begin
      if (_T_22) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_26) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [GEP] Gep_arrayidx31: Output fired @ %d, Value: %d\n",enable_R_taskID,cycleCount,data_out); // @[GepNode.scala 965:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UnTypLoad(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [63:0] io_Out_0_bits_data,
  output        io_GepAddr_ready,
  input         io_GepAddr_valid,
  input         io_GepAddr_bits_predicate,
  input  [63:0] io_GepAddr_bits_data,
  input         io_memReq_ready,
  output        io_memReq_valid,
  output [63:0] io_memReq_bits_address,
  input         io_memResp_valid,
  input  [63:0] io_memResp_data
);
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 519:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 531:28]
  reg [31:0] _RAND_3;
  reg  out_valid_R_0; // @[HandShaking.scala 532:28]
  reg [31:0] _RAND_4;
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire  _T_6; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_5;
  wire [14:0] _T_9; // @[Counter.scala 38:22]
  reg  addr_R_predicate; // @[LoadSimple.scala 64:23]
  reg [31:0] _RAND_6;
  reg [63:0] addr_R_data; // @[LoadSimple.scala 64:23]
  reg [63:0] _RAND_7;
  reg  addr_valid_R; // @[LoadSimple.scala 65:29]
  reg [31:0] _RAND_8;
  reg [63:0] data_R_data; // @[LoadSimple.scala 68:23]
  reg [63:0] _RAND_9;
  reg [1:0] state; // @[LoadSimple.scala 73:22]
  reg [31:0] _RAND_10;
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[LoadSimple.scala 82:27]
  wire  complete; // @[HandShaking.scala 649:29]
  wire  predicate; // @[LoadSimple.scala 92:36]
  wire  _T_19; // @[Conditional.scala 37:30]
  wire  _T_20; // @[LoadSimple.scala 118:27]
  wire  _T_21; // @[LoadSimple.scala 119:31]
  wire  _T_22; // @[Decoupled.scala 40:37]
  wire  _T_23; // @[LoadSimple.scala 127:21]
  wire  _T_24; // @[LoadSimple.scala 127:21]
  wire  _T_27; // @[HandShaking.scala 653:72]
  wire  _GEN_17; // @[LoadSimple.scala 118:44]
  wire  _T_28; // @[Conditional.scala 37:30]
  wire  _T_34; // @[Conditional.scala 37:30]
  wire  _GEN_52; // @[LoadSimple.scala 127:21]
  wire  _GEN_53; // @[LoadSimple.scala 127:21]
  wire  _GEN_54; // @[LoadSimple.scala 127:21]
  wire  _GEN_55; // @[LoadSimple.scala 155:17]
  wire  _GEN_56; // @[LoadSimple.scala 155:17]
  wire  _GEN_57; // @[LoadSimple.scala 155:17]
  wire  _GEN_59; // @[LoadSimple.scala 167:17]
  wire  _GEN_60; // @[LoadSimple.scala 167:17]
  wire  _GEN_61; // @[LoadSimple.scala 167:17]
  wire  _GEN_62; // @[LoadSimple.scala 167:17]
  assign _T_4 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_14 = io_GepAddr_ready & io_GepAddr_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_14 | addr_valid_R; // @[LoadSimple.scala 82:27]
  assign complete = out_ready_R_0 | io_Out_0_ready; // @[HandShaking.scala 649:29]
  assign predicate = addr_R_predicate & enable_R_control; // @[LoadSimple.scala 92:36]
  assign _T_19 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_20 = enable_valid_R & addr_valid_R; // @[LoadSimple.scala 118:27]
  assign _T_21 = enable_R_control & predicate; // @[LoadSimple.scala 119:31]
  assign _T_22 = io_memReq_ready & io_memReq_valid; // @[Decoupled.scala 40:37]
  assign _T_23 = $unsigned(reset); // @[LoadSimple.scala 127:21]
  assign _T_24 = _T_23 == 1'h0; // @[LoadSimple.scala 127:21]
  assign _T_27 = _T_4 ^ 1'h1; // @[HandShaking.scala 653:72]
  assign _GEN_17 = _T_20 & _T_21; // @[LoadSimple.scala 118:44]
  assign _T_28 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_34 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 576:19]
  assign io_Out_0_valid = out_valid_R_0; // @[HandShaking.scala 556:21]
  assign io_Out_0_bits_data = data_R_data; // @[LoadSimple.scala 98:20]
  assign io_GepAddr_ready = ~ addr_valid_R; // @[LoadSimple.scala 81:20]
  assign io_memReq_valid = _T_19 & _GEN_17; // @[LoadSimple.scala 101:19 LoadSimple.scala 121:27]
  assign io_memReq_bits_address = addr_R_data; // @[LoadSimple.scala 102:26]
  assign _GEN_52 = _T_19 & _T_20; // @[LoadSimple.scala 127:21]
  assign _GEN_53 = _GEN_52 & _T_21; // @[LoadSimple.scala 127:21]
  assign _GEN_54 = _GEN_53 & _T_22; // @[LoadSimple.scala 127:21]
  assign _GEN_55 = _T_19 == 1'h0; // @[LoadSimple.scala 155:17]
  assign _GEN_56 = _GEN_55 & _T_28; // @[LoadSimple.scala 155:17]
  assign _GEN_57 = _GEN_56 & io_memResp_valid; // @[LoadSimple.scala 155:17]
  assign _GEN_59 = _T_28 == 1'h0; // @[LoadSimple.scala 167:17]
  assign _GEN_60 = _GEN_55 & _GEN_59; // @[LoadSimple.scala 167:17]
  assign _GEN_61 = _GEN_60 & _T_34; // @[LoadSimple.scala 167:17]
  assign _GEN_62 = _GEN_61 & complete; // @[LoadSimple.scala 167:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  cycleCount = _RAND_5[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr_R_predicate = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  addr_R_data = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  addr_valid_R = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  data_R_data = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_6) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_6) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_19) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_28) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_34) begin
      if (complete) begin
        enable_valid_R <= 1'h0;
      end else if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_6) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_19) begin
      if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_28) begin
      if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_34) begin
      if (complete) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_4) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (_T_21) begin
          if (_T_4) begin
            out_valid_R_0 <= 1'h0;
          end
        end else begin
          out_valid_R_0 <= _T_27;
        end
      end else if (_T_4) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        out_valid_R_0 <= _T_27;
      end else if (_T_4) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_4) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_9;
    end
    if (reset) begin
      addr_R_predicate <= 1'h0;
    end else if (_T_14) begin
      addr_R_predicate <= io_GepAddr_bits_predicate;
    end
    if (reset) begin
      addr_R_data <= 64'h0;
    end else if (_T_14) begin
      addr_R_data <= io_GepAddr_bits_data;
    end
    if (reset) begin
      addr_valid_R <= 1'h0;
    end else if (_T_19) begin
      addr_valid_R <= _GEN_9;
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        addr_valid_R <= 1'h0;
      end else begin
        addr_valid_R <= _GEN_9;
      end
    end else begin
      addr_valid_R <= _GEN_9;
    end
    if (reset) begin
      data_R_data <= 64'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (!(_T_21)) begin
          data_R_data <= 64'h0;
        end
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        data_R_data <= io_memResp_data;
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (_T_21) begin
          if (_T_22) begin
            state <= 2'h1;
          end
        end else begin
          state <= 2'h2;
        end
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        state <= 2'h2;
      end
    end else if (_T_34) begin
      if (complete) begin
        state <= 2'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_54 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_2: Memreq fired @ %d, Addr:%d\n",enable_R_taskID,cycleCount,io_memReq_bits_address); // @[LoadSimple.scala 127:21]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_2: Memresp fired @ %d, Value: %d\n",enable_R_taskID,cycleCount,io_memResp_data); // @[LoadSimple.scala 155:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_62 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_2: Output fired @ %d, Address:%d, Value: %d\n",enable_R_taskID,cycleCount,addr_R_data,data_R_data); // @[LoadSimple.scala 167:17]
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
  input  [4:0]  io_In_enable_bits_taskID,
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
  reg [4:0] output_R_enable_taskID; // @[RetNode.scala 142:25]
  reg [31:0] _RAND_4;
  reg [31:0] output_R_data_field0_data; // @[RetNode.scala 142:25]
  reg [31:0] _RAND_5;
  reg  out_ready_R; // @[RetNode.scala 143:28]
  reg [31:0] _RAND_6;
  reg  out_valid_R; // @[RetNode.scala 144:28]
  reg [31:0] _RAND_7;
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
  output_R_enable_taskID = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  output_R_data_field0_data = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_ready_R = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  out_valid_R = _RAND_7[0:0];
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
      output_R_enable_taskID <= 5'h0;
    end else if (_T_6) begin
      output_R_enable_taskID <= io_In_enable_bits_taskID;
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
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [RET] ret_3: Output fired @ %d\n",output_R_enable_taskID,cycleCount); // @[RetNode.scala 200:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PhiFastNode(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input         io_enable_bits_control,
  output        io_InData_0_ready,
  input         io_InData_0_valid,
  input  [4:0]  io_InData_0_bits_taskID,
  output        io_InData_1_ready,
  input         io_InData_1_valid,
  input  [4:0]  io_InData_1_bits_taskID,
  input  [63:0] io_InData_1_bits_data,
  output        io_Mask_ready,
  input         io_Mask_valid,
  input  [1:0]  io_Mask_bits,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [63:0] io_Out_0_bits_data,
  input         io_Out_1_ready,
  output        io_Out_1_valid,
  output [63:0] io_Out_1_bits_data
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [63:0] in_data_R_1_data; // @[PhiNode.scala 199:26]
  reg [63:0] _RAND_1;
  reg  in_data_valid_R_0; // @[PhiNode.scala 200:32]
  reg [31:0] _RAND_2;
  reg  in_data_valid_R_1; // @[PhiNode.scala 200:32]
  reg [31:0] _RAND_3;
  reg  enable_R_control; // @[PhiNode.scala 203:25]
  reg [31:0] _RAND_4;
  reg  enable_valid_R; // @[PhiNode.scala 204:31]
  reg [31:0] _RAND_5;
  reg [1:0] mask_R; // @[PhiNode.scala 207:23]
  reg [31:0] _RAND_6;
  reg  mask_valid_R; // @[PhiNode.scala 208:29]
  reg [31:0] _RAND_7;
  reg  out_valid_R_0; // @[PhiNode.scala 211:49]
  reg [31:0] _RAND_8;
  reg  out_valid_R_1; // @[PhiNode.scala 211:49]
  reg [31:0] _RAND_9;
  reg  fire_R_0; // @[PhiNode.scala 213:44]
  reg [31:0] _RAND_10;
  reg  fire_R_1; // @[PhiNode.scala 213:44]
  reg [31:0] _RAND_11;
  wire  _T_10; // @[Decoupled.scala 40:37]
  wire  _GEN_2; // @[PhiNode.scala 217:24]
  wire  _T_12; // @[Decoupled.scala 40:37]
  wire  _GEN_5; // @[PhiNode.scala 224:26]
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[PhiNode.scala 232:29]
  wire  _T_16; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[PhiNode.scala 232:29]
  wire  _T_17; // @[Bitwise.scala 108:18]
  wire  _T_18; // @[Bitwise.scala 108:44]
  wire [1:0] _T_19; // @[Cat.scala 29:58]
  wire  sel; // @[CircuitMath.scala 30:8]
  wire [63:0] _GEN_19; // @[PhiNode.scala 255:20]
  wire  _T_20; // @[Decoupled.scala 40:37]
  wire  _GEN_20; // @[PhiNode.scala 260:26]
  wire  _GEN_21; // @[PhiNode.scala 260:26]
  wire  _T_21; // @[Decoupled.scala 40:37]
  wire  _GEN_22; // @[PhiNode.scala 260:26]
  wire  _GEN_23; // @[PhiNode.scala 260:26]
  wire  fire_mask_0; // @[PhiNode.scala 267:74]
  wire  fire_mask_1; // @[PhiNode.scala 267:74]
  reg [1:0] state; // @[PhiNode.scala 275:22]
  reg [31:0] _RAND_12;
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _T_25; // @[PhiNode.scala 270:37]
  wire  _T_26; // @[PhiNode.scala 279:27]
  wire  _T_27; // @[PhiNode.scala 285:19]
  wire  _T_28; // @[PhiNode.scala 285:19]
  wire [4:0] _GEN_32; // @[PhiNode.scala 285:19]
  wire  _GEN_35; // @[PhiNode.scala 279:46]
  wire  _GEN_36; // @[PhiNode.scala 279:46]
  wire  _T_31; // @[Conditional.scala 37:30]
  wire  _T_32; // @[PhiNode.scala 301:31]
  wire  _T_36; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_70; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_138; // @[PhiNode.scala 285:19]
  wire  _GEN_139; // @[PhiNode.scala 285:19]
  wire  _GEN_141; // @[PhiNode.scala 293:19]
  wire  _GEN_142; // @[PhiNode.scala 293:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_10 = io_Mask_ready & io_Mask_valid; // @[Decoupled.scala 40:37]
  assign _GEN_2 = _T_10 | mask_valid_R; // @[PhiNode.scala 217:24]
  assign _T_12 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _GEN_5 = _T_12 | enable_valid_R; // @[PhiNode.scala 224:26]
  assign _T_14 = io_InData_0_ready & io_InData_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_14 | in_data_valid_R_0; // @[PhiNode.scala 232:29]
  assign _T_16 = io_InData_1_ready & io_InData_1_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_16 | in_data_valid_R_1; // @[PhiNode.scala 232:29]
  assign _T_17 = mask_R[0]; // @[Bitwise.scala 108:18]
  assign _T_18 = mask_R[1]; // @[Bitwise.scala 108:44]
  assign _T_19 = {_T_17,_T_18}; // @[Cat.scala 29:58]
  assign sel = _T_19[1]; // @[CircuitMath.scala 30:8]
  assign _GEN_19 = sel ? in_data_R_1_data : 64'h0; // @[PhiNode.scala 255:20]
  assign _T_20 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_20 = _T_20 | fire_R_0; // @[PhiNode.scala 260:26]
  assign _GEN_21 = _T_20 ? 1'h0 : out_valid_R_0; // @[PhiNode.scala 260:26]
  assign _T_21 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _GEN_22 = _T_21 | fire_R_1; // @[PhiNode.scala 260:26]
  assign _GEN_23 = _T_21 ? 1'h0 : out_valid_R_1; // @[PhiNode.scala 260:26]
  assign fire_mask_0 = fire_R_0 | _T_20; // @[PhiNode.scala 267:74]
  assign fire_mask_1 = fire_R_1 | _T_21; // @[PhiNode.scala 267:74]
  assign _T_24 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_25 = in_data_valid_R_0 & in_data_valid_R_1; // @[PhiNode.scala 270:37]
  assign _T_26 = enable_valid_R & _T_25; // @[PhiNode.scala 279:27]
  assign _T_27 = $unsigned(reset); // @[PhiNode.scala 285:19]
  assign _T_28 = _T_27 == 1'h0; // @[PhiNode.scala 285:19]
  assign _GEN_32 = sel ? io_InData_1_bits_taskID : io_InData_0_bits_taskID; // @[PhiNode.scala 285:19]
  assign _GEN_35 = _T_26 | _GEN_21; // @[PhiNode.scala 279:46]
  assign _GEN_36 = _T_26 | _GEN_23; // @[PhiNode.scala 279:46]
  assign _T_31 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_32 = fire_mask_0 & fire_mask_1; // @[PhiNode.scala 301:31]
  assign _T_36 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _GEN_70 = _T_36 ? 64'h0 : _GEN_19; // @[Conditional.scala 39:67]
  assign _GEN_108 = _T_31 ? _GEN_19 : _GEN_70; // @[Conditional.scala 39:67]
  assign io_enable_ready = ~ enable_valid_R; // @[PhiNode.scala 223:19]
  assign io_InData_0_ready = ~ in_data_valid_R_0; // @[PhiNode.scala 231:24]
  assign io_InData_1_ready = ~ in_data_valid_R_1; // @[PhiNode.scala 231:24]
  assign io_Mask_ready = ~ mask_valid_R; // @[PhiNode.scala 216:17]
  assign io_Out_0_valid = out_valid_R_0; // @[PhiNode.scala 256:21]
  assign io_Out_0_bits_data = _T_24 ? _GEN_19 : _GEN_108; // @[PhiNode.scala 255:20 PhiNode.scala 327:42]
  assign io_Out_1_valid = out_valid_R_1; // @[PhiNode.scala 256:21]
  assign io_Out_1_bits_data = _T_24 ? _GEN_19 : _GEN_108; // @[PhiNode.scala 255:20 PhiNode.scala 327:42]
  assign _GEN_138 = _T_24 & _T_26; // @[PhiNode.scala 285:19]
  assign _GEN_139 = _GEN_138 & enable_R_control; // @[PhiNode.scala 285:19]
  assign _GEN_141 = enable_R_control == 1'h0; // @[PhiNode.scala 293:19]
  assign _GEN_142 = _GEN_138 & _GEN_141; // @[PhiNode.scala 293:19]
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
  _RAND_1 = {2{`RANDOM}};
  in_data_R_1_data = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_data_valid_R_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_data_valid_R_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enable_R_control = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  enable_valid_R = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mask_R = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mask_valid_R = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  out_valid_R_1 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  fire_R_0 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  fire_R_1 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  state = _RAND_12[1:0];
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
      in_data_R_1_data <= 64'h0;
    end else if (_T_24) begin
      if (_T_16) begin
        in_data_R_1_data <= io_InData_1_bits_data;
      end
    end else if (_T_31) begin
      if (_T_32) begin
        in_data_R_1_data <= 64'h0;
      end else if (_T_16) begin
        in_data_R_1_data <= io_InData_1_bits_data;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        in_data_R_1_data <= 64'h0;
      end else if (_T_16) begin
        in_data_R_1_data <= io_InData_1_bits_data;
      end
    end else if (_T_16) begin
      in_data_R_1_data <= io_InData_1_bits_data;
    end
    if (reset) begin
      in_data_valid_R_0 <= 1'h0;
    end else if (_T_24) begin
      in_data_valid_R_0 <= _GEN_9;
    end else if (_T_31) begin
      if (_T_32) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_9;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        in_data_valid_R_0 <= 1'h0;
      end else begin
        in_data_valid_R_0 <= _GEN_9;
      end
    end else begin
      in_data_valid_R_0 <= _GEN_9;
    end
    if (reset) begin
      in_data_valid_R_1 <= 1'h0;
    end else if (_T_24) begin
      in_data_valid_R_1 <= _GEN_13;
    end else if (_T_31) begin
      if (_T_32) begin
        in_data_valid_R_1 <= 1'h0;
      end else begin
        in_data_valid_R_1 <= _GEN_13;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        in_data_valid_R_1 <= 1'h0;
      end else begin
        in_data_valid_R_1 <= _GEN_13;
      end
    end else begin
      in_data_valid_R_1 <= _GEN_13;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_24) begin
      if (_T_12) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_31) begin
      if (_T_32) begin
        enable_R_control <= 1'h0;
      end else if (_T_12) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        enable_R_control <= 1'h0;
      end else if (_T_12) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_12) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_24) begin
      enable_valid_R <= _GEN_5;
    end else if (_T_31) begin
      if (_T_32) begin
        enable_valid_R <= 1'h0;
      end else begin
        enable_valid_R <= _GEN_5;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        enable_valid_R <= 1'h0;
      end else begin
        enable_valid_R <= _GEN_5;
      end
    end else begin
      enable_valid_R <= _GEN_5;
    end
    if (reset) begin
      mask_R <= 2'h0;
    end else if (_T_24) begin
      if (_T_10) begin
        mask_R <= io_Mask_bits;
      end
    end else if (_T_31) begin
      if (_T_32) begin
        mask_R <= 2'h0;
      end else if (_T_10) begin
        mask_R <= io_Mask_bits;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        mask_R <= 2'h0;
      end else if (_T_10) begin
        mask_R <= io_Mask_bits;
      end
    end else if (_T_10) begin
      mask_R <= io_Mask_bits;
    end
    if (reset) begin
      mask_valid_R <= 1'h0;
    end else if (_T_24) begin
      mask_valid_R <= _GEN_2;
    end else if (_T_31) begin
      if (_T_32) begin
        mask_valid_R <= 1'h0;
      end else begin
        mask_valid_R <= _GEN_2;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        mask_valid_R <= 1'h0;
      end else begin
        mask_valid_R <= _GEN_2;
      end
    end else begin
      mask_valid_R <= _GEN_2;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_24) begin
      out_valid_R_0 <= _GEN_35;
    end else if (_T_20) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_1 <= 1'h0;
    end else if (_T_24) begin
      out_valid_R_1 <= _GEN_36;
    end else if (_T_21) begin
      out_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      fire_R_0 <= 1'h0;
    end else if (_T_24) begin
      fire_R_0 <= _GEN_20;
    end else if (_T_31) begin
      if (_T_32) begin
        fire_R_0 <= 1'h0;
      end else begin
        fire_R_0 <= _GEN_20;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        fire_R_0 <= 1'h0;
      end else begin
        fire_R_0 <= _GEN_20;
      end
    end else begin
      fire_R_0 <= _GEN_20;
    end
    if (reset) begin
      fire_R_1 <= 1'h0;
    end else if (_T_24) begin
      fire_R_1 <= _GEN_22;
    end else if (_T_31) begin
      if (_T_32) begin
        fire_R_1 <= 1'h0;
      end else begin
        fire_R_1 <= _GEN_22;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        fire_R_1 <= 1'h0;
      end else begin
        fire_R_1 <= _GEN_22;
      end
    end else begin
      fire_R_1 <= _GEN_22;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_24) begin
      if (_T_26) begin
        if (enable_R_control) begin
          state <= 2'h1;
        end else begin
          state <= 2'h2;
        end
      end
    end else if (_T_31) begin
      if (_T_32) begin
        state <= 2'h0;
      end
    end else if (_T_36) begin
      if (_T_32) begin
        state <= 2'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_139 & _T_28) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [PHI] phiindvars_iv4: Output fired @ %d, Value: %d\n",_GEN_32,cycleCount,_GEN_19); // @[PhiNode.scala 285:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_142 & _T_28) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [PHI] phiindvars_iv4: Output flushed @ %d, Value: %d\n",_GEN_32,cycleCount,_GEN_19); // @[PhiNode.scala 293:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module GepNode_1(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output        io_Out_0_bits_predicate,
  output [63:0] io_Out_0_bits_data,
  input         io_Out_1_ready,
  output        io_Out_1_valid,
  output [63:0] io_Out_1_bits_data,
  output        io_baseAddress_ready,
  input         io_baseAddress_valid,
  input  [63:0] io_baseAddress_bits_data,
  output        io_idx_0_ready,
  input         io_idx_0_valid,
  input  [63:0] io_idx_0_bits_data
);
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_3;
  reg  out_ready_R_1; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_4;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_5;
  reg  out_valid_R_1; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_6;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_2; // @[Decoupled.scala 40:37]
  wire  _T_4; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_7;
  wire [14:0] _T_7; // @[Counter.scala 38:22]
  reg [63:0] base_addr_R_data; // @[GepNode.scala 881:28]
  reg [63:0] _RAND_8;
  reg  base_addr_valid_R; // @[GepNode.scala 882:34]
  reg [31:0] _RAND_9;
  reg [63:0] idx_R_0_data; // @[GepNode.scala 885:39]
  reg [63:0] _RAND_10;
  reg  idx_valid_R_0; // @[GepNode.scala 886:45]
  reg [31:0] _RAND_11;
  reg  state; // @[GepNode.scala 890:22]
  reg [31:0] _RAND_12;
  wire  _T_12; // @[Decoupled.scala 40:37]
  wire  _GEN_11; // @[GepNode.scala 906:31]
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_15; // @[GepNode.scala 913:28]
  wire [67:0] seek_value; // @[GepNode.scala 921:21]
  wire [67:0] _GEN_57; // @[GepNode.scala 929:35]
  wire [67:0] data_out; // @[GepNode.scala 929:35]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire  _T_17; // @[GepNode.scala 945:27]
  wire  _T_18; // @[GepNode.scala 945:48]
  wire  _T_21; // @[HandShaking.scala 233:72]
  wire  _T_22; // @[HandShaking.scala 233:72]
  wire  _GEN_18; // @[GepNode.scala 945:78]
  wire  _T_26; // @[HandShaking.scala 218:83]
  wire  _T_27; // @[HandShaking.scala 218:83]
  wire  _T_28; // @[HandShaking.scala 219:27]
  wire  _T_31; // @[GepNode.scala 965:17]
  wire  _T_32; // @[GepNode.scala 965:17]
  wire  _GEN_58; // @[GepNode.scala 965:17]
  wire  _GEN_59; // @[GepNode.scala 965:17]
  wire  _GEN_60; // @[GepNode.scala 965:17]
  assign _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_2 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _T_4 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_7 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_12 = io_baseAddress_ready & io_baseAddress_valid; // @[Decoupled.scala 40:37]
  assign _GEN_11 = _T_12 | base_addr_valid_R; // @[GepNode.scala 906:31]
  assign _T_14 = io_idx_0_ready & io_idx_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_15 = _T_14 | idx_valid_R_0; // @[GepNode.scala 913:28]
  assign seek_value = idx_R_0_data * 64'h8; // @[GepNode.scala 921:21]
  assign _GEN_57 = {{4'd0}, base_addr_R_data}; // @[GepNode.scala 929:35]
  assign data_out = _GEN_57 + seek_value; // @[GepNode.scala 929:35]
  assign _T_16 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_17 = enable_valid_R & base_addr_valid_R; // @[GepNode.scala 945:27]
  assign _T_18 = _T_17 & idx_valid_R_0; // @[GepNode.scala 945:48]
  assign _T_21 = _T_1 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _T_22 = _T_2 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _GEN_18 = _T_18 | state; // @[GepNode.scala 945:78]
  assign _T_26 = out_ready_R_0 | _T_1; // @[HandShaking.scala 218:83]
  assign _T_27 = out_ready_R_1 | _T_2; // @[HandShaking.scala 218:83]
  assign _T_28 = _T_26 & _T_27; // @[HandShaking.scala 219:27]
  assign _T_31 = $unsigned(reset); // @[GepNode.scala 965:17]
  assign _T_32 = _T_31 == 1'h0; // @[GepNode.scala 965:17]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 192:19]
  assign io_Out_0_valid = out_valid_R_0; // @[HandShaking.scala 181:21]
  assign io_Out_0_bits_predicate = enable_R_control; // @[GepNode.scala 934:30]
  assign io_Out_0_bits_data = data_out[63:0]; // @[GepNode.scala 933:25]
  assign io_Out_1_valid = out_valid_R_1; // @[HandShaking.scala 181:21]
  assign io_Out_1_bits_data = data_out[63:0]; // @[GepNode.scala 933:25]
  assign io_baseAddress_ready = ~ base_addr_valid_R; // @[GepNode.scala 905:24]
  assign io_idx_0_ready = ~ idx_valid_R_0; // @[GepNode.scala 912:21]
  assign _GEN_58 = _T_16 == 1'h0; // @[GepNode.scala 965:17]
  assign _GEN_59 = _GEN_58 & state; // @[GepNode.scala 965:17]
  assign _GEN_60 = _GEN_59 & _T_28; // @[GepNode.scala 965:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_ready_R_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_valid_R_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  cycleCount = _RAND_7[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  base_addr_R_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  base_addr_valid_R = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {2{`RANDOM}};
  idx_R_0_data = _RAND_10[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  idx_valid_R_0 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  state = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_4) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_4) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_16) begin
      if (_T_4) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_28) begin
        enable_valid_R <= 1'h0;
      end else if (_T_4) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_4) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_16) begin
      if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_28) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_1) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_ready_R_1 <= 1'h0;
    end else if (_T_16) begin
      if (_T_2) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (state) begin
      if (_T_28) begin
        out_ready_R_1 <= 1'h0;
      end else if (_T_2) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (_T_2) begin
      out_ready_R_1 <= io_Out_1_ready;
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
      out_valid_R_1 <= 1'h0;
    end else if (_T_16) begin
      if (_T_18) begin
        out_valid_R_1 <= _T_22;
      end else if (_T_2) begin
        out_valid_R_1 <= 1'h0;
      end
    end else if (_T_2) begin
      out_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_7;
    end
    if (reset) begin
      base_addr_R_data <= 64'h0;
    end else if (_T_16) begin
      if (_T_12) begin
        base_addr_R_data <= io_baseAddress_bits_data;
      end
    end else if (state) begin
      if (_T_28) begin
        base_addr_R_data <= 64'h0;
      end else if (_T_12) begin
        base_addr_R_data <= io_baseAddress_bits_data;
      end
    end else if (_T_12) begin
      base_addr_R_data <= io_baseAddress_bits_data;
    end
    if (reset) begin
      base_addr_valid_R <= 1'h0;
    end else if (_T_16) begin
      base_addr_valid_R <= _GEN_11;
    end else if (state) begin
      if (_T_28) begin
        base_addr_valid_R <= 1'h0;
      end else begin
        base_addr_valid_R <= _GEN_11;
      end
    end else begin
      base_addr_valid_R <= _GEN_11;
    end
    if (reset) begin
      idx_R_0_data <= 64'h0;
    end else if (_T_16) begin
      if (_T_14) begin
        idx_R_0_data <= io_idx_0_bits_data;
      end
    end else if (state) begin
      if (_T_28) begin
        idx_R_0_data <= 64'h0;
      end else if (_T_14) begin
        idx_R_0_data <= io_idx_0_bits_data;
      end
    end else if (_T_14) begin
      idx_R_0_data <= io_idx_0_bits_data;
    end
    if (reset) begin
      idx_valid_R_0 <= 1'h0;
    end else if (_T_16) begin
      idx_valid_R_0 <= _GEN_15;
    end else if (state) begin
      if (_T_28) begin
        idx_valid_R_0 <= 1'h0;
      end else begin
        idx_valid_R_0 <= _GEN_15;
      end
    end else begin
      idx_valid_R_0 <= _GEN_15;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_16) begin
      state <= _GEN_18;
    end else if (state) begin
      if (_T_28) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_60 & _T_32) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [GEP] Gep_arrayidx5: Output fired @ %d, Value: %d\n",enable_R_taskID,cycleCount,data_out); // @[GepNode.scala 965:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UnTypLoad_1(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [63:0] io_Out_0_bits_data,
  output        io_GepAddr_ready,
  input         io_GepAddr_valid,
  input         io_GepAddr_bits_predicate,
  input  [63:0] io_GepAddr_bits_data,
  input         io_memReq_ready,
  output        io_memReq_valid,
  output [63:0] io_memReq_bits_address,
  input         io_memResp_valid,
  input  [63:0] io_memResp_data
);
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 519:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 531:28]
  reg [31:0] _RAND_3;
  reg  out_valid_R_0; // @[HandShaking.scala 532:28]
  reg [31:0] _RAND_4;
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire  _T_6; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_5;
  wire [14:0] _T_9; // @[Counter.scala 38:22]
  reg  addr_R_predicate; // @[LoadSimple.scala 64:23]
  reg [31:0] _RAND_6;
  reg [63:0] addr_R_data; // @[LoadSimple.scala 64:23]
  reg [63:0] _RAND_7;
  reg  addr_valid_R; // @[LoadSimple.scala 65:29]
  reg [31:0] _RAND_8;
  reg [63:0] data_R_data; // @[LoadSimple.scala 68:23]
  reg [63:0] _RAND_9;
  reg [1:0] state; // @[LoadSimple.scala 73:22]
  reg [31:0] _RAND_10;
  wire  _T_14; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[LoadSimple.scala 82:27]
  wire  complete; // @[HandShaking.scala 649:29]
  wire  predicate; // @[LoadSimple.scala 92:36]
  wire  _T_19; // @[Conditional.scala 37:30]
  wire  _T_20; // @[LoadSimple.scala 118:27]
  wire  _T_21; // @[LoadSimple.scala 119:31]
  wire  _T_22; // @[Decoupled.scala 40:37]
  wire  _T_23; // @[LoadSimple.scala 127:21]
  wire  _T_24; // @[LoadSimple.scala 127:21]
  wire  _T_27; // @[HandShaking.scala 653:72]
  wire  _GEN_17; // @[LoadSimple.scala 118:44]
  wire  _T_28; // @[Conditional.scala 37:30]
  wire  _T_34; // @[Conditional.scala 37:30]
  wire  _GEN_52; // @[LoadSimple.scala 127:21]
  wire  _GEN_53; // @[LoadSimple.scala 127:21]
  wire  _GEN_54; // @[LoadSimple.scala 127:21]
  wire  _GEN_55; // @[LoadSimple.scala 155:17]
  wire  _GEN_56; // @[LoadSimple.scala 155:17]
  wire  _GEN_57; // @[LoadSimple.scala 155:17]
  wire  _GEN_59; // @[LoadSimple.scala 167:17]
  wire  _GEN_60; // @[LoadSimple.scala 167:17]
  wire  _GEN_61; // @[LoadSimple.scala 167:17]
  wire  _GEN_62; // @[LoadSimple.scala 167:17]
  assign _T_4 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_14 = io_GepAddr_ready & io_GepAddr_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_14 | addr_valid_R; // @[LoadSimple.scala 82:27]
  assign complete = out_ready_R_0 | io_Out_0_ready; // @[HandShaking.scala 649:29]
  assign predicate = addr_R_predicate & enable_R_control; // @[LoadSimple.scala 92:36]
  assign _T_19 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_20 = enable_valid_R & addr_valid_R; // @[LoadSimple.scala 118:27]
  assign _T_21 = enable_R_control & predicate; // @[LoadSimple.scala 119:31]
  assign _T_22 = io_memReq_ready & io_memReq_valid; // @[Decoupled.scala 40:37]
  assign _T_23 = $unsigned(reset); // @[LoadSimple.scala 127:21]
  assign _T_24 = _T_23 == 1'h0; // @[LoadSimple.scala 127:21]
  assign _T_27 = _T_4 ^ 1'h1; // @[HandShaking.scala 653:72]
  assign _GEN_17 = _T_20 & _T_21; // @[LoadSimple.scala 118:44]
  assign _T_28 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_34 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 576:19]
  assign io_Out_0_valid = out_valid_R_0; // @[HandShaking.scala 556:21]
  assign io_Out_0_bits_data = data_R_data; // @[LoadSimple.scala 98:20]
  assign io_GepAddr_ready = ~ addr_valid_R; // @[LoadSimple.scala 81:20]
  assign io_memReq_valid = _T_19 & _GEN_17; // @[LoadSimple.scala 101:19 LoadSimple.scala 121:27]
  assign io_memReq_bits_address = addr_R_data; // @[LoadSimple.scala 102:26]
  assign _GEN_52 = _T_19 & _T_20; // @[LoadSimple.scala 127:21]
  assign _GEN_53 = _GEN_52 & _T_21; // @[LoadSimple.scala 127:21]
  assign _GEN_54 = _GEN_53 & _T_22; // @[LoadSimple.scala 127:21]
  assign _GEN_55 = _T_19 == 1'h0; // @[LoadSimple.scala 155:17]
  assign _GEN_56 = _GEN_55 & _T_28; // @[LoadSimple.scala 155:17]
  assign _GEN_57 = _GEN_56 & io_memResp_valid; // @[LoadSimple.scala 155:17]
  assign _GEN_59 = _T_28 == 1'h0; // @[LoadSimple.scala 167:17]
  assign _GEN_60 = _GEN_55 & _GEN_59; // @[LoadSimple.scala 167:17]
  assign _GEN_61 = _GEN_60 & _T_34; // @[LoadSimple.scala 167:17]
  assign _GEN_62 = _GEN_61 & complete; // @[LoadSimple.scala 167:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  cycleCount = _RAND_5[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr_R_predicate = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  addr_R_data = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  addr_valid_R = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  data_R_data = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_6) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_6) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_19) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_28) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_34) begin
      if (complete) begin
        enable_valid_R <= 1'h0;
      end else if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_6) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_19) begin
      if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_28) begin
      if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_34) begin
      if (complete) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_4) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_4) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (_T_21) begin
          if (_T_4) begin
            out_valid_R_0 <= 1'h0;
          end
        end else begin
          out_valid_R_0 <= _T_27;
        end
      end else if (_T_4) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        out_valid_R_0 <= _T_27;
      end else if (_T_4) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_4) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_9;
    end
    if (reset) begin
      addr_R_predicate <= 1'h0;
    end else if (_T_14) begin
      addr_R_predicate <= io_GepAddr_bits_predicate;
    end
    if (reset) begin
      addr_R_data <= 64'h0;
    end else if (_T_14) begin
      addr_R_data <= io_GepAddr_bits_data;
    end
    if (reset) begin
      addr_valid_R <= 1'h0;
    end else if (_T_19) begin
      addr_valid_R <= _GEN_9;
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        addr_valid_R <= 1'h0;
      end else begin
        addr_valid_R <= _GEN_9;
      end
    end else begin
      addr_valid_R <= _GEN_9;
    end
    if (reset) begin
      data_R_data <= 64'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (!(_T_21)) begin
          data_R_data <= 64'h0;
        end
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        data_R_data <= io_memResp_data;
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_19) begin
      if (_T_20) begin
        if (_T_21) begin
          if (_T_22) begin
            state <= 2'h1;
          end
        end else begin
          state <= 2'h2;
        end
      end
    end else if (_T_28) begin
      if (io_memResp_valid) begin
        state <= 2'h2;
      end
    end else if (_T_34) begin
      if (complete) begin
        state <= 2'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_54 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_6: Memreq fired @ %d, Addr:%d\n",enable_R_taskID,cycleCount,io_memReq_bits_address); // @[LoadSimple.scala 127:21]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_6: Memresp fired @ %d, Value: %d\n",enable_R_taskID,cycleCount,io_memResp_data); // @[LoadSimple.scala 155:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_62 & _T_24) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [LOAD] ld_6: Output fired @ %d, Address:%d, Value: %d\n",enable_R_taskID,cycleCount,addr_R_data,data_R_data); // @[LoadSimple.scala 167:17]
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
  wire [18:0] _T_9; // @[Alu.scala 184:47]
  wire [524350:0] _GEN_0; // @[Alu.scala 184:38]
  wire [524350:0] _T_10; // @[Alu.scala 184:38]
  assign _T_9 = io_in2[18:0]; // @[Alu.scala 184:47]
  assign _GEN_0 = {{524287'd0}, io_in1}; // @[Alu.scala 184:38]
  assign _T_10 = _GEN_0 << _T_9; // @[Alu.scala 184:38]
  assign io_out = _T_10[63:0]; // @[Alu.scala 236:10]
endmodule
module ComputeNode(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [63:0] io_Out_0_bits_data,
  output        io_LeftIO_ready,
  input         io_LeftIO_valid,
  input  [63:0] io_LeftIO_bits_data,
  output        io_RightIO_ready,
  input         io_RightIO_valid
);
  wire [63:0] FU_io_in1; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_in2; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_out; // @[ComputeNode.scala 52:18]
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_3;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_4;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_3; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_5;
  wire [14:0] _T_6; // @[Counter.scala 38:22]
  reg [63:0] left_R_data; // @[ComputeNode.scala 44:23]
  reg [63:0] _RAND_6;
  reg  left_valid_R; // @[ComputeNode.scala 45:29]
  reg [31:0] _RAND_7;
  reg [63:0] right_R_data; // @[ComputeNode.scala 48:24]
  reg [63:0] _RAND_8;
  reg  right_valid_R; // @[ComputeNode.scala 49:30]
  reg [31:0] _RAND_9;
  reg  state; // @[ComputeNode.scala 55:22]
  reg [31:0] _RAND_10;
  reg [63:0] out_data_R; // @[ComputeNode.scala 59:27]
  reg [63:0] _RAND_11;
  wire [4:0] taskID; // @[ComputeNode.scala 61:19]
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
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ComputeNode.scala 61:19]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  cycleCount = _RAND_5[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  left_R_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  left_valid_R = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  right_R_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  right_valid_R = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  out_data_R = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_3) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
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
      right_R_data <= 64'h1;
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
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [COMPUTE] binaryOp_mul7: Output fired @ %d, Value: %d (%d + %d)\n",taskID,cycleCount,FU_io_out,left_R_data,right_R_data); // @[ComputeNode.scala 104:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UnTypStore(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  output        io_GepAddr_ready,
  input         io_GepAddr_valid,
  input  [63:0] io_GepAddr_bits_data,
  output        io_inData_ready,
  input         io_inData_valid,
  input  [63:0] io_inData_bits_data,
  input         io_memReq_ready,
  output        io_memReq_valid,
  output [53:0] io_memReq_bits_address,
  output [63:0] io_memReq_bits_data,
  input         io_memResp_valid
);
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 518:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 519:31]
  reg [31:0] _RAND_2;
  wire  _T_6; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_3;
  wire [14:0] _T_9; // @[Counter.scala 38:22]
  reg [63:0] addr_R_data; // @[StoreSimple.scala 62:23]
  reg [63:0] _RAND_4;
  reg [63:0] data_R_data; // @[StoreSimple.scala 63:23]
  reg [63:0] _RAND_5;
  reg  addr_valid_R; // @[StoreSimple.scala 64:29]
  reg [31:0] _RAND_6;
  reg  data_valid_R; // @[StoreSimple.scala 65:29]
  reg [31:0] _RAND_7;
  reg [1:0] state; // @[StoreSimple.scala 69:22]
  reg [31:0] _RAND_8;
  wire  _T_16; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[StoreSimple.scala 90:27]
  wire  _T_18; // @[Decoupled.scala 40:37]
  wire  _GEN_13; // @[StoreSimple.scala 98:26]
  wire  mem_req_fire; // @[StoreSimple.scala 121:51]
  wire  _T_27; // @[Conditional.scala 37:30]
  wire  _T_28; // @[StoreSimple.scala 127:27]
  wire  _T_29; // @[StoreSimple.scala 128:33]
  wire  _T_30; // @[Decoupled.scala 40:37]
  wire  _GEN_19; // @[StoreSimple.scala 127:44]
  wire  _GEN_23; // @[StoreSimple.scala 126:28]
  wire  _T_33; // @[Conditional.scala 37:30]
  wire  _T_36; // @[Conditional.scala 37:30]
  wire  _T_40; // @[StoreSimple.scala 163:17]
  wire  _T_41; // @[StoreSimple.scala 163:17]
  wire  _GEN_76; // @[StoreSimple.scala 163:17]
  wire  _GEN_77; // @[StoreSimple.scala 163:17]
  wire  _GEN_78; // @[StoreSimple.scala 163:17]
  wire  _GEN_79; // @[StoreSimple.scala 163:17]
  assign _T_6 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign _T_16 = io_GepAddr_ready & io_GepAddr_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_16 | addr_valid_R; // @[StoreSimple.scala 90:27]
  assign _T_18 = io_inData_ready & io_inData_valid; // @[Decoupled.scala 40:37]
  assign _GEN_13 = _T_18 | data_valid_R; // @[StoreSimple.scala 98:26]
  assign mem_req_fire = addr_valid_R & data_valid_R; // @[StoreSimple.scala 121:51]
  assign _T_27 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_28 = data_valid_R & addr_valid_R; // @[StoreSimple.scala 127:27]
  assign _T_29 = enable_R_control & mem_req_fire; // @[StoreSimple.scala 128:33]
  assign _T_30 = io_memReq_ready & io_memReq_valid; // @[Decoupled.scala 40:37]
  assign _GEN_19 = _T_28 & _T_29; // @[StoreSimple.scala 127:44]
  assign _GEN_23 = enable_valid_R & _GEN_19; // @[StoreSimple.scala 126:28]
  assign _T_33 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_36 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_40 = $unsigned(reset); // @[StoreSimple.scala 163:17]
  assign _T_41 = _T_40 == 1'h0; // @[StoreSimple.scala 163:17]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 576:19]
  assign io_GepAddr_ready = ~ addr_valid_R; // @[StoreSimple.scala 85:20 StoreSimple.scala 89:20]
  assign io_inData_ready = ~ data_valid_R; // @[StoreSimple.scala 86:19]
  assign io_memReq_valid = _T_27 & _GEN_23; // @[StoreSimple.scala 116:19 StoreSimple.scala 129:29]
  assign io_memReq_bits_address = addr_R_data[53:0]; // @[StoreSimple.scala 110:26]
  assign io_memReq_bits_data = data_R_data; // @[StoreSimple.scala 111:23]
  assign _GEN_76 = _T_27 == 1'h0; // @[StoreSimple.scala 163:17]
  assign _GEN_77 = _T_33 == 1'h0; // @[StoreSimple.scala 163:17]
  assign _GEN_78 = _GEN_76 & _GEN_77; // @[StoreSimple.scala 163:17]
  assign _GEN_79 = _GEN_78 & _T_36; // @[StoreSimple.scala 163:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  cycleCount = _RAND_3[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  addr_R_data = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  data_R_data = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr_valid_R = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  data_valid_R = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  state = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_6) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_6) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_27) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_33) begin
      if (_T_6) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_36) begin
      enable_valid_R <= 1'h0;
    end else if (_T_6) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_9;
    end
    if (reset) begin
      addr_R_data <= 64'h0;
    end else if (_T_27) begin
      if (_T_16) begin
        addr_R_data <= io_GepAddr_bits_data;
      end
    end else if (_T_33) begin
      if (_T_16) begin
        addr_R_data <= io_GepAddr_bits_data;
      end
    end else if (_T_36) begin
      addr_R_data <= 64'h0;
    end else if (_T_16) begin
      addr_R_data <= io_GepAddr_bits_data;
    end
    if (reset) begin
      data_R_data <= 64'h0;
    end else if (_T_27) begin
      if (_T_18) begin
        data_R_data <= io_inData_bits_data;
      end
    end else if (_T_33) begin
      if (_T_18) begin
        data_R_data <= io_inData_bits_data;
      end
    end else if (_T_36) begin
      data_R_data <= 64'h0;
    end else if (_T_18) begin
      data_R_data <= io_inData_bits_data;
    end
    if (reset) begin
      addr_valid_R <= 1'h0;
    end else if (_T_27) begin
      addr_valid_R <= _GEN_9;
    end else if (_T_33) begin
      addr_valid_R <= _GEN_9;
    end else if (_T_36) begin
      addr_valid_R <= 1'h0;
    end else begin
      addr_valid_R <= _GEN_9;
    end
    if (reset) begin
      data_valid_R <= 1'h0;
    end else if (_T_27) begin
      data_valid_R <= _GEN_13;
    end else if (_T_33) begin
      data_valid_R <= _GEN_13;
    end else if (_T_36) begin
      data_valid_R <= 1'h0;
    end else begin
      data_valid_R <= _GEN_13;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_27) begin
      if (enable_valid_R) begin
        if (_T_28) begin
          if (_T_29) begin
            if (_T_30) begin
              state <= 2'h1;
            end
          end else begin
            state <= 2'h2;
          end
        end
      end
    end else if (_T_33) begin
      if (io_memResp_valid) begin
        state <= 2'h2;
      end
    end else if (_T_36) begin
      state <= 2'h0;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_79 & _T_41) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [STORE]st_8: Fired @ %d Mem[%d] = %d\n",enable_R_taskID,cycleCount,addr_R_data,data_R_data); // @[StoreSimple.scala 163:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UALU_1(
  input  [63:0] io_in1,
  input  [63:0] io_in2,
  output [63:0] io_out
);
  assign io_out = io_in1 + io_in2; // @[Alu.scala 236:10]
endmodule
module ComputeNode_1(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [4:0]  io_Out_0_bits_taskID,
  output [63:0] io_Out_0_bits_data,
  input         io_Out_1_ready,
  output        io_Out_1_valid,
  output [63:0] io_Out_1_bits_data,
  output        io_LeftIO_ready,
  input         io_LeftIO_valid,
  input  [63:0] io_LeftIO_bits_data,
  output        io_RightIO_ready,
  input         io_RightIO_valid
);
  wire [63:0] FU_io_in1; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_in2; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_out; // @[ComputeNode.scala 52:18]
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_3;
  reg  out_ready_R_1; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_4;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_5;
  reg  out_valid_R_1; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_6;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_2; // @[Decoupled.scala 40:37]
  wire  _T_4; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_7;
  wire [14:0] _T_7; // @[Counter.scala 38:22]
  reg [63:0] left_R_data; // @[ComputeNode.scala 44:23]
  reg [63:0] _RAND_8;
  reg  left_valid_R; // @[ComputeNode.scala 45:29]
  reg [31:0] _RAND_9;
  reg [63:0] right_R_data; // @[ComputeNode.scala 48:24]
  reg [63:0] _RAND_10;
  reg  right_valid_R; // @[ComputeNode.scala 49:30]
  reg [31:0] _RAND_11;
  reg  state; // @[ComputeNode.scala 55:22]
  reg [31:0] _RAND_12;
  reg [63:0] out_data_R; // @[ComputeNode.scala 59:27]
  reg [63:0] _RAND_13;
  wire [4:0] taskID; // @[ComputeNode.scala 61:19]
  wire  _T_13; // @[Decoupled.scala 40:37]
  wire  _GEN_11; // @[ComputeNode.scala 71:26]
  wire  _T_15; // @[Decoupled.scala 40:37]
  wire  _GEN_15; // @[ComputeNode.scala 77:27]
  wire  _T_18; // @[Conditional.scala 37:30]
  wire  _T_19; // @[ComputeNode.scala 96:27]
  wire  _T_20; // @[ComputeNode.scala 96:43]
  wire  _T_25; // @[HandShaking.scala 233:72]
  wire  _T_26; // @[HandShaking.scala 233:72]
  wire  _T_27; // @[ComputeNode.scala 104:17]
  wire  _T_28; // @[ComputeNode.scala 104:17]
  wire [63:0] _T_21_data; // @[interfaces.scala 306:20 interfaces.scala 307:15]
  wire [63:0] _GEN_16; // @[ComputeNode.scala 96:61]
  wire  _GEN_22; // @[ComputeNode.scala 96:61]
  wire  _GEN_23; // @[ComputeNode.scala 96:61]
  wire  _GEN_28; // @[ComputeNode.scala 96:61]
  wire  _T_32; // @[HandShaking.scala 218:83]
  wire  _T_33; // @[HandShaking.scala 218:83]
  wire  _T_34; // @[HandShaking.scala 219:27]
  wire  _GEN_56; // @[ComputeNode.scala 104:17]
  UALU_1 FU ( // @[ComputeNode.scala 52:18]
    .io_in1(FU_io_in1),
    .io_in2(FU_io_in2),
    .io_out(FU_io_out)
  );
  assign _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_2 = io_Out_1_ready & io_Out_1_valid; // @[Decoupled.scala 40:37]
  assign _T_4 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_7 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ComputeNode.scala 61:19]
  assign _T_13 = io_LeftIO_ready & io_LeftIO_valid; // @[Decoupled.scala 40:37]
  assign _GEN_11 = _T_13 | left_valid_R; // @[ComputeNode.scala 71:26]
  assign _T_15 = io_RightIO_ready & io_RightIO_valid; // @[Decoupled.scala 40:37]
  assign _GEN_15 = _T_15 | right_valid_R; // @[ComputeNode.scala 77:27]
  assign _T_18 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_19 = enable_valid_R & left_valid_R; // @[ComputeNode.scala 96:27]
  assign _T_20 = _T_19 & right_valid_R; // @[ComputeNode.scala 96:43]
  assign _T_25 = _T_1 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _T_26 = _T_2 ^ 1'h1; // @[HandShaking.scala 233:72]
  assign _T_27 = $unsigned(reset); // @[ComputeNode.scala 104:17]
  assign _T_28 = _T_27 == 1'h0; // @[ComputeNode.scala 104:17]
  assign _T_21_data = FU_io_out; // @[interfaces.scala 306:20 interfaces.scala 307:15]
  assign _GEN_16 = _T_20 ? _T_21_data : out_data_R; // @[ComputeNode.scala 96:61]
  assign _GEN_22 = _T_20 | out_valid_R_0; // @[ComputeNode.scala 96:61]
  assign _GEN_23 = _T_20 | out_valid_R_1; // @[ComputeNode.scala 96:61]
  assign _GEN_28 = _T_20 | state; // @[ComputeNode.scala 96:61]
  assign _T_32 = out_ready_R_0 | _T_1; // @[HandShaking.scala 218:83]
  assign _T_33 = out_ready_R_1 | _T_2; // @[HandShaking.scala 218:83]
  assign _T_34 = _T_32 & _T_33; // @[HandShaking.scala 219:27]
  assign io_enable_ready = ~ enable_valid_R; // @[HandShaking.scala 192:19]
  assign io_Out_0_valid = _T_18 ? _GEN_22 : out_valid_R_0; // @[HandShaking.scala 181:21 ComputeNode.scala 98:32]
  assign io_Out_0_bits_taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ComputeNode.scala 89:25 ComputeNode.scala 97:31]
  assign io_Out_0_bits_data = _T_18 ? _GEN_16 : out_data_R; // @[ComputeNode.scala 89:25 ComputeNode.scala 97:31]
  assign io_Out_1_valid = _T_18 ? _GEN_23 : out_valid_R_1; // @[HandShaking.scala 181:21 ComputeNode.scala 98:32]
  assign io_Out_1_bits_data = _T_18 ? _GEN_16 : out_data_R; // @[ComputeNode.scala 89:25 ComputeNode.scala 97:31]
  assign io_LeftIO_ready = ~ left_valid_R; // @[ComputeNode.scala 70:19]
  assign io_RightIO_ready = ~ right_valid_R; // @[ComputeNode.scala 76:20]
  assign FU_io_in1 = left_R_data; // @[ComputeNode.scala 67:13]
  assign FU_io_in2 = right_R_data; // @[ComputeNode.scala 68:13]
  assign _GEN_56 = _T_18 & _T_20; // @[ComputeNode.scala 104:17]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_ready_R_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_valid_R_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  cycleCount = _RAND_7[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  left_R_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  left_valid_R = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {2{`RANDOM}};
  right_R_data = _RAND_10[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  right_valid_R = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  state = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{`RANDOM}};
  out_data_R = _RAND_13[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_4) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_4) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_18) begin
      if (_T_4) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (state) begin
      if (_T_34) begin
        enable_valid_R <= 1'h0;
      end else if (_T_4) begin
        enable_valid_R <= io_enable_valid;
      end
    end else if (_T_4) begin
      enable_valid_R <= io_enable_valid;
    end
    if (reset) begin
      out_ready_R_0 <= 1'h0;
    end else if (_T_18) begin
      if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (state) begin
      if (_T_34) begin
        out_ready_R_0 <= 1'h0;
      end else if (_T_1) begin
        out_ready_R_0 <= io_Out_0_ready;
      end
    end else if (_T_1) begin
      out_ready_R_0 <= io_Out_0_ready;
    end
    if (reset) begin
      out_ready_R_1 <= 1'h0;
    end else if (_T_18) begin
      if (_T_2) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (state) begin
      if (_T_34) begin
        out_ready_R_1 <= 1'h0;
      end else if (_T_2) begin
        out_ready_R_1 <= io_Out_1_ready;
      end
    end else if (_T_2) begin
      out_ready_R_1 <= io_Out_1_ready;
    end
    if (reset) begin
      out_valid_R_0 <= 1'h0;
    end else if (_T_18) begin
      if (_T_20) begin
        out_valid_R_0 <= _T_25;
      end else if (_T_1) begin
        out_valid_R_0 <= 1'h0;
      end
    end else if (_T_1) begin
      out_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      out_valid_R_1 <= 1'h0;
    end else if (_T_18) begin
      if (_T_20) begin
        out_valid_R_1 <= _T_26;
      end else if (_T_2) begin
        out_valid_R_1 <= 1'h0;
      end
    end else if (_T_2) begin
      out_valid_R_1 <= 1'h0;
    end
    if (reset) begin
      cycleCount <= 15'h0;
    end else begin
      cycleCount <= _T_7;
    end
    if (reset) begin
      left_R_data <= 64'h0;
    end else if (_T_13) begin
      left_R_data <= io_LeftIO_bits_data;
    end
    if (reset) begin
      left_valid_R <= 1'h0;
    end else if (_T_18) begin
      if (_T_20) begin
        left_valid_R <= 1'h0;
      end else begin
        left_valid_R <= _GEN_11;
      end
    end else begin
      left_valid_R <= _GEN_11;
    end
    if (reset) begin
      right_R_data <= 64'h0;
    end else if (_T_15) begin
      right_R_data <= 64'h1;
    end
    if (reset) begin
      right_valid_R <= 1'h0;
    end else if (_T_18) begin
      if (_T_20) begin
        right_valid_R <= 1'h0;
      end else begin
        right_valid_R <= _GEN_15;
      end
    end else begin
      right_valid_R <= _GEN_15;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_18) begin
      state <= _GEN_28;
    end else if (state) begin
      if (_T_34) begin
        state <= 1'h0;
      end
    end
    if (reset) begin
      out_data_R <= 64'h0;
    end else if (_T_18) begin
      if (enable_R_control) begin
        out_data_R <= FU_io_out;
      end else begin
        out_data_R <= 64'h0;
      end
    end else if (state) begin
      if (_T_34) begin
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
        if (_GEN_56 & _T_28) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [COMPUTE] binaryOp_indvars_iv_next9: Output fired @ %d, Value: %d (%d + %d)\n",taskID,cycleCount,FU_io_out,left_R_data,right_R_data); // @[ComputeNode.scala 104:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UALU_2(
  input  [63:0] io_in1,
  input  [63:0] io_in2,
  output [63:0] io_out
);
  wire  _T_21; // @[Alu.scala 190:38]
  assign _T_21 = io_in1 == io_in2; // @[Alu.scala 190:38]
  assign io_out = {{63'd0}, _T_21}; // @[Alu.scala 236:10]
endmodule
module ComputeNode_2(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  input         io_Out_0_ready,
  output        io_Out_0_valid,
  output [4:0]  io_Out_0_bits_taskID,
  output [63:0] io_Out_0_bits_data,
  output        io_LeftIO_ready,
  input         io_LeftIO_valid,
  input  [63:0] io_LeftIO_bits_data,
  output        io_RightIO_ready,
  input         io_RightIO_valid
);
  wire [63:0] FU_io_in1; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_in2; // @[ComputeNode.scala 52:18]
  wire [63:0] FU_io_out; // @[ComputeNode.scala 52:18]
  reg [4:0] enable_R_taskID; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_0;
  reg  enable_R_control; // @[HandShaking.scala 168:31]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[HandShaking.scala 169:31]
  reg [31:0] _RAND_2;
  reg  out_ready_R_0; // @[HandShaking.scala 172:46]
  reg [31:0] _RAND_3;
  reg  out_valid_R_0; // @[HandShaking.scala 173:46]
  reg [31:0] _RAND_4;
  wire  _T_1; // @[Decoupled.scala 40:37]
  wire  _T_3; // @[Decoupled.scala 40:37]
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_5;
  wire [14:0] _T_6; // @[Counter.scala 38:22]
  reg [63:0] left_R_data; // @[ComputeNode.scala 44:23]
  reg [63:0] _RAND_6;
  reg  left_valid_R; // @[ComputeNode.scala 45:29]
  reg [31:0] _RAND_7;
  reg [63:0] right_R_data; // @[ComputeNode.scala 48:24]
  reg [63:0] _RAND_8;
  reg  right_valid_R; // @[ComputeNode.scala 49:30]
  reg [31:0] _RAND_9;
  reg  state; // @[ComputeNode.scala 55:22]
  reg [31:0] _RAND_10;
  reg [63:0] out_data_R; // @[ComputeNode.scala 59:27]
  reg [63:0] _RAND_11;
  wire [4:0] taskID; // @[ComputeNode.scala 61:19]
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
  UALU_2 FU ( // @[ComputeNode.scala 52:18]
    .io_in1(FU_io_in1),
    .io_in2(FU_io_in2),
    .io_out(FU_io_out)
  );
  assign _T_1 = io_Out_0_ready & io_Out_0_valid; // @[Decoupled.scala 40:37]
  assign _T_3 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ComputeNode.scala 61:19]
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
  assign io_Out_0_bits_taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ComputeNode.scala 89:25 ComputeNode.scala 97:31]
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
  enable_R_taskID = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enable_R_control = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_ready_R_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_valid_R_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  cycleCount = _RAND_5[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  left_R_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  left_valid_R = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  right_R_data = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  right_valid_R = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  out_data_R = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_3) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
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
      right_R_data <= 64'ha;
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
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [COMPUTE] icmp_exitcond10: Output fired @ %d, Value: %d (%d + %d)\n",taskID,cycleCount,FU_io_out,left_R_data,right_R_data); // @[ComputeNode.scala 104:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module CBranchNodeVariable(
  input         clock,
  input         reset,
  output        io_enable_ready,
  input         io_enable_valid,
  input  [4:0]  io_enable_bits_taskID,
  input         io_enable_bits_control,
  output        io_CmpIO_ready,
  input         io_CmpIO_valid,
  input  [4:0]  io_CmpIO_bits_taskID,
  input  [63:0] io_CmpIO_bits_data,
  input         io_TrueOutput_0_ready,
  output        io_TrueOutput_0_valid,
  output        io_TrueOutput_0_bits_control,
  input         io_FalseOutput_0_ready,
  output        io_FalseOutput_0_valid,
  output [4:0]  io_FalseOutput_0_bits_taskID,
  output        io_FalseOutput_0_bits_control
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] cmp_R_taskID; // @[BranchNode.scala 1194:22]
  reg [31:0] _RAND_1;
  reg  cmp_R_control; // @[BranchNode.scala 1194:22]
  reg [31:0] _RAND_2;
  reg  cmp_valid; // @[BranchNode.scala 1195:26]
  reg [31:0] _RAND_3;
  reg [4:0] enable_R_taskID; // @[BranchNode.scala 1198:25]
  reg [31:0] _RAND_4;
  reg  enable_R_control; // @[BranchNode.scala 1198:25]
  reg [31:0] _RAND_5;
  reg  enable_valid_R; // @[BranchNode.scala 1199:31]
  reg [31:0] _RAND_6;
  reg  output_true_R_control; // @[BranchNode.scala 1205:30]
  reg [31:0] _RAND_7;
  reg  output_true_valid_R_0; // @[BranchNode.scala 1206:54]
  reg [31:0] _RAND_8;
  reg  fire_true_R_0; // @[BranchNode.scala 1207:46]
  reg [31:0] _RAND_9;
  reg [4:0] output_false_R_taskID; // @[BranchNode.scala 1209:31]
  reg [31:0] _RAND_10;
  reg  output_false_R_control; // @[BranchNode.scala 1209:31]
  reg [31:0] _RAND_11;
  reg  output_false_valid_R_0; // @[BranchNode.scala 1210:56]
  reg [31:0] _RAND_12;
  reg  fire_false_R_0; // @[BranchNode.scala 1211:48]
  reg [31:0] _RAND_13;
  wire [4:0] task_id; // @[BranchNode.scala 1213:33]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_10; // @[BranchNode.scala 1219:44]
  wire  _GEN_3; // @[BranchNode.scala 1218:23]
  wire  _T_12; // @[Decoupled.scala 40:37]
  wire  _GEN_6; // @[BranchNode.scala 1244:24]
  wire  predicate; // @[BranchNode.scala 1250:36]
  wire  true_output; // @[BranchNode.scala 1251:31]
  wire  _T_13; // @[BranchNode.scala 1252:35]
  wire  false_output; // @[BranchNode.scala 1252:32]
  wire  _T_15; // @[Decoupled.scala 40:37]
  wire  _GEN_7; // @[BranchNode.scala 1265:33]
  wire  _GEN_8; // @[BranchNode.scala 1265:33]
  wire  _T_16; // @[Decoupled.scala 40:37]
  wire  _GEN_9; // @[BranchNode.scala 1283:34]
  wire  _GEN_10; // @[BranchNode.scala 1283:34]
  reg  state; // @[BranchNode.scala 1295:22]
  reg [31:0] _RAND_14;
  wire  _T_17; // @[Conditional.scala 37:30]
  wire  _T_18; // @[BranchNode.scala 1301:27]
  wire  _T_20; // @[BranchNode.scala 1311:21]
  wire  _T_21; // @[BranchNode.scala 1311:21]
  wire  _GEN_11; // @[BranchNode.scala 1301:65]
  wire  _GEN_12; // @[BranchNode.scala 1301:65]
  wire  _GEN_13; // @[BranchNode.scala 1301:65]
  wire  _T_27; // @[BranchNode.scala 1335:27]
  wire  _GEN_59; // @[BranchNode.scala 1311:21]
  wire  _GEN_60; // @[BranchNode.scala 1311:21]
  wire  _GEN_62; // @[BranchNode.scala 1325:19]
  wire  _GEN_63; // @[BranchNode.scala 1325:19]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign task_id = enable_R_taskID | cmp_R_taskID; // @[BranchNode.scala 1213:33]
  assign _T_9 = io_CmpIO_ready & io_CmpIO_valid; // @[Decoupled.scala 40:37]
  assign _T_10 = io_CmpIO_bits_data != 64'h0; // @[BranchNode.scala 1219:44]
  assign _GEN_3 = _T_9 | cmp_valid; // @[BranchNode.scala 1218:23]
  assign _T_12 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _GEN_6 = _T_12 | enable_valid_R; // @[BranchNode.scala 1244:24]
  assign predicate = enable_R_control & enable_valid_R; // @[BranchNode.scala 1250:36]
  assign true_output = predicate & cmp_R_control; // @[BranchNode.scala 1251:31]
  assign _T_13 = ~ cmp_R_control; // @[BranchNode.scala 1252:35]
  assign false_output = predicate & _T_13; // @[BranchNode.scala 1252:32]
  assign _T_15 = io_TrueOutput_0_ready & io_TrueOutput_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_7 = _T_15 | fire_true_R_0; // @[BranchNode.scala 1265:33]
  assign _GEN_8 = _T_15 ? 1'h0 : output_true_valid_R_0; // @[BranchNode.scala 1265:33]
  assign _T_16 = io_FalseOutput_0_ready & io_FalseOutput_0_valid; // @[Decoupled.scala 40:37]
  assign _GEN_9 = _T_16 | fire_false_R_0; // @[BranchNode.scala 1283:34]
  assign _GEN_10 = _T_16 ? 1'h0 : output_false_valid_R_0; // @[BranchNode.scala 1283:34]
  assign _T_17 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_18 = enable_valid_R & cmp_valid; // @[BranchNode.scala 1301:27]
  assign _T_20 = $unsigned(reset); // @[BranchNode.scala 1311:21]
  assign _T_21 = _T_20 == 1'h0; // @[BranchNode.scala 1311:21]
  assign _GEN_11 = _T_18 | _GEN_8; // @[BranchNode.scala 1301:65]
  assign _GEN_12 = _T_18 | _GEN_10; // @[BranchNode.scala 1301:65]
  assign _GEN_13 = _T_18 | state; // @[BranchNode.scala 1301:65]
  assign _T_27 = fire_true_R_0 & fire_false_R_0; // @[BranchNode.scala 1335:27]
  assign io_enable_ready = ~ enable_valid_R; // @[BranchNode.scala 1243:19]
  assign io_CmpIO_ready = ~ cmp_valid; // @[BranchNode.scala 1217:18]
  assign io_TrueOutput_0_valid = output_true_valid_R_0; // @[BranchNode.scala 1261:28]
  assign io_TrueOutput_0_bits_control = output_true_R_control; // @[BranchNode.scala 1260:27]
  assign io_FalseOutput_0_valid = output_false_valid_R_0; // @[BranchNode.scala 1279:29]
  assign io_FalseOutput_0_bits_taskID = output_false_R_taskID; // @[BranchNode.scala 1278:28]
  assign io_FalseOutput_0_bits_control = output_false_R_control; // @[BranchNode.scala 1278:28]
  assign _GEN_59 = _T_17 & _T_18; // @[BranchNode.scala 1311:21]
  assign _GEN_60 = _GEN_59 & enable_R_control; // @[BranchNode.scala 1311:21]
  assign _GEN_62 = enable_R_control == 1'h0; // @[BranchNode.scala 1325:19]
  assign _GEN_63 = _GEN_59 & _GEN_62; // @[BranchNode.scala 1325:19]
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
  cmp_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cmp_R_control = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  cmp_valid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enable_R_taskID = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  enable_R_control = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  enable_valid_R = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  output_true_R_control = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  output_true_valid_R_0 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  fire_true_R_0 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  output_false_R_taskID = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  output_false_R_control = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  output_false_valid_R_0 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  fire_false_R_0 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  state = _RAND_14[0:0];
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
      cmp_R_taskID <= 5'h0;
    end else if (_T_17) begin
      if (_T_9) begin
        cmp_R_taskID <= io_CmpIO_bits_taskID;
      end
    end else if (state) begin
      if (_T_27) begin
        cmp_R_taskID <= 5'h0;
      end else if (_T_9) begin
        cmp_R_taskID <= io_CmpIO_bits_taskID;
      end
    end else if (_T_9) begin
      cmp_R_taskID <= io_CmpIO_bits_taskID;
    end
    if (reset) begin
      cmp_R_control <= 1'h0;
    end else if (_T_17) begin
      if (_T_9) begin
        cmp_R_control <= _T_10;
      end
    end else if (state) begin
      if (_T_27) begin
        cmp_R_control <= 1'h0;
      end else if (_T_9) begin
        cmp_R_control <= _T_10;
      end
    end else if (_T_9) begin
      cmp_R_control <= _T_10;
    end
    if (reset) begin
      cmp_valid <= 1'h0;
    end else if (_T_17) begin
      cmp_valid <= _GEN_3;
    end else if (state) begin
      if (_T_27) begin
        cmp_valid <= 1'h0;
      end else begin
        cmp_valid <= _GEN_3;
      end
    end else begin
      cmp_valid <= _GEN_3;
    end
    if (reset) begin
      enable_R_taskID <= 5'h0;
    end else if (_T_17) begin
      if (_T_12) begin
        enable_R_taskID <= io_enable_bits_taskID;
      end
    end else if (state) begin
      if (_T_27) begin
        enable_R_taskID <= 5'h0;
      end else if (_T_12) begin
        enable_R_taskID <= io_enable_bits_taskID;
      end
    end else if (_T_12) begin
      enable_R_taskID <= io_enable_bits_taskID;
    end
    if (reset) begin
      enable_R_control <= 1'h0;
    end else if (_T_17) begin
      if (_T_12) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (state) begin
      if (_T_27) begin
        enable_R_control <= 1'h0;
      end else if (_T_12) begin
        enable_R_control <= io_enable_bits_control;
      end
    end else if (_T_12) begin
      enable_R_control <= io_enable_bits_control;
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_17) begin
      enable_valid_R <= _GEN_6;
    end else if (state) begin
      if (_T_27) begin
        enable_valid_R <= 1'h0;
      end else begin
        enable_valid_R <= _GEN_6;
      end
    end else begin
      enable_valid_R <= _GEN_6;
    end
    if (reset) begin
      output_true_R_control <= 1'h0;
    end else if (_T_17) begin
      output_true_R_control <= true_output;
    end else if (state) begin
      if (_T_27) begin
        output_true_R_control <= 1'h0;
      end else begin
        output_true_R_control <= true_output;
      end
    end else begin
      output_true_R_control <= true_output;
    end
    if (reset) begin
      output_true_valid_R_0 <= 1'h0;
    end else if (_T_17) begin
      output_true_valid_R_0 <= _GEN_11;
    end else if (state) begin
      if (_T_27) begin
        output_true_valid_R_0 <= 1'h0;
      end else if (_T_15) begin
        output_true_valid_R_0 <= 1'h0;
      end
    end else if (_T_15) begin
      output_true_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      fire_true_R_0 <= 1'h0;
    end else if (_T_17) begin
      fire_true_R_0 <= _GEN_7;
    end else if (state) begin
      if (_T_27) begin
        fire_true_R_0 <= 1'h0;
      end else begin
        fire_true_R_0 <= _GEN_7;
      end
    end else begin
      fire_true_R_0 <= _GEN_7;
    end
    if (reset) begin
      output_false_R_taskID <= 5'h0;
    end else if (_T_17) begin
      output_false_R_taskID <= task_id;
    end else if (state) begin
      if (_T_27) begin
        output_false_R_taskID <= 5'h0;
      end else begin
        output_false_R_taskID <= task_id;
      end
    end else begin
      output_false_R_taskID <= task_id;
    end
    if (reset) begin
      output_false_R_control <= 1'h0;
    end else if (_T_17) begin
      output_false_R_control <= false_output;
    end else if (state) begin
      if (_T_27) begin
        output_false_R_control <= 1'h0;
      end else begin
        output_false_R_control <= false_output;
      end
    end else begin
      output_false_R_control <= false_output;
    end
    if (reset) begin
      output_false_valid_R_0 <= 1'h0;
    end else if (_T_17) begin
      output_false_valid_R_0 <= _GEN_12;
    end else if (state) begin
      if (_T_27) begin
        output_false_valid_R_0 <= 1'h0;
      end else if (_T_16) begin
        output_false_valid_R_0 <= 1'h0;
      end
    end else if (_T_16) begin
      output_false_valid_R_0 <= 1'h0;
    end
    if (reset) begin
      fire_false_R_0 <= 1'h0;
    end else if (_T_17) begin
      fire_false_R_0 <= _GEN_9;
    end else if (state) begin
      if (_T_27) begin
        fire_false_R_0 <= 1'h0;
      end else begin
        fire_false_R_0 <= _GEN_9;
      end
    end else begin
      fire_false_R_0 <= _GEN_9;
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_17) begin
      state <= _GEN_13;
    end else if (state) begin
      if (_T_27) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_60 & _T_21) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CBR] br_11: Output fired [T F] @ %d,\n",enable_R_taskID,cycleCount); // @[BranchNode.scala 1311:21]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_63 & _T_21) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CBR] br_11: Output fired [F F] @ %d,\n",enable_R_taskID,cycleCount); // @[BranchNode.scala 1325:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ConstFastNode(
  input        clock,
  input        reset,
  output       io_enable_ready,
  input        io_enable_valid,
  input  [4:0] io_enable_bits_taskID,
  input        io_Out_ready,
  output       io_Out_valid
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] enable_R_taskID; // @[ConstNode.scala 111:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[ConstNode.scala 112:31]
  reg [31:0] _RAND_2;
  wire [4:0] taskID; // @[ConstNode.scala 114:19]
  reg  state; // @[ConstNode.scala 133:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_11; // @[ConstNode.scala 147:17]
  wire  _T_12; // @[ConstNode.scala 147:17]
  wire  _GEN_5; // @[ConstNode.scala 137:30]
  wire  _GEN_23; // @[ConstNode.scala 147:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 114:19]
  assign _T_7 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _T_11 = $unsigned(reset); // @[ConstNode.scala 147:17]
  assign _T_12 = _T_11 == 1'h0; // @[ConstNode.scala 147:17]
  assign _GEN_5 = _T_8 | enable_valid_R; // @[ConstNode.scala 137:30]
  assign io_enable_ready = ~ enable_valid_R; // @[ConstNode.scala 124:19]
  assign io_Out_valid = _T_7 ? _GEN_5 : enable_valid_R; // @[ConstNode.scala 125:16 ConstNode.scala 138:22]
  assign _GEN_23 = _T_7 & _T_8; // @[ConstNode.scala 147:17]
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
  enable_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[0:0];
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
      enable_R_taskID <= 5'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_R_taskID <= io_enable_bits_taskID;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_R_taskID <= 5'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_valid_R <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_valid_R <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (_T_9) begin
          state <= 1'h0;
        end else begin
          state <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & _T_12) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CONST] const0: Output fired @ %d, Value: %d\n",taskID,cycleCount,64'sh9); // @[ConstNode.scala 147:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ConstFastNode_1(
  input        clock,
  input        reset,
  output       io_enable_ready,
  input        io_enable_valid,
  input  [4:0] io_enable_bits_taskID,
  input        io_Out_ready,
  output       io_Out_valid,
  output [4:0] io_Out_bits_taskID
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] enable_R_taskID; // @[ConstNode.scala 111:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[ConstNode.scala 112:31]
  reg [31:0] _RAND_2;
  wire [4:0] taskID; // @[ConstNode.scala 114:19]
  reg  state; // @[ConstNode.scala 133:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_11; // @[ConstNode.scala 147:17]
  wire  _T_12; // @[ConstNode.scala 147:17]
  wire  _GEN_5; // @[ConstNode.scala 137:30]
  wire  _GEN_23; // @[ConstNode.scala 147:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 114:19]
  assign _T_7 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _T_11 = $unsigned(reset); // @[ConstNode.scala 147:17]
  assign _T_12 = _T_11 == 1'h0; // @[ConstNode.scala 147:17]
  assign _GEN_5 = _T_8 | enable_valid_R; // @[ConstNode.scala 137:30]
  assign io_enable_ready = ~ enable_valid_R; // @[ConstNode.scala 124:19]
  assign io_Out_valid = _T_7 ? _GEN_5 : enable_valid_R; // @[ConstNode.scala 125:16 ConstNode.scala 138:22]
  assign io_Out_bits_taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 127:15]
  assign _GEN_23 = _T_7 & _T_8; // @[ConstNode.scala 147:17]
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
  enable_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[0:0];
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
      enable_R_taskID <= 5'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_R_taskID <= io_enable_bits_taskID;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_R_taskID <= 5'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_valid_R <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_valid_R <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (_T_9) begin
          state <= 1'h0;
        end else begin
          state <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & _T_12) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CONST] const1: Output fired @ %d, Value: %d\n",taskID,cycleCount,64'sh0); // @[ConstNode.scala 147:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ConstFastNode_2(
  input        clock,
  input        reset,
  output       io_enable_ready,
  input        io_enable_valid,
  input  [4:0] io_enable_bits_taskID,
  input        io_Out_ready,
  output       io_Out_valid
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] enable_R_taskID; // @[ConstNode.scala 111:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[ConstNode.scala 112:31]
  reg [31:0] _RAND_2;
  wire [4:0] taskID; // @[ConstNode.scala 114:19]
  reg  state; // @[ConstNode.scala 133:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_11; // @[ConstNode.scala 147:17]
  wire  _T_12; // @[ConstNode.scala 147:17]
  wire  _GEN_5; // @[ConstNode.scala 137:30]
  wire  _GEN_23; // @[ConstNode.scala 147:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 114:19]
  assign _T_7 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _T_11 = $unsigned(reset); // @[ConstNode.scala 147:17]
  assign _T_12 = _T_11 == 1'h0; // @[ConstNode.scala 147:17]
  assign _GEN_5 = _T_8 | enable_valid_R; // @[ConstNode.scala 137:30]
  assign io_enable_ready = ~ enable_valid_R; // @[ConstNode.scala 124:19]
  assign io_Out_valid = _T_7 ? _GEN_5 : enable_valid_R; // @[ConstNode.scala 125:16 ConstNode.scala 138:22]
  assign _GEN_23 = _T_7 & _T_8; // @[ConstNode.scala 147:17]
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
  enable_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[0:0];
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
      enable_R_taskID <= 5'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_R_taskID <= io_enable_bits_taskID;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_R_taskID <= 5'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_valid_R <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_valid_R <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (_T_9) begin
          state <= 1'h0;
        end else begin
          state <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & _T_12) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CONST] const2: Output fired @ %d, Value: %d\n",taskID,cycleCount,64'sh1); // @[ConstNode.scala 147:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ConstFastNode_3(
  input        clock,
  input        reset,
  output       io_enable_ready,
  input        io_enable_valid,
  input  [4:0] io_enable_bits_taskID,
  input        io_Out_ready,
  output       io_Out_valid
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] enable_R_taskID; // @[ConstNode.scala 111:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[ConstNode.scala 112:31]
  reg [31:0] _RAND_2;
  wire [4:0] taskID; // @[ConstNode.scala 114:19]
  reg  state; // @[ConstNode.scala 133:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_11; // @[ConstNode.scala 147:17]
  wire  _T_12; // @[ConstNode.scala 147:17]
  wire  _GEN_5; // @[ConstNode.scala 137:30]
  wire  _GEN_23; // @[ConstNode.scala 147:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 114:19]
  assign _T_7 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _T_11 = $unsigned(reset); // @[ConstNode.scala 147:17]
  assign _T_12 = _T_11 == 1'h0; // @[ConstNode.scala 147:17]
  assign _GEN_5 = _T_8 | enable_valid_R; // @[ConstNode.scala 137:30]
  assign io_enable_ready = ~ enable_valid_R; // @[ConstNode.scala 124:19]
  assign io_Out_valid = _T_7 ? _GEN_5 : enable_valid_R; // @[ConstNode.scala 125:16 ConstNode.scala 138:22]
  assign _GEN_23 = _T_7 & _T_8; // @[ConstNode.scala 147:17]
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
  enable_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[0:0];
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
      enable_R_taskID <= 5'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_R_taskID <= io_enable_bits_taskID;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_R_taskID <= 5'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_valid_R <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_valid_R <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (_T_9) begin
          state <= 1'h0;
        end else begin
          state <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & _T_12) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CONST] const3: Output fired @ %d, Value: %d\n",taskID,cycleCount,64'sh1); // @[ConstNode.scala 147:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ConstFastNode_4(
  input        clock,
  input        reset,
  output       io_enable_ready,
  input        io_enable_valid,
  input  [4:0] io_enable_bits_taskID,
  input        io_Out_ready,
  output       io_Out_valid
);
  reg [14:0] cycleCount; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [14:0] _T_2; // @[Counter.scala 38:22]
  reg [4:0] enable_R_taskID; // @[ConstNode.scala 111:25]
  reg [31:0] _RAND_1;
  reg  enable_valid_R; // @[ConstNode.scala 112:31]
  reg [31:0] _RAND_2;
  wire [4:0] taskID; // @[ConstNode.scala 114:19]
  reg  state; // @[ConstNode.scala 133:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_9; // @[Decoupled.scala 40:37]
  wire  _T_11; // @[ConstNode.scala 147:17]
  wire  _T_12; // @[ConstNode.scala 147:17]
  wire  _GEN_5; // @[ConstNode.scala 137:30]
  wire  _GEN_23; // @[ConstNode.scala 147:17]
  assign _T_2 = cycleCount + 15'h1; // @[Counter.scala 38:22]
  assign taskID = enable_valid_R ? enable_R_taskID : io_enable_bits_taskID; // @[ConstNode.scala 114:19]
  assign _T_7 = 1'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = io_enable_ready & io_enable_valid; // @[Decoupled.scala 40:37]
  assign _T_9 = io_Out_ready & io_Out_valid; // @[Decoupled.scala 40:37]
  assign _T_11 = $unsigned(reset); // @[ConstNode.scala 147:17]
  assign _T_12 = _T_11 == 1'h0; // @[ConstNode.scala 147:17]
  assign _GEN_5 = _T_8 | enable_valid_R; // @[ConstNode.scala 137:30]
  assign io_enable_ready = ~ enable_valid_R; // @[ConstNode.scala 124:19]
  assign io_Out_valid = _T_7 ? _GEN_5 : enable_valid_R; // @[ConstNode.scala 125:16 ConstNode.scala 138:22]
  assign _GEN_23 = _T_7 & _T_8; // @[ConstNode.scala 147:17]
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
  enable_R_taskID = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable_valid_R = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[0:0];
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
      enable_R_taskID <= 5'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_R_taskID <= io_enable_bits_taskID;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_R_taskID <= 5'h0;
      end
    end
    if (reset) begin
      enable_valid_R <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (!(_T_9)) begin
          enable_valid_R <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        enable_valid_R <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T_7) begin
      if (_T_8) begin
        if (_T_9) begin
          state <= 1'h0;
        end else begin
          state <= 1'h1;
        end
      end
    end else if (state) begin
      if (_T_9) begin
        state <= 1'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & _T_12) begin
          $fwrite(32'h80000002,"[LOG] [Test05] [TID->%d] [CONST] const4: Output fired @ %d, Value: %d\n",taskID,cycleCount,64'sha); // @[ConstNode.scala 147:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module test05DF(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_data_field0_data,
  input         io_MemResp_valid,
  input  [63:0] io_MemResp_bits_data,
  input  [7:0]  io_MemResp_bits_tag,
  input         io_MemResp_bits_iswrite,
  input         io_MemReq_ready,
  output        io_MemReq_valid,
  output [63:0] io_MemReq_bits_addr,
  output [63:0] io_MemReq_bits_data,
  output [7:0]  io_MemReq_bits_mask,
  output [7:0]  io_MemReq_bits_tag,
  output        io_MemReq_bits_iswrite,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data_field0_data
);
  wire  MemCtrl_clock; // @[test05.scala 34:23]
  wire  MemCtrl_reset; // @[test05.scala 34:23]
  wire  MemCtrl_io_WriteIn_0_ready; // @[test05.scala 34:23]
  wire  MemCtrl_io_WriteIn_0_valid; // @[test05.scala 34:23]
  wire [53:0] MemCtrl_io_WriteIn_0_bits_address; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_WriteIn_0_bits_data; // @[test05.scala 34:23]
  wire  MemCtrl_io_WriteOut_0_valid; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadIn_0_ready; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadIn_0_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_ReadIn_0_bits_address; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadIn_1_ready; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadIn_1_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_ReadIn_1_bits_address; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadOut_0_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_ReadOut_0_data; // @[test05.scala 34:23]
  wire  MemCtrl_io_ReadOut_1_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_ReadOut_1_data; // @[test05.scala 34:23]
  wire  MemCtrl_io_MemResp_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_MemResp_bits_data; // @[test05.scala 34:23]
  wire [7:0] MemCtrl_io_MemResp_bits_tag; // @[test05.scala 34:23]
  wire  MemCtrl_io_MemResp_bits_iswrite; // @[test05.scala 34:23]
  wire  MemCtrl_io_MemReq_ready; // @[test05.scala 34:23]
  wire  MemCtrl_io_MemReq_valid; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_MemReq_bits_addr; // @[test05.scala 34:23]
  wire [63:0] MemCtrl_io_MemReq_bits_data; // @[test05.scala 34:23]
  wire [7:0] MemCtrl_io_MemReq_bits_mask; // @[test05.scala 34:23]
  wire [7:0] MemCtrl_io_MemReq_bits_tag; // @[test05.scala 34:23]
  wire  MemCtrl_io_MemReq_bits_iswrite; // @[test05.scala 34:23]
  wire  InputSplitter_clock; // @[test05.scala 42:29]
  wire  InputSplitter_reset; // @[test05.scala 42:29]
  wire  InputSplitter_io_In_ready; // @[test05.scala 42:29]
  wire  InputSplitter_io_In_valid; // @[test05.scala 42:29]
  wire [31:0] InputSplitter_io_In_bits_data_field0_data; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_enable_ready; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_enable_valid; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_enable_bits_control; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_data_field0_0_ready; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_data_field0_0_valid; // @[test05.scala 42:29]
  wire [63:0] InputSplitter_io_Out_data_field0_0_bits_data; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_data_field0_1_ready; // @[test05.scala 42:29]
  wire  InputSplitter_io_Out_data_field0_1_valid; // @[test05.scala 42:29]
  wire [63:0] InputSplitter_io_Out_data_field0_1_bits_data; // @[test05.scala 42:29]
  wire  Loop_0_clock; // @[test05.scala 51:22]
  wire  Loop_0_reset; // @[test05.scala 51:22]
  wire  Loop_0_io_enable_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_enable_valid; // @[test05.scala 51:22]
  wire  Loop_0_io_enable_bits_control; // @[test05.scala 51:22]
  wire  Loop_0_io_InLiveIn_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_InLiveIn_0_valid; // @[test05.scala 51:22]
  wire [63:0] Loop_0_io_InLiveIn_0_bits_data; // @[test05.scala 51:22]
  wire  Loop_0_io_OutLiveIn_field0_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_OutLiveIn_field0_0_valid; // @[test05.scala 51:22]
  wire [63:0] Loop_0_io_OutLiveIn_field0_0_bits_data; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_start_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_start_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_activate_loop_start_bits_taskID; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_start_bits_control; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_back_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_back_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_activate_loop_back_bits_taskID; // @[test05.scala 51:22]
  wire  Loop_0_io_activate_loop_back_bits_control; // @[test05.scala 51:22]
  wire  Loop_0_io_loopBack_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_loopBack_0_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_loopBack_0_bits_taskID; // @[test05.scala 51:22]
  wire  Loop_0_io_loopBack_0_bits_control; // @[test05.scala 51:22]
  wire  Loop_0_io_loopFinish_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_loopFinish_0_valid; // @[test05.scala 51:22]
  wire  Loop_0_io_loopFinish_0_bits_control; // @[test05.scala 51:22]
  wire  Loop_0_io_CarryDepenIn_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_CarryDepenIn_0_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_CarryDepenIn_0_bits_taskID; // @[test05.scala 51:22]
  wire [63:0] Loop_0_io_CarryDepenIn_0_bits_data; // @[test05.scala 51:22]
  wire  Loop_0_io_CarryDepenOut_field0_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_CarryDepenOut_field0_0_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_CarryDepenOut_field0_0_bits_taskID; // @[test05.scala 51:22]
  wire [63:0] Loop_0_io_CarryDepenOut_field0_0_bits_data; // @[test05.scala 51:22]
  wire  Loop_0_io_loopExit_0_ready; // @[test05.scala 51:22]
  wire  Loop_0_io_loopExit_0_valid; // @[test05.scala 51:22]
  wire [4:0] Loop_0_io_loopExit_0_bits_taskID; // @[test05.scala 51:22]
  wire  Loop_0_io_loopExit_0_bits_control; // @[test05.scala 51:22]
  wire  bb_entry0_clock; // @[test05.scala 59:25]
  wire  bb_entry0_reset; // @[test05.scala 59:25]
  wire  bb_entry0_io_predicateIn_0_ready; // @[test05.scala 59:25]
  wire  bb_entry0_io_predicateIn_0_valid; // @[test05.scala 59:25]
  wire  bb_entry0_io_predicateIn_0_bits_control; // @[test05.scala 59:25]
  wire  bb_entry0_io_Out_0_ready; // @[test05.scala 59:25]
  wire  bb_entry0_io_Out_0_valid; // @[test05.scala 59:25]
  wire  bb_entry0_io_Out_0_bits_control; // @[test05.scala 59:25]
  wire  bb_for_cond_cleanup1_clock; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_reset; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_predicateIn_0_ready; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_predicateIn_0_valid; // @[test05.scala 61:36]
  wire [4:0] bb_for_cond_cleanup1_io_predicateIn_0_bits_taskID; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_predicateIn_0_bits_control; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_0_ready; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_0_valid; // @[test05.scala 61:36]
  wire [4:0] bb_for_cond_cleanup1_io_Out_0_bits_taskID; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_1_ready; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_1_valid; // @[test05.scala 61:36]
  wire [4:0] bb_for_cond_cleanup1_io_Out_1_bits_taskID; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_1_bits_control; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_2_ready; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_2_valid; // @[test05.scala 61:36]
  wire [4:0] bb_for_cond_cleanup1_io_Out_2_bits_taskID; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_2_bits_control; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_3_ready; // @[test05.scala 61:36]
  wire  bb_for_cond_cleanup1_io_Out_3_valid; // @[test05.scala 61:36]
  wire [4:0] bb_for_cond_cleanup1_io_Out_3_bits_taskID; // @[test05.scala 61:36]
  wire  bb_for_body2_clock; // @[test05.scala 63:28]
  wire  bb_for_body2_reset; // @[test05.scala 63:28]
  wire  bb_for_body2_io_MaskBB_0_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_MaskBB_0_valid; // @[test05.scala 63:28]
  wire [1:0] bb_for_body2_io_MaskBB_0_bits; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_0_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_0_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_0_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_1_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_1_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_1_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_2_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_2_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_2_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_3_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_3_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_3_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_4_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_4_valid; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_4_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_5_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_5_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_5_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_5_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_6_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_6_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_6_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_6_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_7_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_7_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_7_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_7_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_8_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_8_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_8_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_8_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_9_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_9_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_9_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_9_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_10_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_10_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_10_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_10_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_11_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_11_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_Out_11_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_Out_11_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_0_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_0_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_predicateIn_0_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_0_bits_control; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_1_ready; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_1_valid; // @[test05.scala 63:28]
  wire [4:0] bb_for_body2_io_predicateIn_1_bits_taskID; // @[test05.scala 63:28]
  wire  bb_for_body2_io_predicateIn_1_bits_control; // @[test05.scala 63:28]
  wire  br_0_clock; // @[test05.scala 72:20]
  wire  br_0_reset; // @[test05.scala 72:20]
  wire  br_0_io_enable_ready; // @[test05.scala 72:20]
  wire  br_0_io_enable_valid; // @[test05.scala 72:20]
  wire  br_0_io_enable_bits_control; // @[test05.scala 72:20]
  wire  br_0_io_Out_0_ready; // @[test05.scala 72:20]
  wire  br_0_io_Out_0_valid; // @[test05.scala 72:20]
  wire  br_0_io_Out_0_bits_control; // @[test05.scala 72:20]
  wire  Gep_arrayidx31_clock; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_reset; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_enable_ready; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_enable_valid; // @[test05.scala 75:30]
  wire [4:0] Gep_arrayidx31_io_enable_bits_taskID; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_enable_bits_control; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_Out_0_ready; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_Out_0_valid; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_Out_0_bits_predicate; // @[test05.scala 75:30]
  wire [63:0] Gep_arrayidx31_io_Out_0_bits_data; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_baseAddress_ready; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_baseAddress_valid; // @[test05.scala 75:30]
  wire [63:0] Gep_arrayidx31_io_baseAddress_bits_data; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_idx_0_ready; // @[test05.scala 75:30]
  wire  Gep_arrayidx31_io_idx_0_valid; // @[test05.scala 75:30]
  wire  ld_2_clock; // @[test05.scala 78:20]
  wire  ld_2_reset; // @[test05.scala 78:20]
  wire  ld_2_io_enable_ready; // @[test05.scala 78:20]
  wire  ld_2_io_enable_valid; // @[test05.scala 78:20]
  wire [4:0] ld_2_io_enable_bits_taskID; // @[test05.scala 78:20]
  wire  ld_2_io_enable_bits_control; // @[test05.scala 78:20]
  wire  ld_2_io_Out_0_ready; // @[test05.scala 78:20]
  wire  ld_2_io_Out_0_valid; // @[test05.scala 78:20]
  wire [63:0] ld_2_io_Out_0_bits_data; // @[test05.scala 78:20]
  wire  ld_2_io_GepAddr_ready; // @[test05.scala 78:20]
  wire  ld_2_io_GepAddr_valid; // @[test05.scala 78:20]
  wire  ld_2_io_GepAddr_bits_predicate; // @[test05.scala 78:20]
  wire [63:0] ld_2_io_GepAddr_bits_data; // @[test05.scala 78:20]
  wire  ld_2_io_memReq_ready; // @[test05.scala 78:20]
  wire  ld_2_io_memReq_valid; // @[test05.scala 78:20]
  wire [63:0] ld_2_io_memReq_bits_address; // @[test05.scala 78:20]
  wire  ld_2_io_memResp_valid; // @[test05.scala 78:20]
  wire [63:0] ld_2_io_memResp_data; // @[test05.scala 78:20]
  wire  ret_3_clock; // @[test05.scala 81:21]
  wire  ret_3_reset; // @[test05.scala 81:21]
  wire  ret_3_io_In_enable_ready; // @[test05.scala 81:21]
  wire  ret_3_io_In_enable_valid; // @[test05.scala 81:21]
  wire [4:0] ret_3_io_In_enable_bits_taskID; // @[test05.scala 81:21]
  wire  ret_3_io_In_data_field0_ready; // @[test05.scala 81:21]
  wire  ret_3_io_In_data_field0_valid; // @[test05.scala 81:21]
  wire [31:0] ret_3_io_In_data_field0_bits_data; // @[test05.scala 81:21]
  wire  ret_3_io_Out_ready; // @[test05.scala 81:21]
  wire  ret_3_io_Out_valid; // @[test05.scala 81:21]
  wire [31:0] ret_3_io_Out_bits_data_field0_data; // @[test05.scala 81:21]
  wire  phiindvars_iv4_clock; // @[test05.scala 84:30]
  wire  phiindvars_iv4_reset; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_enable_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_enable_valid; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_enable_bits_control; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_InData_0_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_InData_0_valid; // @[test05.scala 84:30]
  wire [4:0] phiindvars_iv4_io_InData_0_bits_taskID; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_InData_1_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_InData_1_valid; // @[test05.scala 84:30]
  wire [4:0] phiindvars_iv4_io_InData_1_bits_taskID; // @[test05.scala 84:30]
  wire [63:0] phiindvars_iv4_io_InData_1_bits_data; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Mask_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Mask_valid; // @[test05.scala 84:30]
  wire [1:0] phiindvars_iv4_io_Mask_bits; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Out_0_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Out_0_valid; // @[test05.scala 84:30]
  wire [63:0] phiindvars_iv4_io_Out_0_bits_data; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Out_1_ready; // @[test05.scala 84:30]
  wire  phiindvars_iv4_io_Out_1_valid; // @[test05.scala 84:30]
  wire [63:0] phiindvars_iv4_io_Out_1_bits_data; // @[test05.scala 84:30]
  wire  Gep_arrayidx5_clock; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_reset; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_enable_ready; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_enable_valid; // @[test05.scala 87:29]
  wire [4:0] Gep_arrayidx5_io_enable_bits_taskID; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_enable_bits_control; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_Out_0_ready; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_Out_0_valid; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_Out_0_bits_predicate; // @[test05.scala 87:29]
  wire [63:0] Gep_arrayidx5_io_Out_0_bits_data; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_Out_1_ready; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_Out_1_valid; // @[test05.scala 87:29]
  wire [63:0] Gep_arrayidx5_io_Out_1_bits_data; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_baseAddress_ready; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_baseAddress_valid; // @[test05.scala 87:29]
  wire [63:0] Gep_arrayidx5_io_baseAddress_bits_data; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_idx_0_ready; // @[test05.scala 87:29]
  wire  Gep_arrayidx5_io_idx_0_valid; // @[test05.scala 87:29]
  wire [63:0] Gep_arrayidx5_io_idx_0_bits_data; // @[test05.scala 87:29]
  wire  ld_6_clock; // @[test05.scala 90:20]
  wire  ld_6_reset; // @[test05.scala 90:20]
  wire  ld_6_io_enable_ready; // @[test05.scala 90:20]
  wire  ld_6_io_enable_valid; // @[test05.scala 90:20]
  wire [4:0] ld_6_io_enable_bits_taskID; // @[test05.scala 90:20]
  wire  ld_6_io_enable_bits_control; // @[test05.scala 90:20]
  wire  ld_6_io_Out_0_ready; // @[test05.scala 90:20]
  wire  ld_6_io_Out_0_valid; // @[test05.scala 90:20]
  wire [63:0] ld_6_io_Out_0_bits_data; // @[test05.scala 90:20]
  wire  ld_6_io_GepAddr_ready; // @[test05.scala 90:20]
  wire  ld_6_io_GepAddr_valid; // @[test05.scala 90:20]
  wire  ld_6_io_GepAddr_bits_predicate; // @[test05.scala 90:20]
  wire [63:0] ld_6_io_GepAddr_bits_data; // @[test05.scala 90:20]
  wire  ld_6_io_memReq_ready; // @[test05.scala 90:20]
  wire  ld_6_io_memReq_valid; // @[test05.scala 90:20]
  wire [63:0] ld_6_io_memReq_bits_address; // @[test05.scala 90:20]
  wire  ld_6_io_memResp_valid; // @[test05.scala 90:20]
  wire [63:0] ld_6_io_memResp_data; // @[test05.scala 90:20]
  wire  binaryOp_mul7_clock; // @[test05.scala 93:29]
  wire  binaryOp_mul7_reset; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_enable_ready; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_enable_valid; // @[test05.scala 93:29]
  wire [4:0] binaryOp_mul7_io_enable_bits_taskID; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_enable_bits_control; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_Out_0_ready; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_Out_0_valid; // @[test05.scala 93:29]
  wire [63:0] binaryOp_mul7_io_Out_0_bits_data; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_LeftIO_ready; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_LeftIO_valid; // @[test05.scala 93:29]
  wire [63:0] binaryOp_mul7_io_LeftIO_bits_data; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_RightIO_ready; // @[test05.scala 93:29]
  wire  binaryOp_mul7_io_RightIO_valid; // @[test05.scala 93:29]
  wire  st_8_clock; // @[test05.scala 96:20]
  wire  st_8_reset; // @[test05.scala 96:20]
  wire  st_8_io_enable_ready; // @[test05.scala 96:20]
  wire  st_8_io_enable_valid; // @[test05.scala 96:20]
  wire [4:0] st_8_io_enable_bits_taskID; // @[test05.scala 96:20]
  wire  st_8_io_enable_bits_control; // @[test05.scala 96:20]
  wire  st_8_io_GepAddr_ready; // @[test05.scala 96:20]
  wire  st_8_io_GepAddr_valid; // @[test05.scala 96:20]
  wire [63:0] st_8_io_GepAddr_bits_data; // @[test05.scala 96:20]
  wire  st_8_io_inData_ready; // @[test05.scala 96:20]
  wire  st_8_io_inData_valid; // @[test05.scala 96:20]
  wire [63:0] st_8_io_inData_bits_data; // @[test05.scala 96:20]
  wire  st_8_io_memReq_ready; // @[test05.scala 96:20]
  wire  st_8_io_memReq_valid; // @[test05.scala 96:20]
  wire [53:0] st_8_io_memReq_bits_address; // @[test05.scala 96:20]
  wire [63:0] st_8_io_memReq_bits_data; // @[test05.scala 96:20]
  wire  st_8_io_memResp_valid; // @[test05.scala 96:20]
  wire  binaryOp_indvars_iv_next9_clock; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_reset; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_enable_ready; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_enable_valid; // @[test05.scala 99:41]
  wire [4:0] binaryOp_indvars_iv_next9_io_enable_bits_taskID; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_enable_bits_control; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_Out_0_ready; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_Out_0_valid; // @[test05.scala 99:41]
  wire [4:0] binaryOp_indvars_iv_next9_io_Out_0_bits_taskID; // @[test05.scala 99:41]
  wire [63:0] binaryOp_indvars_iv_next9_io_Out_0_bits_data; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_Out_1_ready; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_Out_1_valid; // @[test05.scala 99:41]
  wire [63:0] binaryOp_indvars_iv_next9_io_Out_1_bits_data; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_LeftIO_ready; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_LeftIO_valid; // @[test05.scala 99:41]
  wire [63:0] binaryOp_indvars_iv_next9_io_LeftIO_bits_data; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_RightIO_ready; // @[test05.scala 99:41]
  wire  binaryOp_indvars_iv_next9_io_RightIO_valid; // @[test05.scala 99:41]
  wire  icmp_exitcond10_clock; // @[test05.scala 102:31]
  wire  icmp_exitcond10_reset; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_enable_ready; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_enable_valid; // @[test05.scala 102:31]
  wire [4:0] icmp_exitcond10_io_enable_bits_taskID; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_enable_bits_control; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_Out_0_ready; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_Out_0_valid; // @[test05.scala 102:31]
  wire [4:0] icmp_exitcond10_io_Out_0_bits_taskID; // @[test05.scala 102:31]
  wire [63:0] icmp_exitcond10_io_Out_0_bits_data; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_LeftIO_ready; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_LeftIO_valid; // @[test05.scala 102:31]
  wire [63:0] icmp_exitcond10_io_LeftIO_bits_data; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_RightIO_ready; // @[test05.scala 102:31]
  wire  icmp_exitcond10_io_RightIO_valid; // @[test05.scala 102:31]
  wire  br_11_clock; // @[test05.scala 105:21]
  wire  br_11_reset; // @[test05.scala 105:21]
  wire  br_11_io_enable_ready; // @[test05.scala 105:21]
  wire  br_11_io_enable_valid; // @[test05.scala 105:21]
  wire [4:0] br_11_io_enable_bits_taskID; // @[test05.scala 105:21]
  wire  br_11_io_enable_bits_control; // @[test05.scala 105:21]
  wire  br_11_io_CmpIO_ready; // @[test05.scala 105:21]
  wire  br_11_io_CmpIO_valid; // @[test05.scala 105:21]
  wire [4:0] br_11_io_CmpIO_bits_taskID; // @[test05.scala 105:21]
  wire [63:0] br_11_io_CmpIO_bits_data; // @[test05.scala 105:21]
  wire  br_11_io_TrueOutput_0_ready; // @[test05.scala 105:21]
  wire  br_11_io_TrueOutput_0_valid; // @[test05.scala 105:21]
  wire  br_11_io_TrueOutput_0_bits_control; // @[test05.scala 105:21]
  wire  br_11_io_FalseOutput_0_ready; // @[test05.scala 105:21]
  wire  br_11_io_FalseOutput_0_valid; // @[test05.scala 105:21]
  wire [4:0] br_11_io_FalseOutput_0_bits_taskID; // @[test05.scala 105:21]
  wire  br_11_io_FalseOutput_0_bits_control; // @[test05.scala 105:21]
  wire  const0_clock; // @[test05.scala 114:22]
  wire  const0_reset; // @[test05.scala 114:22]
  wire  const0_io_enable_ready; // @[test05.scala 114:22]
  wire  const0_io_enable_valid; // @[test05.scala 114:22]
  wire [4:0] const0_io_enable_bits_taskID; // @[test05.scala 114:22]
  wire  const0_io_Out_ready; // @[test05.scala 114:22]
  wire  const0_io_Out_valid; // @[test05.scala 114:22]
  wire  const1_clock; // @[test05.scala 117:22]
  wire  const1_reset; // @[test05.scala 117:22]
  wire  const1_io_enable_ready; // @[test05.scala 117:22]
  wire  const1_io_enable_valid; // @[test05.scala 117:22]
  wire [4:0] const1_io_enable_bits_taskID; // @[test05.scala 117:22]
  wire  const1_io_Out_ready; // @[test05.scala 117:22]
  wire  const1_io_Out_valid; // @[test05.scala 117:22]
  wire [4:0] const1_io_Out_bits_taskID; // @[test05.scala 117:22]
  wire  const2_clock; // @[test05.scala 120:22]
  wire  const2_reset; // @[test05.scala 120:22]
  wire  const2_io_enable_ready; // @[test05.scala 120:22]
  wire  const2_io_enable_valid; // @[test05.scala 120:22]
  wire [4:0] const2_io_enable_bits_taskID; // @[test05.scala 120:22]
  wire  const2_io_Out_ready; // @[test05.scala 120:22]
  wire  const2_io_Out_valid; // @[test05.scala 120:22]
  wire  const3_clock; // @[test05.scala 123:22]
  wire  const3_reset; // @[test05.scala 123:22]
  wire  const3_io_enable_ready; // @[test05.scala 123:22]
  wire  const3_io_enable_valid; // @[test05.scala 123:22]
  wire [4:0] const3_io_enable_bits_taskID; // @[test05.scala 123:22]
  wire  const3_io_Out_ready; // @[test05.scala 123:22]
  wire  const3_io_Out_valid; // @[test05.scala 123:22]
  wire  const4_clock; // @[test05.scala 126:22]
  wire  const4_reset; // @[test05.scala 126:22]
  wire  const4_io_enable_ready; // @[test05.scala 126:22]
  wire  const4_io_enable_valid; // @[test05.scala 126:22]
  wire [4:0] const4_io_enable_bits_taskID; // @[test05.scala 126:22]
  wire  const4_io_Out_ready; // @[test05.scala 126:22]
  wire  const4_io_Out_valid; // @[test05.scala 126:22]
  UnifiedController MemCtrl ( // @[test05.scala 34:23]
    .clock(MemCtrl_clock),
    .reset(MemCtrl_reset),
    .io_WriteIn_0_ready(MemCtrl_io_WriteIn_0_ready),
    .io_WriteIn_0_valid(MemCtrl_io_WriteIn_0_valid),
    .io_WriteIn_0_bits_address(MemCtrl_io_WriteIn_0_bits_address),
    .io_WriteIn_0_bits_data(MemCtrl_io_WriteIn_0_bits_data),
    .io_WriteOut_0_valid(MemCtrl_io_WriteOut_0_valid),
    .io_ReadIn_0_ready(MemCtrl_io_ReadIn_0_ready),
    .io_ReadIn_0_valid(MemCtrl_io_ReadIn_0_valid),
    .io_ReadIn_0_bits_address(MemCtrl_io_ReadIn_0_bits_address),
    .io_ReadIn_1_ready(MemCtrl_io_ReadIn_1_ready),
    .io_ReadIn_1_valid(MemCtrl_io_ReadIn_1_valid),
    .io_ReadIn_1_bits_address(MemCtrl_io_ReadIn_1_bits_address),
    .io_ReadOut_0_valid(MemCtrl_io_ReadOut_0_valid),
    .io_ReadOut_0_data(MemCtrl_io_ReadOut_0_data),
    .io_ReadOut_1_valid(MemCtrl_io_ReadOut_1_valid),
    .io_ReadOut_1_data(MemCtrl_io_ReadOut_1_data),
    .io_MemResp_valid(MemCtrl_io_MemResp_valid),
    .io_MemResp_bits_data(MemCtrl_io_MemResp_bits_data),
    .io_MemResp_bits_tag(MemCtrl_io_MemResp_bits_tag),
    .io_MemResp_bits_iswrite(MemCtrl_io_MemResp_bits_iswrite),
    .io_MemReq_ready(MemCtrl_io_MemReq_ready),
    .io_MemReq_valid(MemCtrl_io_MemReq_valid),
    .io_MemReq_bits_addr(MemCtrl_io_MemReq_bits_addr),
    .io_MemReq_bits_data(MemCtrl_io_MemReq_bits_data),
    .io_MemReq_bits_mask(MemCtrl_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(MemCtrl_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(MemCtrl_io_MemReq_bits_iswrite)
  );
  SplitCallNew InputSplitter ( // @[test05.scala 42:29]
    .clock(InputSplitter_clock),
    .reset(InputSplitter_reset),
    .io_In_ready(InputSplitter_io_In_ready),
    .io_In_valid(InputSplitter_io_In_valid),
    .io_In_bits_data_field0_data(InputSplitter_io_In_bits_data_field0_data),
    .io_Out_enable_ready(InputSplitter_io_Out_enable_ready),
    .io_Out_enable_valid(InputSplitter_io_Out_enable_valid),
    .io_Out_enable_bits_control(InputSplitter_io_Out_enable_bits_control),
    .io_Out_data_field0_0_ready(InputSplitter_io_Out_data_field0_0_ready),
    .io_Out_data_field0_0_valid(InputSplitter_io_Out_data_field0_0_valid),
    .io_Out_data_field0_0_bits_data(InputSplitter_io_Out_data_field0_0_bits_data),
    .io_Out_data_field0_1_ready(InputSplitter_io_Out_data_field0_1_ready),
    .io_Out_data_field0_1_valid(InputSplitter_io_Out_data_field0_1_valid),
    .io_Out_data_field0_1_bits_data(InputSplitter_io_Out_data_field0_1_bits_data)
  );
  LoopBlockNode Loop_0 ( // @[test05.scala 51:22]
    .clock(Loop_0_clock),
    .reset(Loop_0_reset),
    .io_enable_ready(Loop_0_io_enable_ready),
    .io_enable_valid(Loop_0_io_enable_valid),
    .io_enable_bits_control(Loop_0_io_enable_bits_control),
    .io_InLiveIn_0_ready(Loop_0_io_InLiveIn_0_ready),
    .io_InLiveIn_0_valid(Loop_0_io_InLiveIn_0_valid),
    .io_InLiveIn_0_bits_data(Loop_0_io_InLiveIn_0_bits_data),
    .io_OutLiveIn_field0_0_ready(Loop_0_io_OutLiveIn_field0_0_ready),
    .io_OutLiveIn_field0_0_valid(Loop_0_io_OutLiveIn_field0_0_valid),
    .io_OutLiveIn_field0_0_bits_data(Loop_0_io_OutLiveIn_field0_0_bits_data),
    .io_activate_loop_start_ready(Loop_0_io_activate_loop_start_ready),
    .io_activate_loop_start_valid(Loop_0_io_activate_loop_start_valid),
    .io_activate_loop_start_bits_taskID(Loop_0_io_activate_loop_start_bits_taskID),
    .io_activate_loop_start_bits_control(Loop_0_io_activate_loop_start_bits_control),
    .io_activate_loop_back_ready(Loop_0_io_activate_loop_back_ready),
    .io_activate_loop_back_valid(Loop_0_io_activate_loop_back_valid),
    .io_activate_loop_back_bits_taskID(Loop_0_io_activate_loop_back_bits_taskID),
    .io_activate_loop_back_bits_control(Loop_0_io_activate_loop_back_bits_control),
    .io_loopBack_0_ready(Loop_0_io_loopBack_0_ready),
    .io_loopBack_0_valid(Loop_0_io_loopBack_0_valid),
    .io_loopBack_0_bits_taskID(Loop_0_io_loopBack_0_bits_taskID),
    .io_loopBack_0_bits_control(Loop_0_io_loopBack_0_bits_control),
    .io_loopFinish_0_ready(Loop_0_io_loopFinish_0_ready),
    .io_loopFinish_0_valid(Loop_0_io_loopFinish_0_valid),
    .io_loopFinish_0_bits_control(Loop_0_io_loopFinish_0_bits_control),
    .io_CarryDepenIn_0_ready(Loop_0_io_CarryDepenIn_0_ready),
    .io_CarryDepenIn_0_valid(Loop_0_io_CarryDepenIn_0_valid),
    .io_CarryDepenIn_0_bits_taskID(Loop_0_io_CarryDepenIn_0_bits_taskID),
    .io_CarryDepenIn_0_bits_data(Loop_0_io_CarryDepenIn_0_bits_data),
    .io_CarryDepenOut_field0_0_ready(Loop_0_io_CarryDepenOut_field0_0_ready),
    .io_CarryDepenOut_field0_0_valid(Loop_0_io_CarryDepenOut_field0_0_valid),
    .io_CarryDepenOut_field0_0_bits_taskID(Loop_0_io_CarryDepenOut_field0_0_bits_taskID),
    .io_CarryDepenOut_field0_0_bits_data(Loop_0_io_CarryDepenOut_field0_0_bits_data),
    .io_loopExit_0_ready(Loop_0_io_loopExit_0_ready),
    .io_loopExit_0_valid(Loop_0_io_loopExit_0_valid),
    .io_loopExit_0_bits_taskID(Loop_0_io_loopExit_0_bits_taskID),
    .io_loopExit_0_bits_control(Loop_0_io_loopExit_0_bits_control)
  );
  BasicBlockNoMaskFastNode bb_entry0 ( // @[test05.scala 59:25]
    .clock(bb_entry0_clock),
    .reset(bb_entry0_reset),
    .io_predicateIn_0_ready(bb_entry0_io_predicateIn_0_ready),
    .io_predicateIn_0_valid(bb_entry0_io_predicateIn_0_valid),
    .io_predicateIn_0_bits_control(bb_entry0_io_predicateIn_0_bits_control),
    .io_Out_0_ready(bb_entry0_io_Out_0_ready),
    .io_Out_0_valid(bb_entry0_io_Out_0_valid),
    .io_Out_0_bits_control(bb_entry0_io_Out_0_bits_control)
  );
  BasicBlockNoMaskFastNode_1 bb_for_cond_cleanup1 ( // @[test05.scala 61:36]
    .clock(bb_for_cond_cleanup1_clock),
    .reset(bb_for_cond_cleanup1_reset),
    .io_predicateIn_0_ready(bb_for_cond_cleanup1_io_predicateIn_0_ready),
    .io_predicateIn_0_valid(bb_for_cond_cleanup1_io_predicateIn_0_valid),
    .io_predicateIn_0_bits_taskID(bb_for_cond_cleanup1_io_predicateIn_0_bits_taskID),
    .io_predicateIn_0_bits_control(bb_for_cond_cleanup1_io_predicateIn_0_bits_control),
    .io_Out_0_ready(bb_for_cond_cleanup1_io_Out_0_ready),
    .io_Out_0_valid(bb_for_cond_cleanup1_io_Out_0_valid),
    .io_Out_0_bits_taskID(bb_for_cond_cleanup1_io_Out_0_bits_taskID),
    .io_Out_1_ready(bb_for_cond_cleanup1_io_Out_1_ready),
    .io_Out_1_valid(bb_for_cond_cleanup1_io_Out_1_valid),
    .io_Out_1_bits_taskID(bb_for_cond_cleanup1_io_Out_1_bits_taskID),
    .io_Out_1_bits_control(bb_for_cond_cleanup1_io_Out_1_bits_control),
    .io_Out_2_ready(bb_for_cond_cleanup1_io_Out_2_ready),
    .io_Out_2_valid(bb_for_cond_cleanup1_io_Out_2_valid),
    .io_Out_2_bits_taskID(bb_for_cond_cleanup1_io_Out_2_bits_taskID),
    .io_Out_2_bits_control(bb_for_cond_cleanup1_io_Out_2_bits_control),
    .io_Out_3_ready(bb_for_cond_cleanup1_io_Out_3_ready),
    .io_Out_3_valid(bb_for_cond_cleanup1_io_Out_3_valid),
    .io_Out_3_bits_taskID(bb_for_cond_cleanup1_io_Out_3_bits_taskID)
  );
  BasicBlockNode bb_for_body2 ( // @[test05.scala 63:28]
    .clock(bb_for_body2_clock),
    .reset(bb_for_body2_reset),
    .io_MaskBB_0_ready(bb_for_body2_io_MaskBB_0_ready),
    .io_MaskBB_0_valid(bb_for_body2_io_MaskBB_0_valid),
    .io_MaskBB_0_bits(bb_for_body2_io_MaskBB_0_bits),
    .io_Out_0_ready(bb_for_body2_io_Out_0_ready),
    .io_Out_0_valid(bb_for_body2_io_Out_0_valid),
    .io_Out_0_bits_taskID(bb_for_body2_io_Out_0_bits_taskID),
    .io_Out_1_ready(bb_for_body2_io_Out_1_ready),
    .io_Out_1_valid(bb_for_body2_io_Out_1_valid),
    .io_Out_1_bits_taskID(bb_for_body2_io_Out_1_bits_taskID),
    .io_Out_2_ready(bb_for_body2_io_Out_2_ready),
    .io_Out_2_valid(bb_for_body2_io_Out_2_valid),
    .io_Out_2_bits_taskID(bb_for_body2_io_Out_2_bits_taskID),
    .io_Out_3_ready(bb_for_body2_io_Out_3_ready),
    .io_Out_3_valid(bb_for_body2_io_Out_3_valid),
    .io_Out_3_bits_taskID(bb_for_body2_io_Out_3_bits_taskID),
    .io_Out_4_ready(bb_for_body2_io_Out_4_ready),
    .io_Out_4_valid(bb_for_body2_io_Out_4_valid),
    .io_Out_4_bits_control(bb_for_body2_io_Out_4_bits_control),
    .io_Out_5_ready(bb_for_body2_io_Out_5_ready),
    .io_Out_5_valid(bb_for_body2_io_Out_5_valid),
    .io_Out_5_bits_taskID(bb_for_body2_io_Out_5_bits_taskID),
    .io_Out_5_bits_control(bb_for_body2_io_Out_5_bits_control),
    .io_Out_6_ready(bb_for_body2_io_Out_6_ready),
    .io_Out_6_valid(bb_for_body2_io_Out_6_valid),
    .io_Out_6_bits_taskID(bb_for_body2_io_Out_6_bits_taskID),
    .io_Out_6_bits_control(bb_for_body2_io_Out_6_bits_control),
    .io_Out_7_ready(bb_for_body2_io_Out_7_ready),
    .io_Out_7_valid(bb_for_body2_io_Out_7_valid),
    .io_Out_7_bits_taskID(bb_for_body2_io_Out_7_bits_taskID),
    .io_Out_7_bits_control(bb_for_body2_io_Out_7_bits_control),
    .io_Out_8_ready(bb_for_body2_io_Out_8_ready),
    .io_Out_8_valid(bb_for_body2_io_Out_8_valid),
    .io_Out_8_bits_taskID(bb_for_body2_io_Out_8_bits_taskID),
    .io_Out_8_bits_control(bb_for_body2_io_Out_8_bits_control),
    .io_Out_9_ready(bb_for_body2_io_Out_9_ready),
    .io_Out_9_valid(bb_for_body2_io_Out_9_valid),
    .io_Out_9_bits_taskID(bb_for_body2_io_Out_9_bits_taskID),
    .io_Out_9_bits_control(bb_for_body2_io_Out_9_bits_control),
    .io_Out_10_ready(bb_for_body2_io_Out_10_ready),
    .io_Out_10_valid(bb_for_body2_io_Out_10_valid),
    .io_Out_10_bits_taskID(bb_for_body2_io_Out_10_bits_taskID),
    .io_Out_10_bits_control(bb_for_body2_io_Out_10_bits_control),
    .io_Out_11_ready(bb_for_body2_io_Out_11_ready),
    .io_Out_11_valid(bb_for_body2_io_Out_11_valid),
    .io_Out_11_bits_taskID(bb_for_body2_io_Out_11_bits_taskID),
    .io_Out_11_bits_control(bb_for_body2_io_Out_11_bits_control),
    .io_predicateIn_0_ready(bb_for_body2_io_predicateIn_0_ready),
    .io_predicateIn_0_valid(bb_for_body2_io_predicateIn_0_valid),
    .io_predicateIn_0_bits_taskID(bb_for_body2_io_predicateIn_0_bits_taskID),
    .io_predicateIn_0_bits_control(bb_for_body2_io_predicateIn_0_bits_control),
    .io_predicateIn_1_ready(bb_for_body2_io_predicateIn_1_ready),
    .io_predicateIn_1_valid(bb_for_body2_io_predicateIn_1_valid),
    .io_predicateIn_1_bits_taskID(bb_for_body2_io_predicateIn_1_bits_taskID),
    .io_predicateIn_1_bits_control(bb_for_body2_io_predicateIn_1_bits_control)
  );
  UBranchNode br_0 ( // @[test05.scala 72:20]
    .clock(br_0_clock),
    .reset(br_0_reset),
    .io_enable_ready(br_0_io_enable_ready),
    .io_enable_valid(br_0_io_enable_valid),
    .io_enable_bits_control(br_0_io_enable_bits_control),
    .io_Out_0_ready(br_0_io_Out_0_ready),
    .io_Out_0_valid(br_0_io_Out_0_valid),
    .io_Out_0_bits_control(br_0_io_Out_0_bits_control)
  );
  GepNode Gep_arrayidx31 ( // @[test05.scala 75:30]
    .clock(Gep_arrayidx31_clock),
    .reset(Gep_arrayidx31_reset),
    .io_enable_ready(Gep_arrayidx31_io_enable_ready),
    .io_enable_valid(Gep_arrayidx31_io_enable_valid),
    .io_enable_bits_taskID(Gep_arrayidx31_io_enable_bits_taskID),
    .io_enable_bits_control(Gep_arrayidx31_io_enable_bits_control),
    .io_Out_0_ready(Gep_arrayidx31_io_Out_0_ready),
    .io_Out_0_valid(Gep_arrayidx31_io_Out_0_valid),
    .io_Out_0_bits_predicate(Gep_arrayidx31_io_Out_0_bits_predicate),
    .io_Out_0_bits_data(Gep_arrayidx31_io_Out_0_bits_data),
    .io_baseAddress_ready(Gep_arrayidx31_io_baseAddress_ready),
    .io_baseAddress_valid(Gep_arrayidx31_io_baseAddress_valid),
    .io_baseAddress_bits_data(Gep_arrayidx31_io_baseAddress_bits_data),
    .io_idx_0_ready(Gep_arrayidx31_io_idx_0_ready),
    .io_idx_0_valid(Gep_arrayidx31_io_idx_0_valid)
  );
  UnTypLoad ld_2 ( // @[test05.scala 78:20]
    .clock(ld_2_clock),
    .reset(ld_2_reset),
    .io_enable_ready(ld_2_io_enable_ready),
    .io_enable_valid(ld_2_io_enable_valid),
    .io_enable_bits_taskID(ld_2_io_enable_bits_taskID),
    .io_enable_bits_control(ld_2_io_enable_bits_control),
    .io_Out_0_ready(ld_2_io_Out_0_ready),
    .io_Out_0_valid(ld_2_io_Out_0_valid),
    .io_Out_0_bits_data(ld_2_io_Out_0_bits_data),
    .io_GepAddr_ready(ld_2_io_GepAddr_ready),
    .io_GepAddr_valid(ld_2_io_GepAddr_valid),
    .io_GepAddr_bits_predicate(ld_2_io_GepAddr_bits_predicate),
    .io_GepAddr_bits_data(ld_2_io_GepAddr_bits_data),
    .io_memReq_ready(ld_2_io_memReq_ready),
    .io_memReq_valid(ld_2_io_memReq_valid),
    .io_memReq_bits_address(ld_2_io_memReq_bits_address),
    .io_memResp_valid(ld_2_io_memResp_valid),
    .io_memResp_data(ld_2_io_memResp_data)
  );
  RetNode2 ret_3 ( // @[test05.scala 81:21]
    .clock(ret_3_clock),
    .reset(ret_3_reset),
    .io_In_enable_ready(ret_3_io_In_enable_ready),
    .io_In_enable_valid(ret_3_io_In_enable_valid),
    .io_In_enable_bits_taskID(ret_3_io_In_enable_bits_taskID),
    .io_In_data_field0_ready(ret_3_io_In_data_field0_ready),
    .io_In_data_field0_valid(ret_3_io_In_data_field0_valid),
    .io_In_data_field0_bits_data(ret_3_io_In_data_field0_bits_data),
    .io_Out_ready(ret_3_io_Out_ready),
    .io_Out_valid(ret_3_io_Out_valid),
    .io_Out_bits_data_field0_data(ret_3_io_Out_bits_data_field0_data)
  );
  PhiFastNode phiindvars_iv4 ( // @[test05.scala 84:30]
    .clock(phiindvars_iv4_clock),
    .reset(phiindvars_iv4_reset),
    .io_enable_ready(phiindvars_iv4_io_enable_ready),
    .io_enable_valid(phiindvars_iv4_io_enable_valid),
    .io_enable_bits_control(phiindvars_iv4_io_enable_bits_control),
    .io_InData_0_ready(phiindvars_iv4_io_InData_0_ready),
    .io_InData_0_valid(phiindvars_iv4_io_InData_0_valid),
    .io_InData_0_bits_taskID(phiindvars_iv4_io_InData_0_bits_taskID),
    .io_InData_1_ready(phiindvars_iv4_io_InData_1_ready),
    .io_InData_1_valid(phiindvars_iv4_io_InData_1_valid),
    .io_InData_1_bits_taskID(phiindvars_iv4_io_InData_1_bits_taskID),
    .io_InData_1_bits_data(phiindvars_iv4_io_InData_1_bits_data),
    .io_Mask_ready(phiindvars_iv4_io_Mask_ready),
    .io_Mask_valid(phiindvars_iv4_io_Mask_valid),
    .io_Mask_bits(phiindvars_iv4_io_Mask_bits),
    .io_Out_0_ready(phiindvars_iv4_io_Out_0_ready),
    .io_Out_0_valid(phiindvars_iv4_io_Out_0_valid),
    .io_Out_0_bits_data(phiindvars_iv4_io_Out_0_bits_data),
    .io_Out_1_ready(phiindvars_iv4_io_Out_1_ready),
    .io_Out_1_valid(phiindvars_iv4_io_Out_1_valid),
    .io_Out_1_bits_data(phiindvars_iv4_io_Out_1_bits_data)
  );
  GepNode_1 Gep_arrayidx5 ( // @[test05.scala 87:29]
    .clock(Gep_arrayidx5_clock),
    .reset(Gep_arrayidx5_reset),
    .io_enable_ready(Gep_arrayidx5_io_enable_ready),
    .io_enable_valid(Gep_arrayidx5_io_enable_valid),
    .io_enable_bits_taskID(Gep_arrayidx5_io_enable_bits_taskID),
    .io_enable_bits_control(Gep_arrayidx5_io_enable_bits_control),
    .io_Out_0_ready(Gep_arrayidx5_io_Out_0_ready),
    .io_Out_0_valid(Gep_arrayidx5_io_Out_0_valid),
    .io_Out_0_bits_predicate(Gep_arrayidx5_io_Out_0_bits_predicate),
    .io_Out_0_bits_data(Gep_arrayidx5_io_Out_0_bits_data),
    .io_Out_1_ready(Gep_arrayidx5_io_Out_1_ready),
    .io_Out_1_valid(Gep_arrayidx5_io_Out_1_valid),
    .io_Out_1_bits_data(Gep_arrayidx5_io_Out_1_bits_data),
    .io_baseAddress_ready(Gep_arrayidx5_io_baseAddress_ready),
    .io_baseAddress_valid(Gep_arrayidx5_io_baseAddress_valid),
    .io_baseAddress_bits_data(Gep_arrayidx5_io_baseAddress_bits_data),
    .io_idx_0_ready(Gep_arrayidx5_io_idx_0_ready),
    .io_idx_0_valid(Gep_arrayidx5_io_idx_0_valid),
    .io_idx_0_bits_data(Gep_arrayidx5_io_idx_0_bits_data)
  );
  UnTypLoad_1 ld_6 ( // @[test05.scala 90:20]
    .clock(ld_6_clock),
    .reset(ld_6_reset),
    .io_enable_ready(ld_6_io_enable_ready),
    .io_enable_valid(ld_6_io_enable_valid),
    .io_enable_bits_taskID(ld_6_io_enable_bits_taskID),
    .io_enable_bits_control(ld_6_io_enable_bits_control),
    .io_Out_0_ready(ld_6_io_Out_0_ready),
    .io_Out_0_valid(ld_6_io_Out_0_valid),
    .io_Out_0_bits_data(ld_6_io_Out_0_bits_data),
    .io_GepAddr_ready(ld_6_io_GepAddr_ready),
    .io_GepAddr_valid(ld_6_io_GepAddr_valid),
    .io_GepAddr_bits_predicate(ld_6_io_GepAddr_bits_predicate),
    .io_GepAddr_bits_data(ld_6_io_GepAddr_bits_data),
    .io_memReq_ready(ld_6_io_memReq_ready),
    .io_memReq_valid(ld_6_io_memReq_valid),
    .io_memReq_bits_address(ld_6_io_memReq_bits_address),
    .io_memResp_valid(ld_6_io_memResp_valid),
    .io_memResp_data(ld_6_io_memResp_data)
  );
  ComputeNode binaryOp_mul7 ( // @[test05.scala 93:29]
    .clock(binaryOp_mul7_clock),
    .reset(binaryOp_mul7_reset),
    .io_enable_ready(binaryOp_mul7_io_enable_ready),
    .io_enable_valid(binaryOp_mul7_io_enable_valid),
    .io_enable_bits_taskID(binaryOp_mul7_io_enable_bits_taskID),
    .io_enable_bits_control(binaryOp_mul7_io_enable_bits_control),
    .io_Out_0_ready(binaryOp_mul7_io_Out_0_ready),
    .io_Out_0_valid(binaryOp_mul7_io_Out_0_valid),
    .io_Out_0_bits_data(binaryOp_mul7_io_Out_0_bits_data),
    .io_LeftIO_ready(binaryOp_mul7_io_LeftIO_ready),
    .io_LeftIO_valid(binaryOp_mul7_io_LeftIO_valid),
    .io_LeftIO_bits_data(binaryOp_mul7_io_LeftIO_bits_data),
    .io_RightIO_ready(binaryOp_mul7_io_RightIO_ready),
    .io_RightIO_valid(binaryOp_mul7_io_RightIO_valid)
  );
  UnTypStore st_8 ( // @[test05.scala 96:20]
    .clock(st_8_clock),
    .reset(st_8_reset),
    .io_enable_ready(st_8_io_enable_ready),
    .io_enable_valid(st_8_io_enable_valid),
    .io_enable_bits_taskID(st_8_io_enable_bits_taskID),
    .io_enable_bits_control(st_8_io_enable_bits_control),
    .io_GepAddr_ready(st_8_io_GepAddr_ready),
    .io_GepAddr_valid(st_8_io_GepAddr_valid),
    .io_GepAddr_bits_data(st_8_io_GepAddr_bits_data),
    .io_inData_ready(st_8_io_inData_ready),
    .io_inData_valid(st_8_io_inData_valid),
    .io_inData_bits_data(st_8_io_inData_bits_data),
    .io_memReq_ready(st_8_io_memReq_ready),
    .io_memReq_valid(st_8_io_memReq_valid),
    .io_memReq_bits_address(st_8_io_memReq_bits_address),
    .io_memReq_bits_data(st_8_io_memReq_bits_data),
    .io_memResp_valid(st_8_io_memResp_valid)
  );
  ComputeNode_1 binaryOp_indvars_iv_next9 ( // @[test05.scala 99:41]
    .clock(binaryOp_indvars_iv_next9_clock),
    .reset(binaryOp_indvars_iv_next9_reset),
    .io_enable_ready(binaryOp_indvars_iv_next9_io_enable_ready),
    .io_enable_valid(binaryOp_indvars_iv_next9_io_enable_valid),
    .io_enable_bits_taskID(binaryOp_indvars_iv_next9_io_enable_bits_taskID),
    .io_enable_bits_control(binaryOp_indvars_iv_next9_io_enable_bits_control),
    .io_Out_0_ready(binaryOp_indvars_iv_next9_io_Out_0_ready),
    .io_Out_0_valid(binaryOp_indvars_iv_next9_io_Out_0_valid),
    .io_Out_0_bits_taskID(binaryOp_indvars_iv_next9_io_Out_0_bits_taskID),
    .io_Out_0_bits_data(binaryOp_indvars_iv_next9_io_Out_0_bits_data),
    .io_Out_1_ready(binaryOp_indvars_iv_next9_io_Out_1_ready),
    .io_Out_1_valid(binaryOp_indvars_iv_next9_io_Out_1_valid),
    .io_Out_1_bits_data(binaryOp_indvars_iv_next9_io_Out_1_bits_data),
    .io_LeftIO_ready(binaryOp_indvars_iv_next9_io_LeftIO_ready),
    .io_LeftIO_valid(binaryOp_indvars_iv_next9_io_LeftIO_valid),
    .io_LeftIO_bits_data(binaryOp_indvars_iv_next9_io_LeftIO_bits_data),
    .io_RightIO_ready(binaryOp_indvars_iv_next9_io_RightIO_ready),
    .io_RightIO_valid(binaryOp_indvars_iv_next9_io_RightIO_valid)
  );
  ComputeNode_2 icmp_exitcond10 ( // @[test05.scala 102:31]
    .clock(icmp_exitcond10_clock),
    .reset(icmp_exitcond10_reset),
    .io_enable_ready(icmp_exitcond10_io_enable_ready),
    .io_enable_valid(icmp_exitcond10_io_enable_valid),
    .io_enable_bits_taskID(icmp_exitcond10_io_enable_bits_taskID),
    .io_enable_bits_control(icmp_exitcond10_io_enable_bits_control),
    .io_Out_0_ready(icmp_exitcond10_io_Out_0_ready),
    .io_Out_0_valid(icmp_exitcond10_io_Out_0_valid),
    .io_Out_0_bits_taskID(icmp_exitcond10_io_Out_0_bits_taskID),
    .io_Out_0_bits_data(icmp_exitcond10_io_Out_0_bits_data),
    .io_LeftIO_ready(icmp_exitcond10_io_LeftIO_ready),
    .io_LeftIO_valid(icmp_exitcond10_io_LeftIO_valid),
    .io_LeftIO_bits_data(icmp_exitcond10_io_LeftIO_bits_data),
    .io_RightIO_ready(icmp_exitcond10_io_RightIO_ready),
    .io_RightIO_valid(icmp_exitcond10_io_RightIO_valid)
  );
  CBranchNodeVariable br_11 ( // @[test05.scala 105:21]
    .clock(br_11_clock),
    .reset(br_11_reset),
    .io_enable_ready(br_11_io_enable_ready),
    .io_enable_valid(br_11_io_enable_valid),
    .io_enable_bits_taskID(br_11_io_enable_bits_taskID),
    .io_enable_bits_control(br_11_io_enable_bits_control),
    .io_CmpIO_ready(br_11_io_CmpIO_ready),
    .io_CmpIO_valid(br_11_io_CmpIO_valid),
    .io_CmpIO_bits_taskID(br_11_io_CmpIO_bits_taskID),
    .io_CmpIO_bits_data(br_11_io_CmpIO_bits_data),
    .io_TrueOutput_0_ready(br_11_io_TrueOutput_0_ready),
    .io_TrueOutput_0_valid(br_11_io_TrueOutput_0_valid),
    .io_TrueOutput_0_bits_control(br_11_io_TrueOutput_0_bits_control),
    .io_FalseOutput_0_ready(br_11_io_FalseOutput_0_ready),
    .io_FalseOutput_0_valid(br_11_io_FalseOutput_0_valid),
    .io_FalseOutput_0_bits_taskID(br_11_io_FalseOutput_0_bits_taskID),
    .io_FalseOutput_0_bits_control(br_11_io_FalseOutput_0_bits_control)
  );
  ConstFastNode const0 ( // @[test05.scala 114:22]
    .clock(const0_clock),
    .reset(const0_reset),
    .io_enable_ready(const0_io_enable_ready),
    .io_enable_valid(const0_io_enable_valid),
    .io_enable_bits_taskID(const0_io_enable_bits_taskID),
    .io_Out_ready(const0_io_Out_ready),
    .io_Out_valid(const0_io_Out_valid)
  );
  ConstFastNode_1 const1 ( // @[test05.scala 117:22]
    .clock(const1_clock),
    .reset(const1_reset),
    .io_enable_ready(const1_io_enable_ready),
    .io_enable_valid(const1_io_enable_valid),
    .io_enable_bits_taskID(const1_io_enable_bits_taskID),
    .io_Out_ready(const1_io_Out_ready),
    .io_Out_valid(const1_io_Out_valid),
    .io_Out_bits_taskID(const1_io_Out_bits_taskID)
  );
  ConstFastNode_2 const2 ( // @[test05.scala 120:22]
    .clock(const2_clock),
    .reset(const2_reset),
    .io_enable_ready(const2_io_enable_ready),
    .io_enable_valid(const2_io_enable_valid),
    .io_enable_bits_taskID(const2_io_enable_bits_taskID),
    .io_Out_ready(const2_io_Out_ready),
    .io_Out_valid(const2_io_Out_valid)
  );
  ConstFastNode_3 const3 ( // @[test05.scala 123:22]
    .clock(const3_clock),
    .reset(const3_reset),
    .io_enable_ready(const3_io_enable_ready),
    .io_enable_valid(const3_io_enable_valid),
    .io_enable_bits_taskID(const3_io_enable_bits_taskID),
    .io_Out_ready(const3_io_Out_ready),
    .io_Out_valid(const3_io_Out_valid)
  );
  ConstFastNode_4 const4 ( // @[test05.scala 126:22]
    .clock(const4_clock),
    .reset(const4_reset),
    .io_enable_ready(const4_io_enable_ready),
    .io_enable_valid(const4_io_enable_valid),
    .io_enable_bits_taskID(const4_io_enable_bits_taskID),
    .io_Out_ready(const4_io_Out_ready),
    .io_Out_valid(const4_io_Out_valid)
  );
  assign io_in_ready = InputSplitter_io_In_ready; // @[test05.scala 43:23]
  assign io_MemReq_valid = MemCtrl_io_MemReq_valid; // @[test05.scala 39:13]
  assign io_MemReq_bits_addr = MemCtrl_io_MemReq_bits_addr; // @[test05.scala 39:13]
  assign io_MemReq_bits_data = MemCtrl_io_MemReq_bits_data; // @[test05.scala 39:13]
  assign io_MemReq_bits_mask = MemCtrl_io_MemReq_bits_mask; // @[test05.scala 39:13]
  assign io_MemReq_bits_tag = MemCtrl_io_MemReq_bits_tag; // @[test05.scala 39:13]
  assign io_MemReq_bits_iswrite = MemCtrl_io_MemReq_bits_iswrite; // @[test05.scala 39:13]
  assign io_out_valid = ret_3_io_Out_valid; // @[test05.scala 352:10]
  assign io_out_bits_data_field0_data = ret_3_io_Out_bits_data_field0_data; // @[test05.scala 352:10]
  assign MemCtrl_clock = clock;
  assign MemCtrl_reset = reset;
  assign MemCtrl_io_WriteIn_0_valid = st_8_io_memReq_valid; // @[test05.scala 296:25]
  assign MemCtrl_io_WriteIn_0_bits_address = st_8_io_memReq_bits_address; // @[test05.scala 296:25]
  assign MemCtrl_io_WriteIn_0_bits_data = st_8_io_memReq_bits_data; // @[test05.scala 296:25]
  assign MemCtrl_io_ReadIn_0_valid = ld_2_io_memReq_valid; // @[test05.scala 288:24]
  assign MemCtrl_io_ReadIn_0_bits_address = ld_2_io_memReq_bits_address; // @[test05.scala 288:24]
  assign MemCtrl_io_ReadIn_1_valid = ld_6_io_memReq_valid; // @[test05.scala 292:24]
  assign MemCtrl_io_ReadIn_1_bits_address = ld_6_io_memReq_bits_address; // @[test05.scala 292:24]
  assign MemCtrl_io_MemResp_valid = io_MemResp_valid; // @[test05.scala 40:22]
  assign MemCtrl_io_MemResp_bits_data = io_MemResp_bits_data; // @[test05.scala 40:22]
  assign MemCtrl_io_MemResp_bits_tag = io_MemResp_bits_tag; // @[test05.scala 40:22]
  assign MemCtrl_io_MemResp_bits_iswrite = io_MemResp_bits_iswrite; // @[test05.scala 40:22]
  assign MemCtrl_io_MemReq_ready = io_MemReq_ready; // @[test05.scala 39:13]
  assign InputSplitter_clock = clock;
  assign InputSplitter_reset = reset;
  assign InputSplitter_io_In_valid = io_in_valid; // @[test05.scala 43:23]
  assign InputSplitter_io_In_bits_data_field0_data = io_in_bits_data_field0_data; // @[test05.scala 43:23]
  assign InputSplitter_io_Out_enable_ready = bb_entry0_io_predicateIn_0_ready; // @[test05.scala 134:31]
  assign InputSplitter_io_Out_data_field0_0_ready = Loop_0_io_InLiveIn_0_ready; // @[test05.scala 178:25]
  assign InputSplitter_io_Out_data_field0_1_ready = Gep_arrayidx31_io_baseAddress_ready; // @[test05.scala 342:33]
  assign Loop_0_clock = clock;
  assign Loop_0_reset = reset;
  assign Loop_0_io_enable_valid = br_0_io_Out_0_valid; // @[test05.scala 160:20]
  assign Loop_0_io_enable_bits_control = br_0_io_Out_0_bits_control; // @[test05.scala 160:20]
  assign Loop_0_io_InLiveIn_0_valid = InputSplitter_io_Out_data_field0_0_valid; // @[test05.scala 178:25]
  assign Loop_0_io_InLiveIn_0_bits_data = InputSplitter_io_Out_data_field0_0_bits_data; // @[test05.scala 178:25]
  assign Loop_0_io_OutLiveIn_field0_0_ready = Gep_arrayidx5_io_baseAddress_ready; // @[test05.scala 186:32]
  assign Loop_0_io_activate_loop_start_ready = bb_for_body2_io_predicateIn_1_ready; // @[test05.scala 144:34]
  assign Loop_0_io_activate_loop_back_ready = bb_for_body2_io_predicateIn_0_ready; // @[test05.scala 146:34]
  assign Loop_0_io_loopBack_0_valid = br_11_io_FalseOutput_0_valid; // @[test05.scala 162:25]
  assign Loop_0_io_loopBack_0_bits_taskID = br_11_io_FalseOutput_0_bits_taskID; // @[test05.scala 162:25]
  assign Loop_0_io_loopBack_0_bits_control = br_11_io_FalseOutput_0_bits_control; // @[test05.scala 162:25]
  assign Loop_0_io_loopFinish_0_valid = br_11_io_TrueOutput_0_valid; // @[test05.scala 164:27]
  assign Loop_0_io_loopFinish_0_bits_control = br_11_io_TrueOutput_0_bits_control; // @[test05.scala 164:27]
  assign Loop_0_io_CarryDepenIn_0_valid = binaryOp_indvars_iv_next9_io_Out_0_valid; // @[test05.scala 206:29]
  assign Loop_0_io_CarryDepenIn_0_bits_taskID = binaryOp_indvars_iv_next9_io_Out_0_bits_taskID; // @[test05.scala 206:29]
  assign Loop_0_io_CarryDepenIn_0_bits_data = binaryOp_indvars_iv_next9_io_Out_0_bits_data; // @[test05.scala 206:29]
  assign Loop_0_io_CarryDepenOut_field0_0_ready = phiindvars_iv4_io_InData_1_ready; // @[test05.scala 214:31]
  assign Loop_0_io_loopExit_0_ready = bb_for_cond_cleanup1_io_predicateIn_0_ready; // @[test05.scala 142:42]
  assign bb_entry0_clock = clock;
  assign bb_entry0_reset = reset;
  assign bb_entry0_io_predicateIn_0_valid = InputSplitter_io_Out_enable_valid; // @[test05.scala 134:31]
  assign bb_entry0_io_predicateIn_0_bits_control = InputSplitter_io_Out_enable_bits_control; // @[test05.scala 134:31]
  assign bb_entry0_io_Out_0_ready = br_0_io_enable_ready; // @[test05.scala 222:18]
  assign bb_for_cond_cleanup1_clock = clock;
  assign bb_for_cond_cleanup1_reset = reset;
  assign bb_for_cond_cleanup1_io_predicateIn_0_valid = Loop_0_io_loopExit_0_valid; // @[test05.scala 142:42]
  assign bb_for_cond_cleanup1_io_predicateIn_0_bits_taskID = Loop_0_io_loopExit_0_bits_taskID; // @[test05.scala 142:42]
  assign bb_for_cond_cleanup1_io_predicateIn_0_bits_control = Loop_0_io_loopExit_0_bits_control; // @[test05.scala 142:42]
  assign bb_for_cond_cleanup1_io_Out_0_ready = const0_io_enable_ready; // @[test05.scala 225:20]
  assign bb_for_cond_cleanup1_io_Out_1_ready = Gep_arrayidx31_io_enable_ready; // @[test05.scala 227:28]
  assign bb_for_cond_cleanup1_io_Out_2_ready = ld_2_io_enable_ready; // @[test05.scala 230:18]
  assign bb_for_cond_cleanup1_io_Out_3_ready = ret_3_io_In_enable_ready; // @[test05.scala 233:22]
  assign bb_for_body2_clock = clock;
  assign bb_for_body2_reset = reset;
  assign bb_for_body2_io_MaskBB_0_ready = phiindvars_iv4_io_Mask_ready; // @[test05.scala 274:26]
  assign bb_for_body2_io_Out_0_ready = const1_io_enable_ready; // @[test05.scala 236:20]
  assign bb_for_body2_io_Out_1_ready = const2_io_enable_ready; // @[test05.scala 238:20]
  assign bb_for_body2_io_Out_2_ready = const3_io_enable_ready; // @[test05.scala 240:20]
  assign bb_for_body2_io_Out_3_ready = const4_io_enable_ready; // @[test05.scala 242:20]
  assign bb_for_body2_io_Out_4_ready = phiindvars_iv4_io_enable_ready; // @[test05.scala 244:28]
  assign bb_for_body2_io_Out_5_ready = Gep_arrayidx5_io_enable_ready; // @[test05.scala 247:27]
  assign bb_for_body2_io_Out_6_ready = ld_6_io_enable_ready; // @[test05.scala 250:18]
  assign bb_for_body2_io_Out_7_ready = binaryOp_mul7_io_enable_ready; // @[test05.scala 253:27]
  assign bb_for_body2_io_Out_8_ready = st_8_io_enable_ready; // @[test05.scala 256:18]
  assign bb_for_body2_io_Out_9_ready = binaryOp_indvars_iv_next9_io_enable_ready; // @[test05.scala 259:39]
  assign bb_for_body2_io_Out_10_ready = icmp_exitcond10_io_enable_ready; // @[test05.scala 262:29]
  assign bb_for_body2_io_Out_11_ready = br_11_io_enable_ready; // @[test05.scala 265:19]
  assign bb_for_body2_io_predicateIn_0_valid = Loop_0_io_activate_loop_back_valid; // @[test05.scala 146:34]
  assign bb_for_body2_io_predicateIn_0_bits_taskID = Loop_0_io_activate_loop_back_bits_taskID; // @[test05.scala 146:34]
  assign bb_for_body2_io_predicateIn_0_bits_control = Loop_0_io_activate_loop_back_bits_control; // @[test05.scala 146:34]
  assign bb_for_body2_io_predicateIn_1_valid = Loop_0_io_activate_loop_start_valid; // @[test05.scala 144:34]
  assign bb_for_body2_io_predicateIn_1_bits_taskID = Loop_0_io_activate_loop_start_bits_taskID; // @[test05.scala 144:34]
  assign bb_for_body2_io_predicateIn_1_bits_control = Loop_0_io_activate_loop_start_bits_control; // @[test05.scala 144:34]
  assign br_0_clock = clock;
  assign br_0_reset = reset;
  assign br_0_io_enable_valid = bb_entry0_io_Out_0_valid; // @[test05.scala 222:18]
  assign br_0_io_enable_bits_control = bb_entry0_io_Out_0_bits_control; // @[test05.scala 222:18]
  assign br_0_io_Out_0_ready = Loop_0_io_enable_ready; // @[test05.scala 160:20]
  assign Gep_arrayidx31_clock = clock;
  assign Gep_arrayidx31_reset = reset;
  assign Gep_arrayidx31_io_enable_valid = bb_for_cond_cleanup1_io_Out_1_valid; // @[test05.scala 227:28]
  assign Gep_arrayidx31_io_enable_bits_taskID = bb_for_cond_cleanup1_io_Out_1_bits_taskID; // @[test05.scala 227:28]
  assign Gep_arrayidx31_io_enable_bits_control = bb_for_cond_cleanup1_io_Out_1_bits_control; // @[test05.scala 227:28]
  assign Gep_arrayidx31_io_Out_0_ready = ld_2_io_GepAddr_ready; // @[test05.scala 322:19]
  assign Gep_arrayidx31_io_baseAddress_valid = InputSplitter_io_Out_data_field0_1_valid; // @[test05.scala 342:33]
  assign Gep_arrayidx31_io_baseAddress_bits_data = InputSplitter_io_Out_data_field0_1_bits_data; // @[test05.scala 342:33]
  assign Gep_arrayidx31_io_idx_0_valid = const0_io_Out_valid; // @[test05.scala 312:28]
  assign ld_2_clock = clock;
  assign ld_2_reset = reset;
  assign ld_2_io_enable_valid = bb_for_cond_cleanup1_io_Out_2_valid; // @[test05.scala 230:18]
  assign ld_2_io_enable_bits_taskID = bb_for_cond_cleanup1_io_Out_2_bits_taskID; // @[test05.scala 230:18]
  assign ld_2_io_enable_bits_control = bb_for_cond_cleanup1_io_Out_2_bits_control; // @[test05.scala 230:18]
  assign ld_2_io_Out_0_ready = ret_3_io_In_data_field0_ready; // @[test05.scala 324:30]
  assign ld_2_io_GepAddr_valid = Gep_arrayidx31_io_Out_0_valid; // @[test05.scala 322:19]
  assign ld_2_io_GepAddr_bits_predicate = Gep_arrayidx31_io_Out_0_bits_predicate; // @[test05.scala 322:19]
  assign ld_2_io_GepAddr_bits_data = Gep_arrayidx31_io_Out_0_bits_data; // @[test05.scala 322:19]
  assign ld_2_io_memReq_ready = MemCtrl_io_ReadIn_0_ready; // @[test05.scala 288:24]
  assign ld_2_io_memResp_valid = MemCtrl_io_ReadOut_0_valid; // @[test05.scala 290:19]
  assign ld_2_io_memResp_data = MemCtrl_io_ReadOut_0_data; // @[test05.scala 290:19]
  assign ret_3_clock = clock;
  assign ret_3_reset = reset;
  assign ret_3_io_In_enable_valid = bb_for_cond_cleanup1_io_Out_3_valid; // @[test05.scala 233:22]
  assign ret_3_io_In_enable_bits_taskID = bb_for_cond_cleanup1_io_Out_3_bits_taskID; // @[test05.scala 233:22]
  assign ret_3_io_In_data_field0_valid = ld_2_io_Out_0_valid; // @[test05.scala 324:30]
  assign ret_3_io_In_data_field0_bits_data = ld_2_io_Out_0_bits_data[31:0]; // @[test05.scala 324:30]
  assign ret_3_io_Out_ready = io_out_ready; // @[test05.scala 352:10]
  assign phiindvars_iv4_clock = clock;
  assign phiindvars_iv4_reset = reset;
  assign phiindvars_iv4_io_enable_valid = bb_for_body2_io_Out_4_valid; // @[test05.scala 244:28]
  assign phiindvars_iv4_io_enable_bits_control = bb_for_body2_io_Out_4_bits_control; // @[test05.scala 244:28]
  assign phiindvars_iv4_io_InData_0_valid = const1_io_Out_valid; // @[test05.scala 314:31]
  assign phiindvars_iv4_io_InData_0_bits_taskID = const1_io_Out_bits_taskID; // @[test05.scala 314:31]
  assign phiindvars_iv4_io_InData_1_valid = Loop_0_io_CarryDepenOut_field0_0_valid; // @[test05.scala 214:31]
  assign phiindvars_iv4_io_InData_1_bits_taskID = Loop_0_io_CarryDepenOut_field0_0_bits_taskID; // @[test05.scala 214:31]
  assign phiindvars_iv4_io_InData_1_bits_data = Loop_0_io_CarryDepenOut_field0_0_bits_data; // @[test05.scala 214:31]
  assign phiindvars_iv4_io_Mask_valid = bb_for_body2_io_MaskBB_0_valid; // @[test05.scala 274:26]
  assign phiindvars_iv4_io_Mask_bits = bb_for_body2_io_MaskBB_0_bits; // @[test05.scala 274:26]
  assign phiindvars_iv4_io_Out_0_ready = Gep_arrayidx5_io_idx_0_ready; // @[test05.scala 326:27]
  assign phiindvars_iv4_io_Out_1_ready = binaryOp_indvars_iv_next9_io_LeftIO_ready; // @[test05.scala 328:39]
  assign Gep_arrayidx5_clock = clock;
  assign Gep_arrayidx5_reset = reset;
  assign Gep_arrayidx5_io_enable_valid = bb_for_body2_io_Out_5_valid; // @[test05.scala 247:27]
  assign Gep_arrayidx5_io_enable_bits_taskID = bb_for_body2_io_Out_5_bits_taskID; // @[test05.scala 247:27]
  assign Gep_arrayidx5_io_enable_bits_control = bb_for_body2_io_Out_5_bits_control; // @[test05.scala 247:27]
  assign Gep_arrayidx5_io_Out_0_ready = ld_6_io_GepAddr_ready; // @[test05.scala 330:19]
  assign Gep_arrayidx5_io_Out_1_ready = st_8_io_GepAddr_ready; // @[test05.scala 332:19]
  assign Gep_arrayidx5_io_baseAddress_valid = Loop_0_io_OutLiveIn_field0_0_valid; // @[test05.scala 186:32]
  assign Gep_arrayidx5_io_baseAddress_bits_data = Loop_0_io_OutLiveIn_field0_0_bits_data; // @[test05.scala 186:32]
  assign Gep_arrayidx5_io_idx_0_valid = phiindvars_iv4_io_Out_0_valid; // @[test05.scala 326:27]
  assign Gep_arrayidx5_io_idx_0_bits_data = phiindvars_iv4_io_Out_0_bits_data; // @[test05.scala 326:27]
  assign ld_6_clock = clock;
  assign ld_6_reset = reset;
  assign ld_6_io_enable_valid = bb_for_body2_io_Out_6_valid; // @[test05.scala 250:18]
  assign ld_6_io_enable_bits_taskID = bb_for_body2_io_Out_6_bits_taskID; // @[test05.scala 250:18]
  assign ld_6_io_enable_bits_control = bb_for_body2_io_Out_6_bits_control; // @[test05.scala 250:18]
  assign ld_6_io_Out_0_ready = binaryOp_mul7_io_LeftIO_ready; // @[test05.scala 334:27]
  assign ld_6_io_GepAddr_valid = Gep_arrayidx5_io_Out_0_valid; // @[test05.scala 330:19]
  assign ld_6_io_GepAddr_bits_predicate = Gep_arrayidx5_io_Out_0_bits_predicate; // @[test05.scala 330:19]
  assign ld_6_io_GepAddr_bits_data = Gep_arrayidx5_io_Out_0_bits_data; // @[test05.scala 330:19]
  assign ld_6_io_memReq_ready = MemCtrl_io_ReadIn_1_ready; // @[test05.scala 292:24]
  assign ld_6_io_memResp_valid = MemCtrl_io_ReadOut_1_valid; // @[test05.scala 294:19]
  assign ld_6_io_memResp_data = MemCtrl_io_ReadOut_1_data; // @[test05.scala 294:19]
  assign binaryOp_mul7_clock = clock;
  assign binaryOp_mul7_reset = reset;
  assign binaryOp_mul7_io_enable_valid = bb_for_body2_io_Out_7_valid; // @[test05.scala 253:27]
  assign binaryOp_mul7_io_enable_bits_taskID = bb_for_body2_io_Out_7_bits_taskID; // @[test05.scala 253:27]
  assign binaryOp_mul7_io_enable_bits_control = bb_for_body2_io_Out_7_bits_control; // @[test05.scala 253:27]
  assign binaryOp_mul7_io_Out_0_ready = st_8_io_inData_ready; // @[test05.scala 336:18]
  assign binaryOp_mul7_io_LeftIO_valid = ld_6_io_Out_0_valid; // @[test05.scala 334:27]
  assign binaryOp_mul7_io_LeftIO_bits_data = ld_6_io_Out_0_bits_data; // @[test05.scala 334:27]
  assign binaryOp_mul7_io_RightIO_valid = const2_io_Out_valid; // @[test05.scala 316:28]
  assign st_8_clock = clock;
  assign st_8_reset = reset;
  assign st_8_io_enable_valid = bb_for_body2_io_Out_8_valid; // @[test05.scala 256:18]
  assign st_8_io_enable_bits_taskID = bb_for_body2_io_Out_8_bits_taskID; // @[test05.scala 256:18]
  assign st_8_io_enable_bits_control = bb_for_body2_io_Out_8_bits_control; // @[test05.scala 256:18]
  assign st_8_io_GepAddr_valid = Gep_arrayidx5_io_Out_1_valid; // @[test05.scala 332:19]
  assign st_8_io_GepAddr_bits_data = Gep_arrayidx5_io_Out_1_bits_data; // @[test05.scala 332:19]
  assign st_8_io_inData_valid = binaryOp_mul7_io_Out_0_valid; // @[test05.scala 336:18]
  assign st_8_io_inData_bits_data = binaryOp_mul7_io_Out_0_bits_data; // @[test05.scala 336:18]
  assign st_8_io_memReq_ready = MemCtrl_io_WriteIn_0_ready; // @[test05.scala 296:25]
  assign st_8_io_memResp_valid = MemCtrl_io_WriteOut_0_valid; // @[test05.scala 298:19]
  assign binaryOp_indvars_iv_next9_clock = clock;
  assign binaryOp_indvars_iv_next9_reset = reset;
  assign binaryOp_indvars_iv_next9_io_enable_valid = bb_for_body2_io_Out_9_valid; // @[test05.scala 259:39]
  assign binaryOp_indvars_iv_next9_io_enable_bits_taskID = bb_for_body2_io_Out_9_bits_taskID; // @[test05.scala 259:39]
  assign binaryOp_indvars_iv_next9_io_enable_bits_control = bb_for_body2_io_Out_9_bits_control; // @[test05.scala 259:39]
  assign binaryOp_indvars_iv_next9_io_Out_0_ready = Loop_0_io_CarryDepenIn_0_ready; // @[test05.scala 206:29]
  assign binaryOp_indvars_iv_next9_io_Out_1_ready = icmp_exitcond10_io_LeftIO_ready; // @[test05.scala 338:29]
  assign binaryOp_indvars_iv_next9_io_LeftIO_valid = phiindvars_iv4_io_Out_1_valid; // @[test05.scala 328:39]
  assign binaryOp_indvars_iv_next9_io_LeftIO_bits_data = phiindvars_iv4_io_Out_1_bits_data; // @[test05.scala 328:39]
  assign binaryOp_indvars_iv_next9_io_RightIO_valid = const3_io_Out_valid; // @[test05.scala 318:40]
  assign icmp_exitcond10_clock = clock;
  assign icmp_exitcond10_reset = reset;
  assign icmp_exitcond10_io_enable_valid = bb_for_body2_io_Out_10_valid; // @[test05.scala 262:29]
  assign icmp_exitcond10_io_enable_bits_taskID = bb_for_body2_io_Out_10_bits_taskID; // @[test05.scala 262:29]
  assign icmp_exitcond10_io_enable_bits_control = bb_for_body2_io_Out_10_bits_control; // @[test05.scala 262:29]
  assign icmp_exitcond10_io_Out_0_ready = br_11_io_CmpIO_ready; // @[test05.scala 340:18]
  assign icmp_exitcond10_io_LeftIO_valid = binaryOp_indvars_iv_next9_io_Out_1_valid; // @[test05.scala 338:29]
  assign icmp_exitcond10_io_LeftIO_bits_data = binaryOp_indvars_iv_next9_io_Out_1_bits_data; // @[test05.scala 338:29]
  assign icmp_exitcond10_io_RightIO_valid = const4_io_Out_valid; // @[test05.scala 320:30]
  assign br_11_clock = clock;
  assign br_11_reset = reset;
  assign br_11_io_enable_valid = bb_for_body2_io_Out_11_valid; // @[test05.scala 265:19]
  assign br_11_io_enable_bits_taskID = bb_for_body2_io_Out_11_bits_taskID; // @[test05.scala 265:19]
  assign br_11_io_enable_bits_control = bb_for_body2_io_Out_11_bits_control; // @[test05.scala 265:19]
  assign br_11_io_CmpIO_valid = icmp_exitcond10_io_Out_0_valid; // @[test05.scala 340:18]
  assign br_11_io_CmpIO_bits_taskID = icmp_exitcond10_io_Out_0_bits_taskID; // @[test05.scala 340:18]
  assign br_11_io_CmpIO_bits_data = icmp_exitcond10_io_Out_0_bits_data; // @[test05.scala 340:18]
  assign br_11_io_TrueOutput_0_ready = Loop_0_io_loopFinish_0_ready; // @[test05.scala 164:27]
  assign br_11_io_FalseOutput_0_ready = Loop_0_io_loopBack_0_ready; // @[test05.scala 162:25]
  assign const0_clock = clock;
  assign const0_reset = reset;
  assign const0_io_enable_valid = bb_for_cond_cleanup1_io_Out_0_valid; // @[test05.scala 225:20]
  assign const0_io_enable_bits_taskID = bb_for_cond_cleanup1_io_Out_0_bits_taskID; // @[test05.scala 225:20]
  assign const0_io_Out_ready = Gep_arrayidx31_io_idx_0_ready; // @[test05.scala 312:28]
  assign const1_clock = clock;
  assign const1_reset = reset;
  assign const1_io_enable_valid = bb_for_body2_io_Out_0_valid; // @[test05.scala 236:20]
  assign const1_io_enable_bits_taskID = bb_for_body2_io_Out_0_bits_taskID; // @[test05.scala 236:20]
  assign const1_io_Out_ready = phiindvars_iv4_io_InData_0_ready; // @[test05.scala 314:31]
  assign const2_clock = clock;
  assign const2_reset = reset;
  assign const2_io_enable_valid = bb_for_body2_io_Out_1_valid; // @[test05.scala 238:20]
  assign const2_io_enable_bits_taskID = bb_for_body2_io_Out_1_bits_taskID; // @[test05.scala 238:20]
  assign const2_io_Out_ready = binaryOp_mul7_io_RightIO_ready; // @[test05.scala 316:28]
  assign const3_clock = clock;
  assign const3_reset = reset;
  assign const3_io_enable_valid = bb_for_body2_io_Out_2_valid; // @[test05.scala 240:20]
  assign const3_io_enable_bits_taskID = bb_for_body2_io_Out_2_bits_taskID; // @[test05.scala 240:20]
  assign const3_io_Out_ready = binaryOp_indvars_iv_next9_io_RightIO_ready; // @[test05.scala 318:40]
  assign const4_clock = clock;
  assign const4_reset = reset;
  assign const4_io_enable_valid = bb_for_body2_io_Out_3_valid; // @[test05.scala 242:20]
  assign const4_io_enable_bits_taskID = bb_for_body2_io_Out_3_bits_taskID; // @[test05.scala 242:20]
  assign const4_io_Out_ready = icmp_exitcond10_io_RightIO_ready; // @[test05.scala 320:30]
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
  wire [63:0] vcr_io_vcr_ptrs_0; // @[DandelionShell.scala 164:19]
  wire  cache_clock; // @[DandelionShell.scala 165:21]
  wire  cache_reset; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_flush; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_flush_done; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_req_ready; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_req_valid; // @[DandelionShell.scala 165:21]
  wire [63:0] cache_io_cpu_req_bits_addr; // @[DandelionShell.scala 165:21]
  wire [63:0] cache_io_cpu_req_bits_data; // @[DandelionShell.scala 165:21]
  wire [7:0] cache_io_cpu_req_bits_mask; // @[DandelionShell.scala 165:21]
  wire [7:0] cache_io_cpu_req_bits_tag; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_req_bits_iswrite; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_resp_valid; // @[DandelionShell.scala 165:21]
  wire [63:0] cache_io_cpu_resp_bits_data; // @[DandelionShell.scala 165:21]
  wire [7:0] cache_io_cpu_resp_bits_tag; // @[DandelionShell.scala 165:21]
  wire  cache_io_cpu_resp_bits_iswrite; // @[DandelionShell.scala 165:21]
  wire  accel_clock; // @[DandelionShell.scala 167:21]
  wire  accel_reset; // @[DandelionShell.scala 167:21]
  wire  accel_io_in_ready; // @[DandelionShell.scala 167:21]
  wire  accel_io_in_valid; // @[DandelionShell.scala 167:21]
  wire [31:0] accel_io_in_bits_data_field0_data; // @[DandelionShell.scala 167:21]
  wire  accel_io_MemResp_valid; // @[DandelionShell.scala 167:21]
  wire [63:0] accel_io_MemResp_bits_data; // @[DandelionShell.scala 167:21]
  wire [7:0] accel_io_MemResp_bits_tag; // @[DandelionShell.scala 167:21]
  wire  accel_io_MemResp_bits_iswrite; // @[DandelionShell.scala 167:21]
  wire  accel_io_MemReq_ready; // @[DandelionShell.scala 167:21]
  wire  accel_io_MemReq_valid; // @[DandelionShell.scala 167:21]
  wire [63:0] accel_io_MemReq_bits_addr; // @[DandelionShell.scala 167:21]
  wire [63:0] accel_io_MemReq_bits_data; // @[DandelionShell.scala 167:21]
  wire [7:0] accel_io_MemReq_bits_mask; // @[DandelionShell.scala 167:21]
  wire [7:0] accel_io_MemReq_bits_tag; // @[DandelionShell.scala 167:21]
  wire  accel_io_MemReq_bits_iswrite; // @[DandelionShell.scala 167:21]
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
  reg [63:0] ptrs_0; // @[Reg.scala 27:20]
  reg [63:0] _RAND_2;
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[DandelionShell.scala 230:15]
  wire  _T_9; // @[DandelionShell.scala 230:15]
  wire  _T_16; // @[Decoupled.scala 40:37]
  wire  _GEN_4; // @[DandelionShell.scala 229:31]
  wire  _T_17; // @[Conditional.scala 37:30]
  wire  _T_18; // @[Decoupled.scala 40:37]
  wire  _T_19; // @[Conditional.scala 37:30]
  wire  _T_20; // @[Conditional.scala 37:30]
  wire  _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_16; // @[DandelionShell.scala 230:15]
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
    .io_vcr_ptrs_0(vcr_io_vcr_ptrs_0)
  );
  SimpleCache cache ( // @[DandelionShell.scala 165:21]
    .clock(cache_clock),
    .reset(cache_reset),
    .io_cpu_flush(cache_io_cpu_flush),
    .io_cpu_flush_done(cache_io_cpu_flush_done),
    .io_cpu_req_ready(cache_io_cpu_req_ready),
    .io_cpu_req_valid(cache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(cache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_data(cache_io_cpu_req_bits_data),
    .io_cpu_req_bits_mask(cache_io_cpu_req_bits_mask),
    .io_cpu_req_bits_tag(cache_io_cpu_req_bits_tag),
    .io_cpu_req_bits_iswrite(cache_io_cpu_req_bits_iswrite),
    .io_cpu_resp_valid(cache_io_cpu_resp_valid),
    .io_cpu_resp_bits_data(cache_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_tag(cache_io_cpu_resp_bits_tag),
    .io_cpu_resp_bits_iswrite(cache_io_cpu_resp_bits_iswrite)
  );
  test05DF accel ( // @[DandelionShell.scala 167:21]
    .clock(accel_clock),
    .reset(accel_reset),
    .io_in_ready(accel_io_in_ready),
    .io_in_valid(accel_io_in_valid),
    .io_in_bits_data_field0_data(accel_io_in_bits_data_field0_data),
    .io_MemResp_valid(accel_io_MemResp_valid),
    .io_MemResp_bits_data(accel_io_MemResp_bits_data),
    .io_MemResp_bits_tag(accel_io_MemResp_bits_tag),
    .io_MemResp_bits_iswrite(accel_io_MemResp_bits_iswrite),
    .io_MemReq_ready(accel_io_MemReq_ready),
    .io_MemReq_valid(accel_io_MemReq_valid),
    .io_MemReq_bits_addr(accel_io_MemReq_bits_addr),
    .io_MemReq_bits_data(accel_io_MemReq_bits_data),
    .io_MemReq_bits_mask(accel_io_MemReq_bits_mask),
    .io_MemReq_bits_tag(accel_io_MemReq_bits_tag),
    .io_MemReq_bits_iswrite(accel_io_MemReq_bits_iswrite),
    .io_out_ready(accel_io_out_ready),
    .io_out_valid(accel_io_out_valid),
    .io_out_bits_data_field0_data(accel_io_out_bits_data_field0_data)
  );
  assign _T = state == 2'h0; // @[DandelionShell.scala 180:14]
  assign _T_1 = state != 2'h2; // @[DandelionShell.scala 182:20]
  assign _T_3 = cycles + 32'h1; // @[DandelionShell.scala 183:22]
  assign _T_7 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_8 = $unsigned(reset); // @[DandelionShell.scala 230:15]
  assign _T_9 = _T_8 == 1'h0; // @[DandelionShell.scala 230:15]
  assign _T_16 = accel_io_in_ready & accel_io_in_valid; // @[Decoupled.scala 40:37]
  assign _GEN_4 = vcr_io_vcr_launch; // @[DandelionShell.scala 229:31]
  assign _T_17 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_18 = accel_io_out_ready & accel_io_out_valid; // @[Decoupled.scala 40:37]
  assign _T_19 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_20 = 2'h3 == state; // @[Conditional.scala 37:30]
  assign _GEN_12 = _T_17 ? 1'h0 : _T_19; // @[Conditional.scala 39:67]
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
  assign cache_io_cpu_flush = _T_7 ? 1'h0 : _GEN_12; // @[DandelionShell.scala 225:22 DandelionShell.scala 247:26]
  assign cache_io_cpu_req_valid = accel_io_MemReq_valid; // @[DandelionShell.scala 169:20]
  assign cache_io_cpu_req_bits_addr = accel_io_MemReq_bits_addr; // @[DandelionShell.scala 169:20]
  assign cache_io_cpu_req_bits_data = accel_io_MemReq_bits_data; // @[DandelionShell.scala 169:20]
  assign cache_io_cpu_req_bits_mask = accel_io_MemReq_bits_mask; // @[DandelionShell.scala 169:20]
  assign cache_io_cpu_req_bits_tag = accel_io_MemReq_bits_tag; // @[DandelionShell.scala 169:20]
  assign cache_io_cpu_req_bits_iswrite = accel_io_MemReq_bits_iswrite; // @[DandelionShell.scala 169:20]
  assign accel_clock = clock;
  assign accel_reset = reset;
  assign accel_io_in_valid = _T_7 & _GEN_4; // @[DandelionShell.scala 221:21 DandelionShell.scala 235:27]
  assign accel_io_in_bits_data_field0_data = ptrs_0[31:0]; // @[DandelionShell.scala 211:41]
  assign accel_io_MemResp_valid = cache_io_cpu_resp_valid; // @[DandelionShell.scala 170:20]
  assign accel_io_MemResp_bits_data = cache_io_cpu_resp_bits_data; // @[DandelionShell.scala 170:20]
  assign accel_io_MemResp_bits_tag = cache_io_cpu_resp_bits_tag; // @[DandelionShell.scala 170:20]
  assign accel_io_MemResp_bits_iswrite = cache_io_cpu_resp_bits_iswrite; // @[DandelionShell.scala 170:20]
  assign accel_io_MemReq_ready = cache_io_cpu_req_ready; // @[DandelionShell.scala 169:20]
  assign accel_io_out_ready = state == 2'h1; // @[DandelionShell.scala 222:22]
  assign _GEN_16 = _T_7 & vcr_io_vcr_launch; // @[DandelionShell.scala 230:15]
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
  ptrs_0 = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_7) begin
      if (vcr_io_vcr_launch) begin
        if (_T_16) begin
          state <= 2'h1;
        end
      end
    end else if (_T_17) begin
      if (_T_18) begin
        state <= 2'h2;
      end
    end else if (_T_19) begin
      if (cache_io_cpu_flush_done) begin
        state <= 2'h3;
      end
    end else if (_T_20) begin
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
      ptrs_0 <= 64'h0;
    end else if (_T) begin
      ptrs_0 <= vcr_io_vcr_ptrs_0;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_9) begin
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
        if (_GEN_16 & _T_9) begin
          $fwrite(32'h80000002,"ptr(0): %d, ",ptrs_0); // @[DandelionShell.scala 231:46]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_16 & _T_9) begin
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
        if (_GEN_16 & _T_9) begin
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
