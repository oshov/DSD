module comparator_3bit(
    input wire [2:0] A,
    input wire [2:0] B,
    output wire GT,
    output wire EQ,
    output wire LT
);

    wire [2:0] xor_result;
    wire [2:0] and_result;

    assign xor_result = A ^ B; // XOR operation for each bit
    assign and_result = &xor_result; // AND operation on the XOR results
    
    assign EQ = (and_result == 3'b000); // If all bits are 0, EQ is true
    
    assign GT = (|and_result); // If any bit is 1, GT is true
    
    assign LT = ~EQ & ~GT; // LT is the inverse of both EQ and GT

endmodule
