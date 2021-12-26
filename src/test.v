module test(
    input A,
    input B,
    input C,
    output F,
    output G
    );

    assign F = (A && B) || (A && (~ C));
    assign G = (C || B ) && ((~ A) || C);

endmodule
