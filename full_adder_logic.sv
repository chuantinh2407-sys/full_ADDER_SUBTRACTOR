module full_adder (
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout

);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module sum_logic(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic op,
    output logic [31:0] sum,
    output logic cout
);
    logic [32:0] c;
    logic [31:0] b_xor;

    assign c[0]=op;
    assign b_xor = b ^ {32{op}};

    generate 
        genvar i;
        for (i=0; i<32; i=i+1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b_xor[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end 
    endgenerate
    assign cout = c[32];
endmodule


