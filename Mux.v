/* módulo Mux */

`ifndef _Mux_
`define _Mux_

module Mux(out, a, b, sel);
    input a, b, sel;
    output out;
    wire w1, w2, w3;
    
    //desenho trocado, porta a e b invertidas
    
    nand nand0(w1, a, w3);
    nand nand1(w2, b, sel);
    nand nand2(out, w1, w2);
    not not0(w3, sel);


endmodule

`endif