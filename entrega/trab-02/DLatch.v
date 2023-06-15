/* módulo DLatch */
/*Lucas Humberto Jesus de Lima - 12011ECP011*/

`ifndef _DLatch_
`define DLatch

module DLatch(q, d, clk);

    input d, clk;
    output q;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

    // Descrição de conexões internas do módulo
    //Master
    not not1   (w1, d);
    nand nand1 (w2, d, clk);
    nand nand2 (w5, w2, w3);
    nand nand3 (w4, w1, clk);
    nand nand4 (w3, w4, w5);

    //Slave
    not not2   (w7, clk);
    not not3   (w6, w5);
    nand nand5 (w8, w5, w7);
    nand nand6 (q, w8, w10);
    nand nand7 (w9, w6, w7);
    nand nand8 (w10, q, w9);


endmodule

`endif