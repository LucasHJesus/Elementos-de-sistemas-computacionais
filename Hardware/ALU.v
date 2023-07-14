/* módulo ALU */

`ifndef _ALU_
`define _ALU_

`include "Mux16.v"
`include "Not16.v"
`include "And16.v"
`include "Adder16.v"
`include "Not16.v"
`include "Nor16Way.v"


module ALU(out, zr, ng, x, y, zx, nx, zy, ny, f, no);

    input [15:0] x;
    input [15:0] y;
    input zx, nx, zy, ny, f, no;
    output [15:0] out; 
    output zr, ng;
    wire [15:0] W_MuxZX, W_MuxZX_Not, W_MuxNX;
    wire [15:0] W_MuxZY, W_MuxZY_Not, W_MuxNY;
    wire [15:0] W_AndOut,W_AdderOut, W_OprOut, W_OprOut_Not;
    wire overflow;

    // Descrição de conexões internas do módulo
    //Flags de entrada ZX, ZY
    Mux16 MuxZX(W_MuxZX, x, 16'b0,zx);
    Mux16 MuxZY(W_MuxZY, y, 16'b0,zy);

    //Flags de entrada NX NY
    Not16 NotZX(W_MuxZX_Not,W_MuxZX);
    Not16 NotZY(W_MuxZY_Not,W_MuxZY);

    Mux16 MuxNX(W_MuxNX, W_MuxZX, W_MuxZX_Not, nx);
    Mux16 MuxNY(W_MuxNY, W_MuxZY, W_MuxZY_Not, ny);

    And16 And1(W_AndOut,W_MuxNX, W_MuxNY);
    Adder16 Adder1(W_AdderOut,overflow, W_MuxNX, W_MuxNY);

    //Seletor de operação
    Mux16 MuxOpr(W_OprOut,W_AndOut, W_AdderOut, f);

    //flag de entrada no e saida out
    Not16 NotOut (W_OprOut_Not,W_OprOut);
    Mux16 MuxOut(out,W_OprOut,W_OprOut_Not, no);

    assign ng = out[15];
    Nor16Way NorZR(zr,out);



endmodule

`endif