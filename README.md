# UT-DLD-FrequencyMultiplier
A frequency multiplier built using RTL components and design.

A frequency multiplier is built by using frequency dividers!  
Calculations and formula for building the output frequency:

m = 50 ÷ inFreq;
k = m ÷ 2^n
k = 50 ÷ (inFreq × 2^n) ;
outFreq = inFreq × 2^n = 50 ÷ k ;
The datapath, is a Quartus II Project, and the controller is coded in verilog.
