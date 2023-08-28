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

        // Open VCD dumpfile
        $dumpfile("tb_muxes.vcd");
        $dumpvars;

        // Simulate for a few clock cycles
        repeat (20) begin
            #10;
        end

        $finish;
    end

endmodule

