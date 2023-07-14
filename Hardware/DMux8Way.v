/* módulo DMux8Way */

`ifndef _DMux8Way_
`define DMux8Way

`include "DMux4Way.v"

module DMux8Way(a, b, c, d, e, f, g, h, in, sel);

    input in; 
    input [2:0] sel;
    output a, b, c, d, e, f, g, h;
    wire w1, w2;

    // Descrição de conexões internas do módulo

    DMux DMux1(w1, w2, in, sel[2]);
    DMux4Way DMux2(a, b, c, d, w1, sel[1:0]);
    DMux4Way DMux3(e, f, g, h, w2, sel[1:0]);

endmodule

`endif