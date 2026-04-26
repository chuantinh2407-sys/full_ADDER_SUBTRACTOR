`timescale 1ns/1ps
module sum_logic_tb;
    logic [31:0] a, b;
    logic op;  // 0: Add, 1: Sub
    logic [31:0] sum;
    logic cout;

    // Instance of the 32-bit adder/subtractor
    sum_logic uut (
        .a(a),
        .b(b),
        .op(op),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("FULL-ADDER/waves_32bit.vcd");
        $dumpvars(0, sum_logic_tb);

        // Test 1: Add 5 + 3 = 8
        a = 32'h00000005;
        b = 32'h00000003;
        op = 1'b0;  // ADD
        #10;
        $display("Test 1: %d + %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 2: Add 100 + 200 = 300
        a = 32'h00000064;
        b = 32'h000000C8;
        op = 1'b0;  // ADD
        #10;
        $display("Test 2: %d + %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 3: Subtract 100 - 50 = 50
        a = 32'h00000064;
        b = 32'h00000032;
        op = 1'b1;  // SUB
        #10;
        $display("Test 3: %d - %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 4: Subtract 50 - 100 = -50
        a = 32'h00000032;
        b = 32'h00000064;
        op = 1'b1;  // SUB
        #10;
        $display("Test 4: %d - %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 5: Add large numbers
        a = 32'h7FFFFFFF;  // Max positive int
        b = 32'h00000001;
        op = 1'b0;  // ADD
        #10;
        $display("Test 5: %d + %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 6: Add negative numbers
        a = 32'hFFFFFFFF;  // -1
        b = 32'hFFFFFFFE;  // -2
        op = 1'b0;  // ADD
        #10;
        $display("Test 6: %d + %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        // Test 7: Subtract with negative result
        a = 32'h80000000;  // Min negative int
        b = 32'h00000001;
        op = 1'b1;  // SUB
        #10;
        $display("Test 7: %d - %d = %d (cout=%b)", $signed(a), $signed(b), $signed(sum), cout);

        $finish;
    end
endmodule
