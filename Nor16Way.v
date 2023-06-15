/* módulo Nor16Way */

`ifndef _Nor16Way_
`define _Nor16Way_
`include "Or8Way.v"

module Nor16Way(out, in);
    input [15:0] in ;
    output out ;
    wire w1,w2,w3;

    // Descrição de conexões internas do módulo

    Or8Way or1(w1,in[15],in[14],in[13],in[12],in[11],in[10],in[9],in[8]);
    Or8Way or2(w2,in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]);
    or or3 (w3,w1,w2);
    not (out,w3);

endmodule

`endif