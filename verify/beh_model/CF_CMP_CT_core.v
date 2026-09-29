`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_CMP_CT_core.
// Drop this file in place of hdl/gl/CF_CMP_CT_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * PD high clears out and out_tr.
//   * Otherwise, when en is high, out is high when inp is high and inn is low.
//   * out_tr is the complement of out while the model is running.
// Trim, hysteresis, calibration, filter, and mux controls are not modeled.
// vpwr, vgnd, vpb, vnb, vpbe, and vpwre are supply inputs and are not generated.

module CF_CMP_CT_core (
    trimA,
    bypass_cmp_mux,
    trimB,
    inn,
    vpb_ka,
    en,
    iref,
    vpwr,
    vpb,
    vnb,
    vgnd,
    out,
    out_tr,
    vpwr_ka,
    cal_en,
    hyst,
    PD,
    filt,
    PD_override,
    hold_n,
    enable_hv,
    vpbe,
    vpwre,
    sel1,
    sel0,
    inp
);
    input [4:0] trimA;
    input bypass_cmp_mux;
    input [4:0] trimB;
    input inn;
    input vpb_ka;
    input en;
    input iref;
    input vpwr;
    input vpb;
    input vnb;
    input vgnd;
    output out;
    output out_tr;
    input vpwr_ka;
    input cal_en;
    input hyst;
    input PD;
    input filt;
    input PD_override;
    input hold_n;
    input enable_hv;
    input vpbe;
    input vpwre;
    input sel1;
    input sel0;
    input inp;

    reg out_r;
    reg out_tr_r;
    assign out = out_r;
    assign out_tr = out_tr_r;
    wire run = (PD !== 1'b1) && (en === 1'b1);
    always @* begin
        out_r = 1'b0;
        out_tr_r = 1'b0;
        if (run) begin
            out_r = (inp === 1'b1) && (inn !== 1'b1);
            out_tr_r = ~out_r;
        end
    end
endmodule
