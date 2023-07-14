/* módulo Or8Way */

`ifndef _Or8Way_
`define _Or8Way_

module Or8Way(out,in1,in2,in3,in4,in5,in6,in7,in8);
    input in1,in2,in3,in4,in5,in6,in7,in8 ;
    output out ;
    wire w1,w2,w3,w4w5,w6;

    // Descrição de conexões internas do módulo

    or or0(w1,in1,in2);
    or or1(w2,in3,in4);
    or or2(w3,in5,in6);
    or or3(w4,in7,in8);
    or or4(w5,w1,w2);
    or or6(w6,w3,w4);
    or or7(out,w5,w6);
endmodule

`endif