`timescale 1ns/1ps

module alu_8bit_tb;
    // Testbench for 8-bit ALU
    reg [7:0] A, B;
    reg [2:0] Alu_sel;

    // Output received from the Alu
    wire [7:0] Result;
    // Instantiate the ALU module (Device Under Test)
    alu_8bit uut (
        .A(A),
        .B(B),
        .Alu_sel(Alu_sel),
        .Result(Result)
    );

    initial begin

        // Create waveform file for GTKWave
        $dumpfile("alu_8bit.vcd");
        $dumpvars(0, alu_8bit_tb);

        // Display value during simulation
        $monitor(
            "Time = %0t A = %h B = %h Alu_sel = %b Result = %h",
            $time, A, B, Alu_sel, Result
        );
// Test cases
A = 8'h05;
B = 8'h03;

// ADD
Alu_sel = 3'b000;
#10;
if (Result == 8'h08)
    $display("PASS: ADD");
else
    $display("FAIL: ADD");

// SUB
Alu_sel = 3'b001;
#10;
if (Result == 8'h02)
    $display("PASS: SUB");
else
    $display("FAIL: SUB");

// AND
Alu_sel = 3'b010;
#10;
if (Result == 8'h01)
    $display("PASS: AND");
else
    $display("FAIL: AND");

// OR
Alu_sel = 3'b011;
#10;
if (Result == 8'h07)
    $display("PASS: OR");
else
    $display("FAIL: OR");

// XOR
Alu_sel = 3'b100;
#10;
if (Result == 8'h06)
    $display("PASS: XOR");
else
    $display("FAIL: XOR");

$finish;
    end
endmodule