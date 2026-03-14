`include "sumador1.v"
module sumador_4bits(
    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] S,
    output Co 
);
    
    wire c1, c2, c3;

    
    sumador_1 bit0 (
        .A(A[0]), 
        .B(B[0]), 
        .Ci(Ci), 
        .So(S[0]), 
        .Co(c1)    // El acarreo sale hacia c1
    );

    // Instancia 1
    sumador_1 bit1 (
        .A(A[1]), 
        .B(B[1]), 
        .Ci(c1),   // Entra el acarreo c1
        .So(S[1]), 
        .Co(c2)    // El acarreo sale hacia c2
    );

    // Instancia 2
    sumador_1 bit2 (
        .A(A[2]), 
        .B(B[2]), 
        .Ci(c2),   // Entra el acarreo c2
        .So(S[2]), 
        .Co(c3)    // El acarreo sale hacia c3
    );

    // Instancia 3: Bit más significativo (MSB)
    sumador_1 bit3 (
        .A(A[3]), 
        .B(B[3]), 
        .Ci(c3),   // Entra el acarreo c3
        .So(S[3]), 
        .Co(Co)    // El acarreo final sale al exterior del módulo
    );

endmodule