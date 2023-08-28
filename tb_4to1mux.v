module tb_mux_4to1;

    // Inputs
    reg [3:0] data_in;
    reg [1:0] select;
    
    // Output
    wire mux_out;
    
    // Instantiate the 4-to-1 multiplexer module
    mux_4to1 uut(
        .data_in(data_in),
        .select(select),
        .mux_out(mux_out)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $display("Testing 4-to-1 Multiplexer");
        
        data_in = 4'b0000;
        select = 2'b00;
        #10;
        $display("data_in: %b, select: %b, mux_out: %b", data_in, select, mux_out);
        
        data_in = 4'b1010;
        select = 2'b01;
        #10;
        $display("data_in: %b, select: %b, mux_out: %b", data_in, select, mux_out);
        
        data_in = 4'b1100;
        select = 2'b10;
        #10;
        $display("data_in: %b, select: %b, mux_out: %b", data_in, select, mux_out);
        
        data_in = 4'b0101;
        select = 2'b11;
        #10;
        $display("data_in: %b, select: %b, mux_out: %b", data_in, select, mux_out);
        
        $finish;
    end

endmodule
