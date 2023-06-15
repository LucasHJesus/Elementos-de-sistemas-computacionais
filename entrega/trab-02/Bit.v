/* módulo Bit */
/*Lucas Humberto Jesus de Lima - 12011ECP011*/

`ifndef _Bit_
`define Bit

`include "Mux.v"
`include "Dlatch.v"

module Bit(out, in, load, clk);

    input in, load, clk;
    output out;
    wire w1;

    // Descrição de conexões internas do módulo

    Mux Mux1       (w1, out, in, load);
    DLatch DLatch1 (out, w1, clk);

endmodule

`endif