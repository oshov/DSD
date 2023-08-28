module tb_gray_to_binary;

    reg [3:0] gray_in;       // Input gray code
    wire [3:0] binary_out;   // Output binary code
    
    gray_to_binary dut (
        .gray_in(gray_in),
        .binary_out(binary_out)
    );

    initial begin
        $dumpfile("tb_gray_to_binary.vcd"); // Specify the VCD file for GTKWave
        $dumpvars(0, tb_gray_to_binary);    // Dump variables for tracing
        
        // Initialize gray_in with some values
        gray_in = 4'b0000;
        
        // Generate stimulus
        repeat(16) begin
            #10;        // Delay for better waveform visualization
            gray_in = gray_in + 1'b1;
        end
        
        // Finish simulation
        $finish;
    end

endmodule
