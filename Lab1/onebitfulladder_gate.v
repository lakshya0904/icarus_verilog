module onebitfulladder_gate(a,b,c,c_out,sum);
    input a, b, c;
    output c_out,sum;
    wire xor1, xor2, and1, and2, or1;
    xor x1(xor1,a,b);
    xor x2(sum,c,xor1);
    and a1(and1,a,b);
    and a2(and2,xor1,c);
    or o(c_out,and1,and2);
endmodule

module testbench;
    reg a, b, c;
    wire c_out, sum;
    onebitfulladder_gate adder(a,b,c,c_out,sum);
    initial
        begin
            $monitor(,$time,"a=%1b, b=%1b, c=%1b, c_out=%1b, sum=%1b, ",a,b,c,c_out,sum);
            #0 a=1'b0; b=1'b0; c=1'b0;
            #5 a=1'b0; b=1'b0; c=1'b1;
            #5 a=1'b0; b=1'b1; c=1'b0;
            #5 a=1'b0; b=1'b1; c=1'b1;
            #5 a=1'b1; b=1'b0; c=1'b0;
            #5 a=1'b1; b=1'b0; c=1'b1;
            #5 a=1'b1; b=1'b1; c=1'b0;
            #5 a=1'b1; b=1'b1; c=1'b1;
        end
endmodule
