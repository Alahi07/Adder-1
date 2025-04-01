module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry; // Internal carry between the two 16-bit adders

    // Lower 16-bit adder
    add16 adder1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0), // No carry-in for the lower 16 bits
        .sum(sum[15:0]),
        .cout(carry) // Carry-out from the lower 16 bits
    );

    // Upper 16-bit adder
    add16 adder2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry), // Carry-in from the lower 16-bit addition
        .sum(sum[31:16]),
        .cout() // Final carry-out is ignored
    );

endmodule
