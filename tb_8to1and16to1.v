module tb_muxes;

    // Inputs
    reg [7:0] data;
    reg [3:0] sel;

    // Outputs
    wire out_8to1;
    wire out_16to1;

    // Instantiate the modules
    mux_8to1 mux8to1_inst(
        .data(data),
        .sel(sel),
        .out(out_8to1)
    );

    mux_16to1 mux16to1_inst(
        .data(data),
        .sel(sel),
        .out(out_16to1)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        data = 8'b10101010;
        sel = 4'b0110;

        // Test 8-to-1 mux
        $display("Testing 8-to-1 mux...");
        $monitor("data = %b, sel = %b, out_8to1 = %b", data, sel, out_8to1);

        // Apply different select values
        sel = 4'b0001;
        #10;

        sel = 4'b0010;
        #10;

        sel = 4'b0100;
        #10;

        // Test 16-to-1 mux
        $display("Testing 16-to-1 mux...");
        $monitor("data = %b, sel = %b, out_16to1 = %b", data, sel, out_16to1);

        // Apply different select values
        sel = 4'b1000;
        #10;

        sel = 4'b0101;
        #10;

        sel = 4'b1111;
        #10;

        $finish;
    end

endmodule
