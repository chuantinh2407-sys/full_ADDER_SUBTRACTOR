`timescale 1ns/1ps
module full_adder_tb;
    logic a, b, cin;
    logic sum, cout;

    // Instance of the full adder
    full_adder uut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $dumpfile("FULL-ADDER/waves.vcd");
        $dumpvars(0, full_adder_tb);
        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i; // Assigning values to a, b, cin based on loop index
            #10; // Wait for 10 time units
            $display("a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);
        end
        $finish; // End simulation
    end
endmodule