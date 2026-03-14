`timescale 1s / 1s
`include "sumador_restador.v"

module tb_sumador_restador;

    
    reg [3:0] A;
    reg [3:0] B;
    reg Sel;

    
    wire [3:0] S;
    wire Co;

    
    integer i, j;

    
    sumador_restador uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .S(S),
        .Co(Co)
    );

    initial begin
        
        $dumpfile("simulacion_total.vcd");
        $dumpvars(0, tb_sumador_restador);

      
        $display("--- INICIANDO TODAS LAS SUMAS (Sel = 0) ---");
        Sel = 0;
        
        
        for (i = 0; i < 16; i = i + 1) begin
            
            for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0]; 
                B = j[3:0];
                #5; 
            end
        end

        
        $display("\n--- INICIANDO TODAS LAS RESTAS (Sel = 1) ---");
        Sel = 1;
        
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0];
                B = j[3:0];
                #5;
            end
        end

        
        $display("\n--- SIMULACION TERMINADA EXITOSAMENTE ---");
        $finish;
    end

    
    initial begin
        $monitor("Tiempo=%0t | Sel=%b | A=%d, B=%d | Resultado(S)=%b (Dec:%d), Co=%b", 
                 $time, Sel, A, B, S, S, Co);
    end

endmodule