/* módulo ProgramCounter */
//
`ifndef _ProgramCounter_
`define _ProgramCounter_

`include "Mux16.v"
`include "Increment16.v"
`include "Register16.v"

module ProgramCounter(out, in, load, inc, reset, clk);
    input [15:0] in;
    input load, inc, reset, clk;
    output [15:0] out;
    wire [15:0] W_inc, W_mux0, W_mux1, W_mux2;

    Increment16 inc0(W_inc, out);

    Mux16 mux0(W_mux0, out, W_inc, inc);
    Mux16 mux1(W_mux1, W_mux0, in, load);
    Mux16 mux2(W_mux2, W_mux1, 16'b0000000000000000, reset);

    Register16 rg0(out, W_mux2, 1'b1, clk);

    // Descrição de conexões internas do módulo

endmodule

`endif