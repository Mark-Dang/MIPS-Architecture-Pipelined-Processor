`timescale 1ns / 1ps


module Hazard_detection(
    input id_ex_mem_read,
    input [4:0]id_ex_destination_reg,
    input [4:0] if_id_rs, if_id_rt,
    //branch taken should be a signal given from a xor module comparing two registers
    input branch_taken, jump,
    output reg Data_Hazard,
    output reg IF_Flush //IF_FLUSH makes IF/ID registers 0; means create a stall
    );
    
    always @(*)  
    begin
        
	// Copy the code of this module from the lab manual.
	if ((id_ex_mem_read == 1'b1) & 
	   //this line checks if one of the required registers is the destination of the previous inst
	   ((id_ex_destination_reg == if_id_rs) | (id_ex_destination_reg == if_id_rt)))
	   
	   Data_Hazard = 1'b0; //active low; this means to stall the pipeline for 1 cycle
	                       //data hazards are when we need information BUT
	                       //a load instruction was before
	else
	   Data_Hazard = 1'b1;
	
	IF_Flush = branch_taken | jump; //IF_Flush signal means to make IF/ID regs 0
	                                //CHECK IF THIS IS 0 OR 1 (look at other modules)
	                                //CONNECT THIS SIGNAL TO IF/ID REGS
    end
endmodule

