`timescale 1ns/1ns

module ctrl (input clk,rst,sip,adjust, output valid, counten, countinit);
    reg [1:0] ns,ps;
    parameter [1:0] idle = 0, start = 1, load = 2, count = 3;
    reg validR,countenR,countinitR;
    always @ (adjust,sip,ps) begin
    ns = 0;
	 validR = 0;
	 countenR = 0;
	 countinitR = 0;
        case (ps)
        idle: begin
            ns = adjust ? start: idle;
            validR = 1;
        end
        start: ns = adjust ? start : load;
        load: begin
            ns = sip ? count : load;
            countinitR = 1;
        end
        count: begin
            ns = sip ? idle : count;
            countenR = 1;
        end
        default: ns = idle;
		  endcase
    end
    always @(posedge clk, posedge rst) begin
        if (rst) ps <= idle;
        else ps <= ns;
    end
    assign valid = validR;
    assign counten = countenR;
    assign countinit = countinitR;
endmodule