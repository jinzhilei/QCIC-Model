function y = QCIC(t,x)

%% Load parameter
 
global par 

m=length(x);
y=zeros(m,1);

%% Drug and DPTC parameter

par.K_Chem = 47.5;
par.beta_X3 = 0.0415;
par.varepsilon_CX1 = 2.10e-2;
par.varepsilon_CX2 = 2.10e-2;
par.varepsilon_CX3 = 0;
par.n_c = 2;
par.d_X3 = 0.01;
par.a13 = 3;
par.a23 = 2;
par.a31 = 1;
par.a32 = 1;
par.a33 = 1;
par.K3 = 1.5e9;
par.rho_X3X1 = 0.6;
par.rho_X3X2 = 0.9;
par.sigma_X1 = 0.05;
par.sigma_X2 = 0.1;
par.varepsilon_TX1 = 5.25e-3;
par.varepsilon_TX2 = 3.25e-3;
par.varepsilon_TX3 = 1.25e-3;
par.varepsilon_CX3 = 0;
par.eta_X3T1 = 5e-10;
par.eta_X3T8 = 5e-9;
par.eta_X3NK = 1e-12;

%% variable substitution

D_A = x(1);      TN4_A = x(2);     T1_A = x(3);      T2_A = x(4);     T17_A = x(5);     Treg_A = x(6);    Tfh_A = x(7);    TN8_A = x(8);    T8_A = x(9);     NK_A = x(10);
TN4_B = x(11);   T1_B = x(12);     T2_B = x(13);     T17_B = x(14);   Treg_B = x(15);   Tfh_B = x(16);    TN8_B = x(17);   T8_B = x(18);    D0_B = x(19);    D_B = x(20);
NK_B = x(21);    MMDSC_B = x(22);  GMDSC_B = x(23);  M_B = x(24);     M1_B = x(25);     M2_B = x(26);     N_B = x(27);     N1_B = x(28);    N2_B = x(29);    Eos_B = x(30);
Bas_B = x(31);   X1_C = x(32);     X2_C = x(33);     X3_C = x(34);    T1_C = x(35);     T2_C = x(36);     T17_C = x(37);   Treg_C = x(38);  Tfh_C = x(39);   T8_C = x(40);  
D0_C = x(41);    D_C = x(42);      NK_C = x(43);     MMDSC_C = x(44); GMDSC_C = x(45);  M_C = x(46);      M1_C = x(47);    M2_C = x(48);    N_C = x(49);     N1_C = x(50);
N2_C = x(51);    Eos_C = x(52);    Bas_C = x(53);    Targ_C = x(54);  Targ_P = x(55);   Chem_C = x(56);   Chem_P = x(57);

%% Load Protein_module_fast_time_scale

% ====== TDLN ======

% IL2 in TDLN
I2_A = (1 / par.d_I2) * ( par.delta_I2T1 * T1_A + par.delta_I2T8 * T8_A);

% IL4 in TDLN
I4_A = (1 / par.d_I4) * ( par.delta_I4T2 * T2_A + par.delta_I4Tfh * Tfh_A);

% IL6 in TDLN
I6_A = (1 / par.d_I6) * ( par.delta_I6T2 * T2_A);

% IL10 in TDLN
I10_A = (1 / par.d_I10) * ( par.delta_I10T2 * T2_A + par.delta_I10Treg * Treg_A);

% IL12 in TDLN
I12_A = (1 / par.d_I12) * ( par.delta_I12D * D_A);

% IL21 in TDLN
I21_A = (1 / par.d_I21) * ( par.delta_I21T2 * T2_A + par.delta_I21T17 * T17_A + par.delta_I21Tfh * Tfh_A + par.delta_I21NK * NK_A);

% Igamma in TDLN
Igamma_A = (1 / par.d_Igamma) * ( par.delta_IgammaT1 * T1_A + par.delta_IgammaT8 * T8_A + par.delta_IgammaNK * NK_A);

% Tbeta in TDLN
Tbeta_A = (1 / par.d_Tbeta) * ( par.delta_TbetaTreg * Treg_A );

% CCL19 in TDLN
L19_A = (1 / par.d_L19) * ( par.delta_L19D * D_A );

% CCL21 in TDLN
L21_A = (1 / par.d_L21) * ( par.delta_L21D * D_A );

% ====== TME ======

% Total number of tumor cells in TME
X_C = X1_C + X2_C + X3_C;

% PD-1 in TME
P_C = par.phi_P * (T1_C + T2_C + T17_C +  Tfh_C + T8_C + par.varepsilon_NK * NK_C) ;

% PD-L1 in TME
L_C = par.phi_L * X_C ;

% PD-1-PD-L1 in TME
PL_C = par.alpha_PL * P_C * L_C ;

% IL2 in TME
I2_C = (1 / par.d_I2) * ( par.delta_I2T1 * T1_C + par.delta_I2T8 * T8_C);

% IL4 in TME
I4_C = (1 / par.d_I4) * ( par.delta_I4T2 * T2_C + par.delta_I4Tfh * Tfh_C + par.delta_I4Eos * Eos_C + par.delta_I4Bas * Bas_C);

% IL10 in TME
I10_C = (1 / par.d_I10) * ( par.delta_I10T2 * T2_C + par.delta_I10Treg * Treg_C + par.delta_I10M2 * M2_C + par.delta_I10N2 * N2_C + + par.delta_I10MMDSC * MMDSC_C + par.delta_I10GMDSC * GMDSC_C + par.delta_I10X * X_C );

% IL12 in TME
I12_C = (1 / par.d_I12) * ( par.delta_I12D * D_C + par.delta_I12M1 * M1_C + par.delta_I12Eos * Eos_C);

% Igamma in TME
Igamma_C = (1 / par.d_Igamma) * ( par.delta_IgammaT1 * T1_C + par.delta_IgammaT8 * T8_C + par.delta_IgammaNK * NK_C + par.delta_IgammaN1 * N1_C);

% Tbeta in TME
Tbeta_C = (1 / par.d_Tbeta) * ( par.delta_TbetaTreg * Treg_C + par.delta_TbetaX * X_C + par.delta_TbetaM2 * M2_C + par.delta_TbetaN2 * N2_C);

% Talpha in TME
Talpha_C = (1 / par.d_Talpha) * ( par.delta_TalphaM1 * M1_C + par.delta_TalphaT1 * T1_C + par.delta_TalphaT8 * T8_C + par.delta_TalphaN1 * N1_C);

% M-CSF in TME
MCSF_C = (1 / par.d_MCSF) * ( par.delta_MCSFX * X_C );

% G-CSF in TME
GCSF_C = (1 / par.d_GCSF) * ( par.delta_GCSFX * X_C );

% C1 in TME
C1_C = (1 / par.d_C1) * ( par.delta_C1X * X_C );

% C2 in TME
C2_C = (1 / par.d_C2) * ( par.delta_C2X * X_C );

% C5 in TME
C5_C = (1 / par.d_C5) * ( par.delta_C5X * X_C );

% C8 in TME
C8_C = (1 / par.d_C8) * ( par.delta_C8Treg * Treg_C + par.delta_C8X * X_C );

% C9 in TME
C9_C = (1 / par.d_C9) * ( par.delta_C9D * D_C + par.delta_C9X * X_C + par.delta_C9M1 * M1_C );

% C10 in TME
C10_C = (1 / par.d_C10) * ( par.delta_C10D * D_C + par.delta_C10X * X_C + par.delta_C10M1 * M1_C );

% C12 in TME
C12_C = (1 / par.d_C12) * ( par.delta_C12X * X_C );

% C13 in TME
C13_C = (1 / par.d_C13) * ( par.delta_C13D * D_C + par.delta_C13Tfh * Tfh_C + par.delta_C13M2 * M2_C );

% L1 in TME
L1_C = (1 / par.d_L1) * ( par.delta_L1Treg * Treg_C + par.delta_L1M2 * M2_C );

% L2 in TME
L2_C = (1 / par.d_L2) * ( par.delta_L2M1 * M1_C + par.delta_L2N1 * N1_C + par.delta_L2X * X_C );

% L3 in TME
L3_C = (1 / par.d_L3) * ( par.delta_L3M1 * M1_C + par.delta_L3N1 * N1_C + par.delta_L3MMDSC * MMDSC_C + par.delta_L3X * X_C );

% L4 in TME
L4_C = (1 / par.d_L4) * ( par.delta_L4M1 * M1_C + par.delta_L4N2 * N2_C + par.delta_L4MMDSC * MMDSC_C);

% L5 in TME
L5_C = (1 / par.d_L5) * ( par.delta_L5M1 * M1_C + par.delta_L5N2 * N2_C + par.delta_L5X * X_C + par.delta_L5T8 * T8_C + par.delta_L5MMDSC * MMDSC_C + par.delta_L5NK * NK_C);

% L11 in TME
L11_C = (1 / par.d_L11) * ( par.delta_L11X * X_C + par.delta_L11Eos * Eos_C );

% L17 in TME
L17_C = (1 / par.d_L17) * ( par.delta_L17D * D_C + par.delta_L17M2 * M2_C + par.delta_L17N2 * N2_C );

% CCL19 in TDLN
L19_C = (1 / par.d_L19) * ( par.delta_L19D * D_C );

% L20 in TME
L20_C = (1 / par.d_L20) * ( par.delta_L20X * X_C );

% CCL21 in TDLN
L21_C = (1 / par.d_L21) * ( par.delta_L21D * D_C );

% L22 in TME
L22_C = (1 / par.d_L22) * ( par.delta_L22D * D_C + par.delta_L22M2 * M2_C + par.delta_L22X * X_C );


%% Load Cell_module_slow_time_scale

% ====== TDLN ======

% activated DCs in TDLN
migration_D_A = par.V_D_CA * (par.V_C / par.V_A) * D_C + par.V_D_BA * (par.V_B / par.V_A) * D_B - par.V_D_AB * D_A;
chemotaxis_D_CA = (par.X_DL19_CA * (L19_A / (par.K_L19 + L19_A)) + par.X_DL21_CA * (L21_A / (par.K_L21 + L21_A))) * D_C;
apoptosis_D_A = par.d_D * D_A;

% naive CD4+T cell in TDLN
proliferation_TN4_A = par.beta_TN4 * TN4_A * (1 - (TN4_A / par.K_TN4));
differentiation_T1_A = par.kappa_T1 * (1 + par.lambda_T1I12 * (I12_A / (par.K_I12 + I12_A)) + par.lambda_T1Igamma * (Igamma_A / (par.K_Igamma + Igamma_A))) * (1 / (1 + I4_A / par.K_T1I4)) * (1 / (1 + Tbeta_A / par.K_T1Tbeta)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN4_A;
differentiation_T2_A = par.kappa_T2 * (1 + par.lambda_kappaT2I4 * (I4_A / (par.K_I4 + I4_A))) * (1 / (1 + Igamma_A / par.K_T2Igamma)) * (1 / (1 + Tbeta_A / par.K_T2Tbeta)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN4_A ;
differentiation_T17_A = par.kappa_T17 * (1 + par.lambda_T17I6Tbeta * (I6_A * Tbeta_A / (par.K_I6Tbeta + I6_A * Tbeta_A))) * (1 / (1 + Igamma_A / par.K_T17Igamma)) * (1 / (1 + I4_A / par.K_T17I4)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN4_A ;
differentiation_Treg_A = par.kappa_Treg * (1 + par.lambda_TregTbeta * (Tbeta_A / (par.K_Tbeta + Tbeta_A))) * (1 / (1 + Igamma_A / par.K_TregIgamma)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN4_A ;
differentiation_Tfh_A = par.kappa_Tfh * (1 + par.lambda_TfhI6 * (I6_A / (par.K_I6 + I6_A)) + par.lambda_TfhI21 * (I21_A / (par.K_I21 + I21_A))) * (1 / (1 + I2_A / par.K_TfhI2)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN4_A;
migration_TN4_A = par.V_TN4_BA * (par.V_B / par.V_A) * TN4_B - par.V_TN4_AB * TN4_A;
chemotaxis_TN4_BA = (par.X_TN4L19_BA * (L19_A / (par.K_L19 + L19_A)) + par.X_TN4L21_BA * (L21_A / (par.K_L21 + L21_A))) * TN4_B;
apoptosis_TN4_A = par.d_TN4 * TN4_A;

% Th1 cell in TDLN
proliferation_T1_A = par.beta_T1 * (1 + par.lambda_T1I2 * (I2_A / (par.K_I2 + I2_A)) * (1 / (1 + I4_A / par.K_T1I4))) * T1_A ;
transformation_T1T17 = par.rho_T1T17 * (I12_A / (par.K_I12 + I12_A)) * T17_A;
migration_T1_A = par.V_T1_BA * (par.V_B / par.V_A) * T1_B - par.V_T1_AB * T1_A;
apoptosis_T1_A = par.d_T1 * (1 + (par.lambda_T1 * (T1_A / (par.K_T1 + T1_A)))) * T1_A;

% Th2 cell in TDLN
proliferation_T2_A = par.beta_T2 * (1 + par.lambda_betaT2I4 * (I4_A / (par.K_I4 + I4_A)) * (1 / (1 + Igamma_A / par.K_T2Igamma))) * T2_A;
transformation_T2T17 = par.rho_T2T17 * (I4_A / (par.K_I4 + I4_A)) * T17_A;
migration_T2_A = par.V_T2_BA * (par.V_B / par.V_A) * T2_B - par.V_T2_AB * T2_A;
apoptosis_T2_A = par.d_T2 * (1 + (par.lambda_T2 * (T2_A / (par.K_T2 + T2_A)))) * T2_A;

% Th17 cell in TDLN
proliferation_T17_A = par.beta_T17 * (1 + par.lambda_T17I21 * (I21_A / (par.K_I21 + I21_A))) * T17_A;
transformation_T17Treg = par.rho_T17Treg * (I6_A / (par.K_I6 + I6_A) + I21_A / (par.K_I21 + I21_A)) * Treg_A;
migration_T17_A = par.V_T17_BA * (par.V_B / par.V_A) * T17_B - par.V_T17_AB * T17_A;
apoptosis_T17_A = par.d_T17 * (1 + (par.lambda_T17 * (T17_A / (par.K_T17 + T17_A)))) * T17_A;

% Treg cell in TDLN
proliferation_Treg_A = par.beta_Treg * (1 - par.lambda_TregI21 * (I21_A / (par.K_I21 + I21_A))) * Treg_A;
migration_Treg_A = par.V_Treg_BA * (par.V_B / par.V_A) * Treg_B - par.V_Treg_AB * Treg_A;
apoptosis_Treg_A = par.d_Treg * (1 + (par.lambda_Treg * (Treg_A / (par.K_Treg + Treg_A)))-par.lambda_TregI2 * (I2_A / (par.K_I2 + I2_A))) * Treg_A;

% Tfh cell in TDLN
proliferation_Tfh_A = par.beta_Tfh * (1 + par.lambda_TfhI21 * (I21_A / (par.K_I21 + I21_A))) * Tfh_A;
migration_Tfh_A = par.V_Tfh_BA * (par.V_B / par.V_A) * Tfh_B - par.V_Tfh_AB * Tfh_A;
apoptosis_Tfh_A = par.d_Tfh * (1 + (par.lambda_Tfh * (Tfh_A / (par.K_Tfh + Tfh_A)))) * Tfh_A;

% naive CD8+T cell in TDLN
proliferation_TN8_A = par.beta_TN8 * TN8_A * (1 - (TN8_A / par.K_TN8));
differentiation_T8_A = par.kappa_T8 * (1 + par.lambda_T8I12 * (I12_A / (par.K_I12 + I12_A)) ) * (1 / (1 + I10_A / par.K_T8I10)) * (1 / (1 + Tbeta_A / par.K_T8Tbeta)) * (D_A^par.n / (par.K_D^par.n + D_A^par.n)) * TN8_A;
migration_TN8_A = par.V_TN8_BA * (par.V_B / par.V_A) * TN8_B - par.V_TN8_AB * TN8_A;
chemotaxis_TN8_BA = (par.X_TN8L19_BA * (L19_A / (par.K_L19 + L19_A)) + par.X_TN8L21_BA * (L21_A / (par.K_L21 + L21_A))) * TN8_B;
apoptosis_TN8_A = par.d_TN8 * TN8_A;

% CTL cell in TDLN
proliferation_T8_A = par.beta_T8 * (1 + par.lambda_T8I2 * (I2_A / (par.K_I2 + I2_A)) + par.lambda_T8I21 * (I21_A / (par.K_I21 + I21_A))) * T1_A;
migration_T8_A = par.V_T8_BA * (par.V_B / par.V_A) * T8_B - par.V_T8_AB * T8_A;
apoptosis_T8_A = par.d_T8 * (1 + (par.lambda_T8 * (T8_A / (par.K_T8 + T8_A)))) * T8_A;

% NK cell in TDLN
proliferation_NK_A = par.beta_NK * (1 + par.lambda_NKI12 * (I12_A / (par.K_I12 + I12_A)) + par.lambda_NKI21 * (I21_A / (par.K_I21 + I21_A))) * (1 / (1 + I10_A / par.K_NKI10)) * NK_A;
migration_NK_A = par.V_NK_BA * (par.V_B / par.V_A) * NK_B - par.V_NK_AB * NK_A;
apoptosis_NK_A = par.d_NK * (1 + (par.lambda_NK * (NK_A / (par.K_NK + NK_A)))) * NK_A;

% ====== PB ======

% naive CD+4T cell in PB
source_TN4 =  par.theta_TN4_DB;
migration_TN4_B = par.V_TN4_AB * (par.V_A / par.V_B) * TN4_A - par.V_TN4_BA * TN4_B;
apoptosis_TN4_B = par.d_TN4 * TN4_B;

% Th1 cell in PB
migration_T1_B = (par.V_T1_AB * (par.V_A / par.V_B) * T1_A - par.V_T1_BA * T1_B) + (par.V_T1_CB * (par.V_C / par.V_B) * T1_C - par.V_T1_BC * T1_B);
chemotaxis_T1_BC = (par.X_T1C9_BC * (C9_C / (par.K_C9 + C9_C)) + par.X_T1C10_BC * (C10_C / (par.K_C10 + C10_C)) + par.X_T1L3_BC * (L3_C / (par.K_L3 + L3_C)) + par.X_T1L4_BC * (L4_C / (par.K_L4 + L4_C)) + par.X_T1L5_BC * (L5_C / (par.K_L5 + L5_C))) * T1_B;
apoptosis_T1_B = par.d_T1 * T1_B;

% Th2 cell in PB
migration_T2_B = (par.V_T2_AB * (par.V_A / par.V_B) * T2_A - par.V_T2_BA * T2_B) + (par.V_T2_CB * (par.V_C / par.V_B) * T2_C - par.V_T2_BC * T2_B);
chemotaxis_T2_BC = (par.X_T2L1_BC * (L1_C / (par.K_L1 + L1_C)) + par.X_T2L17_BC * (L17_C / (par.K_L17 + L17_C)) + par.X_T2L22_BC * (L22_C / (par.K_L22 + L22_C))) * T2_B;
apoptosis_T2_B = par.d_T2 * T2_B;

% Th17 cell in PB
migration_T17_B = (par.V_T17_AB * (par.V_A / par.V_B) * T17_A - par.V_T17_BA * T17_B) + (par.V_T17_CB * (par.V_C / par.V_B) * T17_C - par.V_T17_BC * T17_B);
chemotaxis_T17_BC = (par.X_T17L17_BC * (L17_C / (par.K_L17 + L17_C)) + par.X_T17L20_BC * (L20_C / (par.K_L20 + L20_C)) + par.X_T17L22_BC * (L22_C / (par.K_L22 + L22_C)) + par.X_T17C12_BC * (C12_C / (par.K_C12 + C12_C))) * T17_B;
apoptosis_T17_B = par.d_T17 * T17_B;

% Treg cell in PB
migration_Treg_B = (par.V_Treg_AB * (par.V_A / par.V_B) * Treg_A - par.V_Treg_BA * Treg_B) + (par.V_Treg_CB * (par.V_C / par.V_B) * Treg_C - par.V_Treg_BC * Treg_B);
chemotaxis_Treg_BC = (par.X_TregL1_BC * (L1_C / (par.K_L1 + L1_C)) + par.X_TregL17_BC * (L17_C / (par.K_L17 + L17_C)) + par.X_TregL22_BC * (L22_C / (par.K_L22 + L22_C))) * Treg_B;
apoptosis_Treg_B = par.d_Treg * Treg_B;

% Tfh cell in PB
migration_Tfh_B = (par.V_Tfh_AB * (par.V_A / par.V_B) * Tfh_A - par.V_Tfh_BA * Tfh_B) + (par.V_Tfh_CB * (par.V_C / par.V_B) * Tfh_C - par.V_Tfh_BC * Tfh_B);
chemotaxis_Tfh_BC = (par.X_TfhC13_BC * (C13_C / (par.K_C13 + C13_C))) * Tfh_B;
apoptosis_Tfh_B = par.d_Tfh * Tfh_B;

% naive CD+8T cell in PB
source_TN8 =  par.theta_TN8_DB;
migration_TN8_B = par.V_TN8_AB * (par.V_A / par.V_B) * TN8_A - par.V_TN8_BA * TN8_B;
apoptosis_TN8_B = par.d_TN8 * TN8_B;

% CTL cell in PB
migration_T8_B = (par.V_T8_AB * (par.V_A / par.V_B) * T8_A - par.V_T8_BA * T8_B) + (par.V_T8_CB * (par.V_C / par.V_B) * T8_C - par.V_T8_BC * T8_B);
chemotaxis_T8_BC = (par.X_T8C9_BC * (C9_C / (par.K_C9 + C9_C)) + par.X_T8C10_BC * (C10_C / (par.K_C10 + C10_C)) + par.X_T8C12_BC * (C12_C / (par.K_C12 + C12_C))) * T8_B;
apoptosis_T8_B = par.d_T8 * T8_B;

% D0 cell in PB
source_D0 =  par.theta_D0_DB;
migration_D0_B = par.V_D0_CB * (par.V_C / par.V_B) * D0_C - par.V_D0_BC * D0_B;
chemotaxis_D0_BC = (par.X_D0L20_BC * (L20_C / (par.K_L20 + L20_C))) * D0_B;
apoptosis_D0_B = par.d_D0 * D0_B;

% D cell in PB
migration_D_B = (par.V_D_AB * (par.V_A / par.V_B) * D_A - par.V_D_BA * D_B) + (par.V_D_CB * (par.V_C / par.V_B) * D_C - par.V_D_BC * D_B);
apoptosis_D_B = par.d_D * D_B;

% NK cell in PB
source_NK =  par.theta_NK_DB;
migration_NK_B = (par.V_NK_AB * (par.V_A / par.V_B) * NK_A - par.V_NK_BA * NK_B) + (par.V_NK_CB * (par.V_C / par.V_B) * NK_C - par.V_NK_BC * NK_B);
chemotaxis_NK_BC = (par.X_NKC9_BC * (C9_C / (par.K_C9 + C9_C)) + par.X_NKC10_BC * (C10_C / (par.K_C10 + C10_C))) * NK_B;
apoptosis_NK_B = par.d_NK * NK_B;

% M-MDSC cell in PB
source_MMDSC =  par.theta_MMDSC_DB;
migration_MMDSC_B = (par.V_MMDSC_CB * (par.V_C / par.V_B) * MMDSC_C - par.V_MMDSC_BC * MMDSC_B);
chemotaxis_MMDSC_BC = (par.X_MMDSCL2_BC * (L2_C / (par.K_L2 + L2_C)) + par.X_MMDSCC12_BC * (C12_C / (par.K_C12 + C12_C))) * MMDSC_B;
apoptosis_MMDSC_B = par.d_MMDSC * MMDSC_B;

% G-MDSC cell in PB
source_GMDSC =  par.theta_GMDSC_DB;
migration_GMDSC_B = (par.V_GMDSC_CB * (par.V_C / par.V_B) * GMDSC_C - par.V_GMDSC_BC * GMDSC_B);
chemotaxis_GMDSC_BC = (par.X_GMDSCL5_BC * (L5_C / (par.K_L5 + L5_C)) + par.X_GMDSCC8_BC * (C8_C / (par.K_C8 + C8_C))) * GMDSC_B;
apoptosis_GMDSC_B = par.d_GMDSC * GMDSC_B;

% M cell in PB
source_M =  par.theta_M_DB;
migration_M_B = (par.V_M_CB * (par.V_C / par.V_B) * M_C - par.V_M_BC * M_B);
chemotaxis_M_BC = (par.X_ML2_BC * (L2_C / (par.K_L2 + L2_C)) + par.X_ML5_BC * (L5_C / (par.K_L5 + L5_C)) ) * M_B;
apoptosis_M_B = par.d_M * M_B;

% M1 cell in PB
migration_M1_B = (par.V_M1_CB * (par.V_C / par.V_B) * M1_C - par.V_M1_BC * M1_B);
chemotaxis_M1_BC = (par.X_M1L2_BC * (L2_C / (par.K_L2 + L2_C)) + par.X_M1L5_BC * (L5_C / (par.K_L5 + L5_C)) ) * M1_B;
apoptosis_M1_B = par.d_M1 * M1_B;

% M2 cell in PB
migration_M2_B = (par.V_M2_CB * (par.V_C / par.V_B) * M2_C - par.V_M2_BC * M2_B);
chemotaxis_M2_BC = (par.X_M2L2_BC * (L2_C / (par.K_L2 + L2_C)) + par.X_M2L5_BC * (L5_C / (par.K_L5 + L5_C)) ) * M2_B;
apoptosis_M2_B = par.d_M2 * M2_B;

% N cell in PB
source_N =  par.theta_N_DB;
migration_N_B = (par.V_N_CB * (par.V_C / par.V_B) * N_C - par.V_N_BC * N_B);
chemotaxis_N_BC = (par.X_NC1_BC * (C1_C / (par.K_C1 + C1_C)) + par.X_NC2_BC * (C2_C / (par.K_C2 + C2_C)) + par.X_NC5_BC * (C5_C / (par.K_C5 + C5_C)) + par.X_NC8_BC * (C8_C / (par.K_C8 + C8_C))) * N_B;
apoptosis_N_B = par.d_N * N_B;

% N1 cell in PB
migration_N1_B = (par.V_N1_CB * (par.V_C / par.V_B) * N1_C - par.V_N1_BC * N1_B);
chemotaxis_N1_BC = (par.X_N1L5_BC * (L5_C / (par.K_L5 + L5_C)) + par.X_N1L19_BC * (L19_C / (par.K_L19 + L19_C)) + par.X_N1L21_BC * (L21_C / (par.K_L21 + L21_C)) + par.X_N1C9_BC * (C9_C / (par.K_C9 + C9_C)) + par.X_N1C10_BC * (C10_C / (par.K_C10 + C10_C))) * N1_B;
apoptosis_N1_B = par.d_N1 * N1_B;

% N2 cell in PB
migration_N2_B = (par.V_N2_CB * (par.V_C / par.V_B) * N2_C - par.V_N2_BC * N2_B);
chemotaxis_N2_BC = (par.X_N2C12_BC * (C12_C / (par.K_C12 + C12_C))) * N2_B;
apoptosis_N2_B = par.d_N2 * N2_B;

% Eos cell in PB
source_Eos =  par.theta_Eos_DB;
migration_Eos_B = (par.V_Eos_CB * (par.V_C / par.V_B) * Eos_C - par.V_Eos_BC * Eos_B);
chemotaxis_Eos_BC = (par.X_EosL11_BC * (L11_C / (par.K_L11 + L11_C))) * Eos_B;
apoptosis_Eos_B = par.d_Eos * Eos_B;

% Bas cell in PB
source_Bas =  par.theta_Bas_DB;
migration_Bas_B = (par.V_Bas_CB * (par.V_C / par.V_B) * Bas_C - par.V_Bas_BC * Bas_B);
chemotaxis_Bas_BC = (par.X_BasL2_BC * (L2_C / (par.K_L2 + L2_C)) + par.X_BasL11_BC * (L11_C / (par.K_L11 + L11_C))) * Bas_B;
apoptosis_Bas_B = par.d_Bas * Bas_B;

% ====== TME ======

% DSTC in TME
proliferation_X1_C = (par.beta_X1 / (1 + par.varepsilon_TX1 * Targ_C)) * (1 - (par.a11 * X1_C + par.a12 * X2_C + par.a13 * X3_C )/par.K1) * X1_C;
transformation_X3X1 = par.rho_X3X1 * ( Chem_C^par.n_c / (par.K_Chem^par.n_c + Chem_C^par.n_c) ) * X1_C;
apoptosis_X1_C = par.d_X1 * X1_C;
immune_X1_C = (par.eta_X1T1 * T1_C + par.eta_X1T8 * T8_C + par.eta_X1NK * NK_C) * (1 - par.lambda_PL * (PL_C / (par.K_PL + PL_C))) * X1_C;
chemotherapy_X1_C = par.sigma_X1 * (1 - exp(-par.varepsilon_CX1 * Chem_C)) * X1_C;

% DRTC in TME
proliferation_X2_C = (par.beta_X2 / (1 + par.varepsilon_TX2 * Targ_C)) * (1 - (par.a21 * X1_C + par.a22 * X2_C + par.a23 * X3_C )/par.K2) * X2_C;
transformation_X3X2 = par.rho_X3X2 * ( Chem_C^par.n_c / (par.K_Chem^par.n_c + Chem_C^par.n_c) ) * X2_C;
apoptosis_X2_C = par.d_X2 * X2_C;
immune_X2_C = (par.eta_X2T1 * T1_C + par.eta_X2T8 * T8_C + par.eta_X2NK * NK_C) * (1 - par.lambda_PL * (PL_C / (par.K_PL + PL_C))) * X2_C;
chemotherapy_X2_C = par.sigma_X2 * (1 - exp(-par.varepsilon_CX2 * Chem_C)) * X2_C;

% DPTC in TME
proliferation_X3_C = (par.beta_X3 / (1 + par.varepsilon_TX3 * Targ_C)) * (1 - (par.a31 * X1_C + par.a32 * X2_C + par.a33 * X3_C )/par.K3) * X3_C;
apoptosis_X3_C = par.d_X3 * X3_C;
immune_X3_C = (par.eta_X3T1 * T1_C + par.eta_X3T8 * T8_C + par.eta_X3NK * NK_C) * (1 - par.lambda_PL * (PL_C / (par.K_PL + PL_C))) * X3_C;

% TAA in TME
TA_C = (1 / par.d_TA) * ((par.kappa_1 * apoptosis_X1_C + par.kappa_1 * apoptosis_X2_C + par.kappa_1 * apoptosis_X3_C) + (par.kappa_2 * immune_X1_C + par.kappa_2 * immune_X2_C + par.kappa_3 * immune_X3_C) + (par.kappa_3 * chemotherapy_X1_C + par.kappa_3 * chemotherapy_X2_C)) ;

% T1 in TME
migration_T1_C = (par.V_T1_BC * (par.V_B / par.V_C) * T1_B - par.V_T1_CB * T1_C);
apoptosis_T1_C = par.d_T1 * (1 + par.lambda_T1PL * (PL_C / (par.K_PL + PL_C)) + par.lambda_T1Treg * (Treg_C / (par.K_T1Treg + Treg_C))) * T1_C;

% T2 in TME
migration_T2_C = (par.V_T2_BC * (par.V_B / par.V_C) * T2_B - par.V_T2_CB * T2_C);
apoptosis_T2_C = par.d_T2 * (1 + par.lambda_T2PL * (PL_C / (par.K_PL + PL_C))) * T2_C;

% T17 in TME
migration_T17_C = (par.V_T17_BC * (par.V_B / par.V_C) * T17_B - par.V_T17_CB * T17_C);
apoptosis_T17_C = par.d_T17 * (1 + par.lambda_T17PL * (PL_C / (par.K_PL + PL_C))) * T17_C;

% Treg in TME
migration_Treg_C = (par.V_Treg_BC * (par.V_B / par.V_C) * Treg_B - par.V_Treg_CB * Treg_C);
apoptosis_Treg_C = par.d_Treg * (1 - par.lambda_TregI2 * (I2_C / (par.K_I2 + I2_C))) * Treg_C;

% Tfh in TME
migration_Tfh_C = (par.V_Tfh_BC * (par.V_B / par.V_C) * Tfh_B - par.V_Tfh_CB * Tfh_C);
apoptosis_Tfh_C = par.d_Tfh * (1 + par.lambda_TfhPL * (PL_C / (par.K_PL + PL_C))) * Tfh_C;

% T8 in TME
migration_T8_C = (par.V_T8_BC * (par.V_B / par.V_C) * T8_B - par.V_T8_CB * T8_C);
apoptosis_T8_C = par.d_T8 * (1 + par.lambda_T8PL * (PL_C / (par.K_PL + PL_C)) + par.lambda_T8Treg * (Treg_C / (par.K_T8Treg + Treg_C))) * T8_C;

% D0 in TME
transformation_DD0 = par.rho_DD0 * (TA_C^par.n / (par.K_TA^par.n + TA_C^par.n )) * D0_C;
migration_D0_C = (par.V_D0_BC * (par.V_B / par.V_C) * D0_B - par.V_D0_CB * D0_C);
apoptosis_D0_C = par.d_D0 * D0_C;

% D in TME
migration_D_C = (par.V_D_BC * (par.V_B / par.V_C) * D_B - par.V_D_CB * D_C) - par.V_D_CA * D_C;
apoptosis_D_C = par.d_D * D_C;

% NK in TME
migration_NK_C = (par.V_NK_BC * (par.V_B / par.V_C) * NK_B - par.V_NK_CB * NK_C) ;
apoptosis_NK_C = par.d_NK * (1 + par.lambda_NKPL * (PL_C / (par.K_PL + PL_C))) * NK_C;

% MMDSC in TME
migration_MMDSC_C = (par.V_MMDSC_BC * (par.V_B / par.V_C) * MMDSC_B - par.V_MMDSC_CB * MMDSC_C) ;
apoptosis_MMDSC_C = par.d_MMDSC * MMDSC_C;

% GMDSC in TME
migration_GMDSC_C = (par.V_GMDSC_BC * (par.V_B / par.V_C) * GMDSC_B - par.V_GMDSC_CB * GMDSC_C) ;
apoptosis_GMDSC_C = par.d_GMDSC * GMDSC_C;

% M in TME
differentiation_M1_C = par.psi_M1 * (1 + par.lambda_MIgamma * (Igamma_C / (par.K_Igamma + Igamma_C))) * M_C;
differentiation_M2_C = par.psi_M2 * (1 + par.lambda_MTbeta * (Tbeta_C / (par.K_Tbeta + Tbeta_C)) + par.lambda_MI10 * (I10_C / (par.K_I10 + I10_C)) + par.lambda_MI4 * (I4_C / (par.K_I4 + I4_C))) * M_C;
migration_M_C = (par.V_M_BC * (par.V_B / par.V_C) * M_B - par.V_M_CB * M_C) ;
apoptosis_M_C = par.d_M * M_C;

% M1 in TME
transformation_M1M2 = par.rho_M1M2 * (I12_C / (par.K_I12 + I12_C) + Talpha_C / (par.K_Talpha + Talpha_C)  + Igamma_C / (par.K_Igamma + Igamma_C) ) * M2_C ;
transformation_M2M1 = par.rho_M2M1 * (Tbeta_C / (par.K_Tbeta + Tbeta_C) + I10_C / (par.K_I10 + I10_C)  + MCSF_C / (par.K_MCSF + MCSF_C) ) * M1_C ;
migration_M1_C = (par.V_M1_BC * (par.V_B / par.V_C) * M1_B - par.V_M1_CB * M1_C) ;
apoptosis_M1_C = par.d_M1 * M1_C;

% M2 in TME
migration_M2_C = (par.V_M2_BC * (par.V_B / par.V_C) * M2_B - par.V_M2_CB * M2_C) ;
apoptosis_M2_C = par.d_M2 * M2_C;

% N in TME
differentiation_N1_C = par.psi_N1 * (1 + par.lambda_NIgamma * (Igamma_C / (par.K_Igamma + Igamma_C)) + par.lambda_NTalpha * (Talpha_C / (par.K_Talpha + Talpha_C))) * N_C;
differentiation_N2_C = par.psi_N2 * (1 + par.lambda_NI10 * (I10_C / (par.K_I10 + I10_C)) + par.lambda_NTbeta * (Tbeta_C / (par.K_Tbeta + Tbeta_C)) + par.lambda_NGCSF * (GCSF_C / (par.K_GCSF + GCSF_C))) * N_C;
migration_N_C = (par.V_N_BC * (par.V_B / par.V_C) * N_B - par.V_N_CB * N_C) ;
apoptosis_N_C = par.d_N * N_C;

% N1 in TME
transformation_N1N2 = par.rho_N1N2 * (Igamma_C / (par.K_Igamma + Igamma_C) + Talpha_C / (par.K_Talpha + Talpha_C)) * N2_C ;
transformation_N2N1 = par.rho_N2N1 * (Tbeta_C / (par.K_Tbeta + Tbeta_C)) * N1_C ;
migration_N1_C = (par.V_N1_BC * (par.V_B / par.V_C) * N1_B - par.V_N1_CB * N1_C) ;
apoptosis_N1_C = par.d_N1 * N1_C;

% N2 in TME
migration_N2_C = (par.V_N2_BC * (par.V_B / par.V_C) * N2_B - par.V_N2_CB * N2_C) ;
apoptosis_N2_C = par.d_N2 * N2_C;

% Eos in TME
migration_Eos_C = (par.V_Eos_BC * (par.V_B / par.V_C) * Eos_B - par.V_Eos_CB * Eos_C) ;
apoptosis_Eos_C = par.d_Eos * Eos_C;

% Bas in TME
migration_Bas_C = (par.V_Bas_BC * (par.V_B / par.V_C) * Bas_B - par.V_Bas_CB * Bas_C) ;
apoptosis_Bas_C = par.d_Bas * Bas_C;

%% ODE in TDLN

y(1) = migration_D_A + chemotaxis_D_CA - apoptosis_D_A;
y(2) = proliferation_TN4_A - differentiation_T1_A - differentiation_T2_A - differentiation_T17_A - differentiation_Treg_A - differentiation_Tfh_A + migration_TN4_A + chemotaxis_TN4_BA - apoptosis_TN4_A;
y(3) = proliferation_T1_A + differentiation_T1_A + transformation_T1T17 + migration_T1_A - apoptosis_T1_A ;
y(4) = proliferation_T2_A + differentiation_T2_A + transformation_T2T17 + migration_T2_A - apoptosis_T2_A ;
y(5) = proliferation_T17_A + differentiation_T17_A - transformation_T1T17 - transformation_T2T17 + transformation_T17Treg + migration_T17_A - apoptosis_T17_A ;
y(6) = proliferation_Treg_A + differentiation_Treg_A - transformation_T17Treg + migration_Treg_A - apoptosis_Treg_A ;
y(7) = proliferation_Tfh_A + differentiation_Tfh_A + migration_Tfh_A - apoptosis_Tfh_A ;
y(8) = proliferation_TN8_A - differentiation_T8_A + migration_TN8_A + chemotaxis_TN8_BA - apoptosis_TN8_A ;
y(9) = proliferation_T8_A + differentiation_T8_A + migration_T8_A -apoptosis_T8_A ;
y(10) = proliferation_NK_A + migration_NK_A - apoptosis_NK_A ;

%% ODE in PB

y(11) = source_TN4 + migration_TN4_B - chemotaxis_TN4_BA - apoptosis_TN4_B ;
y(12) = migration_T1_B - chemotaxis_T1_BC - apoptosis_T1_B ;
y(13) = migration_T2_B - chemotaxis_T2_BC - apoptosis_T2_B ;
y(14) = migration_T17_B - chemotaxis_T17_BC - apoptosis_T17_B ;
y(15) = migration_Treg_B - chemotaxis_Treg_BC - apoptosis_Treg_B ;
y(16) = migration_Tfh_B - chemotaxis_Tfh_BC - apoptosis_Tfh_B ;
y(17) = source_TN8 + migration_TN8_B - chemotaxis_TN8_BA - apoptosis_TN8_B ;
y(18) = migration_T8_B - chemotaxis_T8_BC - apoptosis_T8_B ;
y(19) = source_D0 + migration_D0_B - chemotaxis_D0_BC - apoptosis_D0_B ;
y(20) = migration_D_B - apoptosis_D_B ;
y(21) = source_NK + migration_NK_B - chemotaxis_NK_BC - apoptosis_NK_B ;
y(22) = source_MMDSC + migration_MMDSC_B - chemotaxis_MMDSC_BC - apoptosis_MMDSC_B ;
y(23) = source_GMDSC + migration_GMDSC_B - chemotaxis_GMDSC_BC - apoptosis_GMDSC_B ;
y(24) = source_M + migration_M_B - chemotaxis_M_BC - apoptosis_M_B ;
y(25) = migration_M1_B - chemotaxis_M1_BC - apoptosis_M1_B ;
y(26) = migration_M2_B - chemotaxis_M2_BC - apoptosis_M2_B ;
y(27) = source_N + migration_N_B - chemotaxis_N_BC - apoptosis_N_B ;
y(28) = migration_N1_B - chemotaxis_N1_BC - apoptosis_N1_B ;
y(29) = migration_N2_B - chemotaxis_N2_BC - apoptosis_N2_B ;
y(30) = source_Eos + migration_Eos_B - chemotaxis_Eos_BC - apoptosis_Eos_B ;
y(31) = source_Bas + migration_Bas_B - chemotaxis_Bas_BC - apoptosis_Bas_B ;

%% ODE in TME

y(32) = proliferation_X1_C - transformation_X3X1 - apoptosis_X1_C - immune_X1_C - chemotherapy_X1_C ;
y(33) = proliferation_X2_C - transformation_X3X2 - apoptosis_X2_C - immune_X2_C  - chemotherapy_X2_C ;
y(34) = proliferation_X3_C + transformation_X3X1 + transformation_X3X1 - apoptosis_X3_C - immune_X3_C ; 
y(35) = migration_T1_C + chemotaxis_T1_BC - apoptosis_T1_C  ;
y(36) = migration_T2_C + chemotaxis_T2_BC - apoptosis_T2_C  ;
y(37) = migration_T17_C + chemotaxis_T17_BC - apoptosis_T17_C  ;
y(38) = migration_Treg_C + chemotaxis_Treg_BC - apoptosis_Treg_C  ;
y(39) = migration_Tfh_C + chemotaxis_Tfh_BC - apoptosis_Tfh_C  ;
y(40) = migration_T8_C + chemotaxis_T8_BC - apoptosis_T8_C  ;
y(41) = - transformation_DD0 + migration_D0_C + chemotaxis_D0_BC - apoptosis_D0_C  ;
y(42) = transformation_DD0 + migration_D_C - chemotaxis_D_CA - apoptosis_D_C ;
y(43) = migration_NK_C + chemotaxis_NK_BC - apoptosis_NK_C  ;
y(44) = migration_MMDSC_C + chemotaxis_MMDSC_BC - apoptosis_MMDSC_C  ;
y(45) = migration_GMDSC_C + chemotaxis_GMDSC_BC - apoptosis_GMDSC_C  ;
y(46) = - differentiation_M1_C - differentiation_M2_C + migration_M_C + chemotaxis_M_BC - apoptosis_M_C  ;
y(47) = differentiation_M1_C + transformation_M1M2 - transformation_M2M1 + migration_M1_C + chemotaxis_M1_BC - apoptosis_M1_C  ;
y(48) = differentiation_M2_C - transformation_M1M2 + transformation_M2M1 + migration_M2_C + chemotaxis_M2_BC - apoptosis_M2_C ;
y(49) = - differentiation_N1_C - differentiation_N2_C + migration_N_C + chemotaxis_N_BC - apoptosis_N_C  ;
y(50) = differentiation_N1_C + transformation_N1N2 - transformation_N2N1 + migration_N1_C + chemotaxis_N1_BC - apoptosis_N1_C  ;
y(51) = differentiation_N2_C - transformation_N1N2 + transformation_N2N1 + migration_N2_C + chemotaxis_N2_BC - apoptosis_N2_C  ;
y(52) = migration_Eos_C + chemotaxis_Eos_BC - apoptosis_Eos_C  ;
y(53) = migration_Bas_C + chemotaxis_Bas_BC - apoptosis_Bas_C  ;


end