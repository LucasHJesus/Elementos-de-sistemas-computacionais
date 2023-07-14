/* módulo DFF */

`ifndef _DFF_
`define _DFF_

module DFF(Q, D, CLK);
    input D, CLK ;
    output Q, Qnot ;
    wire w1, w2,w3,w4,w5,w6,w7,w8,w9;

    // Descrição de conexões internas do módulo
    //master
    not not1(W1, D);
    nand nand1(w2, D, CLK);
    nand nand2(w5,w2,w3);
    nand nand3(w4,w1,CLK);
    nand nand4(w3,w4,w5);
    //slave
    not not2(w7, CLK);
    not not3(w5,w6);
    nand nand5(w8,w5,w7);
    nand nand6(Q,w8,Qnot);
    nand nand7(w9,w6,w7);
    nand nand8(Qnot, w9, Q);
endmodule

`endif