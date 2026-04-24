module alu_prod (
    input  logic signed [31:0] a, b,
    input  logic               op,     // 0: Add, 1: Sub
    output logic signed [32:0] result, // Nới rộng bit để hứng Overflow
    output logic               overflow
);
    // Sử dụng toán tử để trình biên dịch tự tối ưu bằng DesignWare/IP Core
    assign result = (op == 1'b0) ? (a + b) : (a - b);

    // Cờ Overflow chuẩn cho số Signed:
    // Tràn khi (A, B cùng dấu) mà kết quả lại khác dấu với A
    assign overflow = (a[31] == b[31]) && (result[31] != a[31]);
endmodule