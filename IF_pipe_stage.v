`timescale 1ns / 1ps


module IF_pipe_stage(
    input clk, reset,
    input en, // im assuming enable is the signal to move to next; if not stall
              // if this is 0 (data hazard, pc +4 <= pc and stall)
    input [9:0] branch_address,
    input [9:0] jump_address,
    input branch_taken,
    input jump,
    output [9:0] pc_plus4,
    output [31:0] instr
    );
    
//write your code here

//wires and regs
reg [9:0] pc;
wire [31:0] instruction;

//create an instance of instruction mem
instruction_mem instruction_mem_inst(
    .read_addr(pc),
    .data(instruction)
);

//logic
always @ (posedge clk) begin
    if (reset) begin
        pc <= 10'b0;
    end
    else if (en) begin
        if (branch_taken) pc <= branch_address;
        else if  (jump) pc <= jump_address;
        else pc <= pc + 10'd4;
    end
end

assign pc_plus4 = pc + 10'd4;
assign instr = instruction;
             
endmodule
