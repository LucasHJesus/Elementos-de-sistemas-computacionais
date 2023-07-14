/* módulo Mux4Way */

`ifndef _Mux4Way_
`define _Mux4Way_
`include "Mux.v"

module Mux4Way(out, a,b,c,d,sel);
    input a, b, c, d;
    input [1:0] sel;
    output out;
    wire w1,w2;

    // Descrição de conexões internas do módulo

    Mux mux0(w1, a, b, sel[0]);
    Mux mux1(w2, c, d, sel[0]);
    Mux mux2(out, w1, w2, sel[1]);

endmodule

`endif