module sumador_1 (
    input A,
    input B,
    input Ci,
    output So,
    output Co 
);
    
    assign So = A ^ (B ^ Ci);
    assign Co = (Ci & (A ^ B)) | (A & B);

endmodule