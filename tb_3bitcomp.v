module tb_comparator_3bit;

    reg [2:0] A;
    reg [2:0] B;
    wire GT;
    wire EQ;
    wire LT;

    comparator_3bit dut (
        .A(A),
        .B(B),
        .GT(GT),
        .EQ(EQ),
        .LT(LT)
    );

    initial begin
        $dumpfile("comparator_3bit_tb.vcd"); // Specify the VCD file
        $dumpvars(0, tb_comparator_3bit);   // Dump signals
        
        $display("A   B   GT EQ LT");
        $display("------------------");
        for (A = 0; A <= 7; A = A + 1) begin
            for (B = 0; B <= 7; B = B + 1) begin
                #10; // Wait a few simulation time units
                $display("%b   %b   %b  %b  %b", A, B, GT, EQ, LT);
            end
        end
        $finish;
    end

endmodule
