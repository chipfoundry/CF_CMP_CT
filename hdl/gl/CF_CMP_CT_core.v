// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
