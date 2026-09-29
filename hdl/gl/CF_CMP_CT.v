// Structural PG wrapper. Analog leaf is CF_CMP_CT_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_CMP_CT (
    trimA,
    bypass_cmp_mux,
    trimB,
    inn,
    vpb_ka,
    en,
    iref,
    vpwr,
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
    CF_CMP_CT_core u_core (
        .trimA(trimA),
        .bypass_cmp_mux(bypass_cmp_mux),
        .trimB(trimB),
        .inn(inn),
        .vpb_ka(vpb_ka),
        .en(en),
        .iref(iref),
        .vpwr(vpwr),
        .vpb(vpwr),
        .vnb(vgnd),
        .vgnd(vgnd),
        .out(out),
        .out_tr(out_tr),
        .vpwr_ka(vpwr_ka),
        .cal_en(cal_en),
        .hyst(hyst),
        .PD(PD),
        .filt(filt),
        .PD_override(PD_override),
        .hold_n(hold_n),
        .enable_hv(enable_hv),
        .vpbe(vpbe),
        .vpwre(vpwre),
        .sel1(sel1),
        .sel0(sel0),
        .inp(inp)
    );
endmodule
