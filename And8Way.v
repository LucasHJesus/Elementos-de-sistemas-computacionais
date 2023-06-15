/* módulo And8Way */

`ifndef _And8Way_
`define _And8Way_

module And8Way(out,in1,in2,in3,in4,in5,in6,in7,in8);
    input in1,in2,in3,in4,in5,in6,in7,in8 ;
    output out ;
    wire w1,w2,w3,w4w5,w6;

    // Descrição de conexões internas do módulo

    and and0(w1,in1,in2);
    and and1(w2,in3,in4);
    and and2(w3,in5,in6);
    and and3(w4,in7,in8);
    and and4(w5,w1,w2);
    and and6(w6,w3,w4);
    and and7(out,w5,w6);
endmodule

`endif