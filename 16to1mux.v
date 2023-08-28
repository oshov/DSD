module mux_2to1(
    input wire data0,
    input wire data1,
    input wire sel,
    output wire out
);

    assign out = (sel) ? data1 : data0;

endmodule

module mux_16to1(
    input wire [15:0] data,
    input wire [3:0] sel,
    output wire out
);

    wire [7:0] mux_output[3:0];

    mux_2to1 mux_inst0(
        .data0(data[0]),
        .data1(data[1]),
        .sel(sel[0]),
        .out(mux_output[0])
    );

    mux_2to1 mux_inst1(
        .data0(data[2]),
        .data1(data[3]),
        .sel(sel[0]),
        .out(mux_output[1])
    );

    // ... Similar instantiations for the other groups of 2-to-1 muxes

    mux_2to1 mux_inst14(
        .data0(data[14]),
        .data1(data[15]),
        .sel(sel[0]),
        .out(mux_output[14])
    );

    mux_8to1 mux8to1_inst(
        .data(mux_output),
        .sel(sel[3:1]),
        .out(out)
    );

endmodule

