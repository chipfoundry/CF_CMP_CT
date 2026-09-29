`timescale 1ns / 1ps

module tb_CF_CMP_CT;
    reg en;
    reg PD;
    reg inp;
    reg inn;
    wire out;
    wire out_tr;
    integer errors;

    CF_CMP_CT dut (
        .en(en),
        .PD(PD),
        .inp(inp),
        .inn(inn),
        .out(out),
        .out_tr(out_tr)
    );

    initial begin
        errors = 0;
        en = 1'b1;
        PD = 1'b1;
        inp = 1'b1;
        inn = 1'b0;
        #1;
        if (out !== 1'b0 || out_tr !== 1'b0) begin
            $display("FAIL power-down out=%b out_tr=%b", out, out_tr);
            errors = errors + 1;
        end
        PD = 1'b0;
        #1;
        if (out !== 1'b1 || out_tr !== 1'b0) begin
            $display("FAIL compare high out=%b out_tr=%b", out, out_tr);
            errors = errors + 1;
        end
        inp = 1'b0;
        inn = 1'b1;
        #1;
        if (out !== 1'b0 || out_tr !== 1'b1) begin
            $display("FAIL compare low out=%b out_tr=%b", out, out_tr);
            errors = errors + 1;
        end
        en = 1'b0;
        #1;
        if (out !== 1'b0 || out_tr !== 1'b0) begin
            $display("FAIL disabled out=%b out_tr=%b", out, out_tr);
            errors = errors + 1;
        end
        if (errors == 0) $display("PASS");
        else begin
            $display("FAIL %0d", errors);
            $fatal(1);
        end
        $finish;
    end
endmodule
