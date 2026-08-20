module alu_8bit (
    input [7:0] A,       // 8-bit input A
    input [7:0] B,       // 8-bit input B
    input [2:0] Alu_sel, // 3-bit selection signal
    output reg[7:0] Result  // 8-bit output
);
wire [7:0] add_result;   // store the result of A + B
wire [7:0] sub_result;   // store the result of A - B
wire [7:0] and_result;   // store the result of A & B
wire [7:0] or_result;    // store the result of A | B
wire [7:0] xor_result;   // store the result of A ^ B   

assign add_result = A + B;  // perform addition
assign sub_result = A - B;  // perform subtraction
assign and_result = A & B;  // perform bitwise AND
assign or_result = A | B;   // perform bitwise OR
assign xor_result = A ^ B;  // perform bitwise XOR


always @(*) begin
    case (Alu_sel)
        3'b000: Result = add_result; // select ADD
        3'b001: Result = sub_result; // select SUB
        3'b010: Result = and_result; // select AND
        3'b011: Result = or_result;  // select OR
        3'b100: Result = xor_result; // select XOR
        default: Result = 8'h0;       // default case
    endcase
end

endmodule