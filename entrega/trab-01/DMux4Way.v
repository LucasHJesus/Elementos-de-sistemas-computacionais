/* módulo DMux4Way */

`ifndef _DMux4Way_
`define _DMux4Way_
`include "DMux.v"

module DMux4Way(out1, out2, out3, out4, in, sel);
    input in ;
    input [1:0] sel;
    output out1, out2, out3, out4;
    wire w1, w2;

    // Descrição de conexões internas do módulo

    DMux DMux1(w1,w2, in, sel[1]);
    DMux DMux2(out1,out2, w1, sel[0]);
    DMux DMux3(out3,out4, w2, sel[0]);
endmodule

`endif