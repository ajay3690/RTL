module counter(input clk,rst_n,
output reg [5:0]count,
output reg [4:0]even_count,
output reg [3:0] odd_count);
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)begin
        count<=0;
        even_count<=0;
        odd_count<=0;
    end
    else begin
      count<=count+1;//this will counts upto 0to31(because it's 5 bit register)
        if (count[0]==1'b0)
          even_count<=even_count+1'b1;//counts upto 0to15(because it's 4 bit register)
        else
          odd_count<=odd_count+1;//counts upto 0to7(because it's 3 bit register)
    end
end
endmodule
