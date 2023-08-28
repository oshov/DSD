module mux_4to1(
    input wire [3:0] data_in,
    input wire [1:0] select,
    output wire mux_out
);

    // Data input assignment based on select lines
    if (select == 2'b00)
        assign mux_out = data_in[0];
    else if (select == 2'b01)
        assign mux_out = data_in[1];
    else if (select == 2'b10)
        assign mux_out = data_in[2];
    else if (select == 2'b11)
        assign mux_out = data_in[3];
    else
        assign mux_out = 1'b0; // Default case

endmodule
