module full_adder (
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule


module alu_structural (
    input  logic [31:0] a, b,
    input  logic        op, 
    output logic [31:0] sum,
    output logic        cout
);
    logic [32:0] c;
    logic [31:0] b_xor;

    assign c[0] = op; 
    assign b_xor = b ^ {32{op}}; 

    generate
        genvar i;
        for (i = 0; i < 32; i++) begin : adder_loop
            full_adder fa (a[i], b_xor[i], c[i], sum[i], c[i+1]);
        end
    endgenerate

    assign cout = c[32];
endmodule