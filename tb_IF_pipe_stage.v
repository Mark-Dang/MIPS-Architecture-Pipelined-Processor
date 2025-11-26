`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_IF_pipe_stage();
    reg clk, reset, en;
    reg [9:0] branch_address, jump_address;
    reg branch_taken, jump;
    wire [9:0] pc_plus4;
    wire [31:0] instr;
    
    // Instantiate the IF_pipe_stage module
    IF_pipe_stage uut(
        .clk(clk), 
        .reset(reset),
        .en(en),
        .branch_address(branch_address),
        .jump_address(jump_address),
        .branch_taken(branch_taken),
        .jump(jump),
        .pc_plus4(pc_plus4),
        .instr(instr)
    );
    
    // Clock generation
    
    // Initial condition
    initial begin
        clk = 0;
        reset = 1;
        en = 0;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
        
        //set the initial conditions
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
        
        //expect pc + 4 to be moved to 8
        //expect instruction to be moved to instmem[1]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 1;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;

        //expect pc + 4 to be moved to 4
        //expect instruction to be moved to instmem[0]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
        
        //expect pc + 4 to be moved to 8
        //expect instruction to be moved to instmem[1]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
        
        //expect pc + 4 to be moved to 12
        //expect instruction to be moved to instmem[2]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
             
        //expect pc + 4 to be moved to 16
        //expect instruction to be moved to instmem[3]
        #10 clk = 1;
        #10 clk = 0;
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b1000;
        branch_taken = 0;
        jump = 1;
        
        //expect pc + 4 to be moved to 12
        //expect instruction to be moved to instmem[2]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;       
       
        //expect pc + 4 to be moved to 16
        //expect instruction to be moved to instmem[3]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b0;
        jump_address = 10'b0;
        branch_taken = 0;
        jump = 0;
               
        //expect pc + 4 to be moved to 20
        //expect instruction to be moved to instmem[4]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b100;
        jump_address = 10'b0;
        branch_taken = 1;
        jump = 0;
               
        //expect pc + 4 to be moved to 8
        //expect instruction to be moved to instmem[1]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 0;
        en = 1;
        branch_address = 10'b100;
        jump_address = 10'b1000;
        branch_taken = 0;
        jump = 0;
               
        //expect pc + 4 to be moved to 12
        //expect instruction to be moved to instmem[2]
        #10 clk = 1;
        #10 clk = 0;
        
        
        reset = 1;
        en = 1;
        branch_address = 10'b100;
        jump_address = 10'b1000;
        branch_taken = 0;
        jump = 0;
               
        //expect pc + 4 to be moved to 4
        //expect instruction to be moved to instmem[0]
        #10 clk = 1;
        #10 clk = 0;
        
    end


endmodule
