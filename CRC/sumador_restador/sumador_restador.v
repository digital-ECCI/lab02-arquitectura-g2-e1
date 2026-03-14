`include "sumador_4bits.v"
module sumador_restador(
    input [3:0] A,
    input [3:0] B,
    input Sel,       // 0 = Suma, 1 = Resta
    output [3:0] S,
    output Co
);

    wire [3:0] B_xor;

    // Lógica para invertir B si estamos restando (Complemento a 1)
    assign B_xor[0] = B[0] ^ Sel;
    assign B_xor[1] = B[1] ^ Sel;
    assign B_xor[2] = B[2] ^ Sel;
    assign B_xor[3] = B[3] ^ Sel;

    // Instanciamos el sumador de 4 bits
    sumador_4bits mi_sumador (
        .A(A),
        .B(B_xor),   // Entra B normal o invertido
        .Ci(Sel),    // Sumamos 1 al Carry In si Sel=1 (Completa el complemento a 2)
        .S(S),
        .Co(Co)
    );

endmodule