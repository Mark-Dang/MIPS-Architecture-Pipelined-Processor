`timescale 1ns / 1ps


module mips_32(
    input clk, reset,  
    output[31:0] result
    );
    
// define all the wires here. You need to define more wires than the ones you did in Lab2

   


// Build the pipeline as indicated in the lab manual

///////////////////////////// Instruction Fetch    
    // Complete your code here      

        
///////////////////////////// IF/ID registers
    // Complete your code here


///////////////////////////// Instruction Decode 
	// Complete your code here

             
///////////////////////////// ID/EX registers 
	// Complete your code here

///////////////////////////// Hazard_detection unit
	// Complete your code here    

           
///////////////////////////// Execution    
	// Complete your code here
	
        
///////////////////////////// Forwarding unit
	// Complete your code here 

     
///////////////////////////// EX/MEM registers
	// Complete your code here 

    
///////////////////////////// memory    
	// Complete your code here
     

///////////////////////////// MEM/WB registers  
	// Complete your code here
    

///////////////////////////// writeback    
	// Complete your code here
    

    
endmodule
