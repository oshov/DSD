module gray_to_binary (
    input wire [n-1:0] gray_in,
    output reg [n-1:0] binary_out
);

    integer i;

    always @(*) begin
        binary_out[0] = gray_in[0];
        for (i = 1; i < n; i = i + 1) begin
            binary_out[i] = binary_out[i-1] ^ gray_in[i];
        end
    end

endmodule
