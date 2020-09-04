module onebitfulladder_df(a,b,cin,cout,sum);
    input a, b, cin;
    output cout,sum;
    assign sum= a^b^cin;
    assign cout=(a&b) | ((a^b)&cin);
endmodule

module testbench;
    reg a, b, cin;
    wire cout, sum;
    onebitfulladder_df adder(a,b,cin,cout,sum);
    initial
        begin
            $monitor(,$time,"a=%1b, b=%1b, cin=%1b, cout=%1b, sum=%1b ", a,b,cin,cout,sum);
            #0 a=1'b0; b=1'b0; cin=1'b0;
            #5 a=1'b0; b=1'b0; cin=1'b1;
            #5 a=1'b0; b=1'b1; cin=1'b0;
            #5 a=1'b0; b=1'b1; cin=1'b1;
            #5 a=1'b1; b=1'b0; cin=1'b0;
            #5 a=1'b1; b=1'b0; cin=1'b1;
            #5 a=1'b1; b=1'b1; cin=1'b0;
            #5 a=1'b1; b=1'b1; cin=1'b1;
        end
endmodule
