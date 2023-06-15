/*  
    Lucas Humberto Jesus de Lima 
    12011ECP011
    Elementos de Sistemas Computacionais
*/

/* módulo CPU */

`ifndef _CPU_
`define _CPU_
`include "ProgramCounter.v"
`include "ALU.v"
`include "Mux16.v"
`include "Register16.v"

module CPU(pc, addrM, outM, writeM, instruct, inM, reset, clk);
//Input/Outout
    input  [15:0] instruct, inM; 
    input  reset, clk;
    output [15:0] pc, addrM, outM;
    output writeM;  
    wire [15:0] wMuxRegA, wRegDOut, wMuxALUOut;
    wire wLoadRegA1, wSelMuxRegA, wLoadRegD;
    wire wLoadPC1, wLoadPC2, wLoadPC3, wLoadPC4, wLoadPC5, wLoadPC6, wLoadPC7;

    // Descrição de conexões internas do módulo

//Register A 

    Mux16 muxRegA       (wMuxRegA, outM, instruct, wSelMuxRegA);
    not notSelmuxRegA   (wSelMuxRegA, instruct[15]);
    and andLoadRegA    (wLoadRegA1,instruct[15],instruct[5]);
    or orLoadRegA      (wloadRegA, wSelMuxRegA, wLoadRegA1);
    Register16 regA     (addrM, wMuxRegA, wloadRegA, clk);

//Register D

    and andLoadRegD     (wLoadRegD, instruct[15],instruct[4]);
    Register16 regD       (wRegDOut,outM,wLoadRegD,clk);

//Program Counter

    assign one = 1'b1;
    nor norLoadPC1      (wLoadPC1, wZR,wNG);
    and andLoadPC1      (wLoadPC2, instruct[2],wNG);
    and andLoadPC2      (wLoadPC3, instruct[1], wZR);
    and andLoadPC3      (wLoadPC4, wLoadPC1, instruct[0]);
    or orLoadPC1        (wLoadPC5, wLoadPC3,wLoadPC4);
    or orLoadPC2        (wLoadPC6, wLoadPC2,wLoadPC5);
    and andLoadPC4      (wLoadPC7, wLoadPC6, instruct[15]);
    ProgramCounter PC   (pc, addrM, wLoadPC7, one, reset, clk);

//ALU

    Mux16 muxALU        (wMuxALUOut, addrM, inM, instruct[12]);
    ALU mainALU         (outM,wZR,wNG,wRegDOut,wMuxALUOut, instruct[11],instruct[10],instruct[9],instruct[8],instruct[7],instruct[6]); 

    and andWriteM(writeM, instruct[15],instruct[3]);
endmodule

`endif