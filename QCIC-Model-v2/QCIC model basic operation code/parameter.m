function parameter()

global par

%% kinetic parameters of migration

par.V_D_CA = 0.65;%
par.V_D_BA = 1e-3;%
par.V_D_AB = 0.4;%

par.V_D_CB = 2;%
par.V_D0_CB = 2;%
par.V_D_BC = 0.4;%
par.V_D0_BC = 0.4;%

par.V_TN4_BA = 1e-3;%
par.V_TN8_BA = 1e-3;%
par.V_TN4_AB = 0.2;%
par.V_TN8_AB = 0.2;%

par.V_T1_BA = 1e-3;%
par.V_T2_BA = 1e-3;%
par.V_T17_BA = 1e-3;%
par.V_Treg_BA = 1e-3;%
par.V_Tfh_BA = 1e-3;%
par.V_T8_BA = 1e-3;%

par.V_T1_AB = 0.65;%
par.V_T2_AB = 0.65;%
par.V_T17_AB = 0.65;%
par.V_Treg_AB = 0.65;%
par.V_Tfh_AB = 0.65;%
par.V_T8_AB = 0.65;%

par.V_T1_CB = 2;%
par.V_T2_CB = 2;%
par.V_T17_CB = 2;%
par.V_Treg_CB = 2;%
par.V_Tfh_CB = 2;%
par.V_T8_CB = 2;%

par.V_T1_BC = 0.65;%
par.V_T2_BC = 0.65;%
par.V_T17_BC = 0.65;%
par.V_Treg_BC = 0.65;%
par.V_Tfh_BC = 0.65;%
par.V_T8_BC = 0.65;%

par.V_NK_BA = 1e-3;%
par.V_NK_AB = 0.65;%
par.V_NK_CB = 2;%
par.V_NK_BC = 0.65;%

par.V_MMDSC_CB = 1.25;%
par.V_M_CB = 1.25;%
par.V_M1_CB = 1.25;%
par.V_M2_CB = 1.25;%

par.V_MMDSC_BC = 0.15;%
par.V_M_BC = 0.15;%
par.V_M1_BC = 0.15;%
par.V_M2_BC = 0.15;%

par.V_GMDSC_CB = 1.75;%
par.V_N_CB = 1.75;%
par.V_N1_CB = 1.75;%
par.V_N2_CB = 1.75;%
par.V_Eos_CB = 1.75;%
par.V_Bas_CB = 1.75;%

par.V_GMDSC_BC = 0.25;%
par.V_N_BC = 0.25;%
par.V_N1_BC = 0.25;%
par.V_N2_BC = 0.25;%
par.V_Eos_BC = 0.25;%
par.V_Bas_BC = 0.25;%

%% kinetic parameters of volume

par.V_A = 0.01;%
par.V_B = 4.50;%
par.V_C = 0.80;

%% kinetic parameters of proliferation

par.beta_TN4 = 0.5;%
par.beta_TN8 = 0.5;%
par.beta_T1 = 0.3;%
par.beta_T2 = 0.25;%
par.beta_T17 = 0.15;%
par.beta_Treg = 0.2;%
par.beta_Tfh = 0.15;%
par.beta_T8 = 0.4;%
par.beta_NK = 0.1;%
par.lambda_T1I2 = 0.25;
par.lambda_betaT2I4 = 0.25;
par.lambda_T17I21 = 0.05;
par.lambda_TregI21 = 0.05;
par.lambda_TfhI21 = 0.10;
par.lambda_T8I2 = 0.25;%
par.lambda_T8I21 = 0.05;
par.lambda_NKI12 = 0.15;
par.lambda_NKI21 = 0.05;

% par.K_TN4 = 5e7;%
% par.K_TN8 = 5e7;%


%% kinetic parameters of differentiation

par.kappa_T1 = 0.2;%
par.kappa_T2 = 0.06;%
par.kappa_T17 = 0.02;%
par.kappa_Treg = 0.05;%
par.kappa_Tfh = 0.04;
par.kappa_T8 = 0.1;%

par.lambda_T1I12 = 0.6;%
par.lambda_T1Igamma = 0.6;%
par.lambda_kappaT2I4 = 0.5;%
par.lambda_T17I6Tbeta = 0.05;%
par.lambda_TregTbeta = 0.05;%
par.lambda_TfhI6 = 0.3;
par.lambda_TfhI21 = 0.4;
par.lambda_T8I12 = 0.2;


%% kinetic parameters of polarization

par.psi_M1 = 0.3;
par.psi_M2 = 0.3;
par.psi_N1 = 0.3;
par.psi_N2 = 0.3;

par.lambda_MIgamma = 0.6;
par.lambda_MTbeta = 0.1;
par.lambda_MI10 = 0.1;
par.lambda_MI4 = 0.5;
par.lambda_NIgamma = 0.3;
par.lambda_NTalpha = 0.2;
par.lambda_NI10 = 0.1;
par.lambda_NTbeta = 0.1;
par.lambda_NGCSF = 0.3;


%% kinetic parameters of phenotype

par.rho_T1T17 = 2.5e-2;
par.rho_T2T17 = 2.5e-2;
par.rho_T17Treg = 2.5e-2;
par.rho_M1M2 = 2.34e-3;%
par.rho_M2M1 = 1.5e-1;%
par.rho_N1N2 = 2.5e-3;
par.rho_N2N1 = 1.25e-1;


%% kinetic parameters of chemotaxis

par.X_DL19_CA = 0.1;
par.X_DL21_CA = 0.1;
par.X_TN4L19_BA = 0.1;
par.X_TN4L21_BA = 0.5;%
par.X_TN8L19_BA = 0.1;
par.X_TN8L21_BA = 0.5;%

par.X_T1C9_BC = 0.09;%
par.X_T1C10_BC = 0.15;%
par.X_T1L3_BC = 0.11;%
par.X_T1L4_BC = 0.17;%
par.X_T1L5_BC = 0.22;%
par.X_T2L1_BC = 0.1;
par.X_T2L17_BC = 0.35;%
par.X_T2L22_BC = 0.58;%
par.X_T17L17_BC = 0.1;
par.X_T17L20_BC = 0.11;%
par.X_T17L22_BC = 0.1;
par.X_T17C12_BC = 0.1;
par.X_TregL1_BC = 0.04;%
par.X_TregL17_BC  = 0.15;%
par.X_TregL22_BC = 0.17;%
par.X_TfhC13_BC = 0.02;%
par.X_T8C9_BC = 0.09;%
par.X_T8C10_BC = 0.12;%
par.X_T8C12_BC = 0.55;%
par.X_D0L20_BC = 0.02;%
par.X_NKC9_BC = 0.09;%
par.X_NKC10_BC = 0.15;%
par.X_MMDSCL2_BC = 0.1;
par.X_MMDSCC12_BC = 0.1;
par.X_GMDSCL5_BC = 0.1;
par.X_GMDSCC8_BC = 0.1;
par.X_ML2_BC = 0.35;%
par.X_ML5_BC = 0.14;%
par.X_M1L2_BC = 0.15;%
par.X_M1L5_BC = 0.56;%
par.X_M2L2_BC = 0.13;%
par.X_M2L5_BC = 0.25;%
par.X_NC1_BC = 0.15;
par.X_NC2_BC = 0.15;
par.X_NC5_BC = 0.05;
par.X_NC8_BC = 0.55;%
par.X_N1L5_BC = 0.1;
par.X_N1L19_BC = 0.1;
par.X_N1L21_BC = 0.1;
par.X_N1C9_BC = 0.1;
par.X_N1C10_BC = 0.1;
par.X_N2C12_BC = 0.05;%
par.X_EosL11_BC = 0.1;
par.X_BasL2_BC = 0.1;
par.X_BasL11_BC = 0.1;

%% kinetic parameters of half-saturation

par.K_D = 1e9;
par.K_T1 = 7e10;%
par.K_T2 = 3e10;%
par.K_T17 = 2e10; %
par.K_Treg = 5.5e10;%
par.K_Tfh = 2e10;%
par.K_NK = 5e10;
par.K_T8 = 1.2e11;%

par.K_I2 = 5e3;%
par.K_I4 = 6.5e4;%
par.K_I6 = 3e3;%
par.K_I10 = 6e3;%
par.K_I12 = 8e3;%
par.K_I21 = 1.5e2;
par.K_Igamma = 1e4;%
par.K_Talpha = 3e4;%
par.K_Tbeta = 2.06e4;%
par.K_MCSF = 1e3;%
par.K_GCSF = 1e3;
par.K_I6Tbeta = 6e7;

par.K_T1I4 = 3.25e4;
par.K_T1Tbeta = 1.03e4;
par.K_T2Igamma = 5e3;
par.K_T2Tbeta = 1.03e4;
par.K_T17Igamma = 5e3;
par.K_T17I4 = 3.25e4;
par.K_TregIgamma = 5e3;
par.K_TfhI2 = 2.5e3;
par.K_T8I10 = 4.37e4;%
par.K_T8Tbeta = 1.03e4;
par.K_NKI10 = 4.37e4;

par.K_L1 = 5.5e4;%
par.K_L2 = 7.5e4;%
par.K_L3 = 4e3;%
par.K_L4 = 5e4;
par.K_L5 = 1.5e3;
par.K_L11 = 6e4;%
par.K_L17 = 2.5e4;%
par.K_L19 = 2e5;%
par.K_L20 = 8e3;%
par.K_L21 = 2e7;%
par.K_L22 = 5e5;%

par.K_C1 = 1.7e5;%
par.K_C2 = 2.5e5;%
par.K_C5 = 8e5;%
par.K_C8 = 5e3;%
par.K_C9 = 5e4;%
par.K_C10 = 1.75e5;%
par.K_C12 = 1.8e6;%
par.K_C13 = 3e4;%


%% kinetic parameters of apoptosis

par.d_D = 0.1;%
par.d_D0 = 0.1;%
par.d_TN4 = 0.05;%
par.d_TN8 = 0.05;%
par.d_T1 = 0.197;%%
par.d_T2 = 0.2;%%
par.d_T17 = 0.2;%%
par.d_Treg = 0.2;%%
par.d_Tfh = 0.2;
par.d_T8 = 0.18;%%
par.d_NK = 0.3;%
par.d_MMDSC = 0.3;%
par.d_GMDSC = 0.3;%
par.d_M = 0.3;%
par.d_M1 = 0.1;
par.d_M2 = 0.1;
par.d_N = 1.8;
par.d_N1 = 0.6;
par.d_N2 = 0.6;
par.d_Eos = 0.1;
par.d_Bas = 0.1;

par.lambda_TregI2 = 0.8;
par.lambda_T1 = 0.1;
par.lambda_T2 = 0.1;
par.lambda_T17 = 0.1;
par.lambda_Treg = 0.1;
par.lambda_Tfh = 0.1;
par.lambda_T8 = 0.3;
par.lambda_NK = 0.1;

%% kinetic parameters of source

par.theta_TN4_DB = 3e8;
par.theta_TN8_DB = 2e8;
par.theta_D0_DB = 3e8;
par.theta_NK_DB = 5e8;%
par.theta_MMDSC_DB = 2e8;
par.theta_GMDSC_DB = 3e8;
par.theta_M_DB = 1e9;%
par.theta_N_DB = 1.5e10;%
par.theta_Eos_DB = 4e8;%
par.theta_Bas_DB = 1e8;%

%% kinetic parameters of secretion (cytokine)

par.delta_I2T1 = 5e-4;%
par.delta_I2T8 = 5e-4;
par.delta_I4T2 = 1e-3;%
par.delta_I4Tfh = 1e-5;
par.delta_I4Eos = 3e-5;
par.delta_I4Bas = 6e-5;
par.delta_I6T2 = 1e-4;
par.delta_I10T2 = 2e-4;
par.delta_I10Treg = 1.4e-5;%
par.delta_I10M2 = 8e-7;
par.delta_I10N2 = 8e-7;
par.delta_I10MMDSC = 2e-7;
par.delta_I10GMDSC = 2e-7;
par.delta_I10X = 1.3e-7;%
par.delta_I12D = 5e-5;
par.delta_I12M1 = 5.5e-6;%
par.delta_I12Eos = 8e-7;
par.delta_I21T2 = 4e-5;
par.delta_I21T17 = 5e-6;
par.delta_I21Tfh = 5e-6;
par.delta_I21NK = 1e-6;
par.delta_IgammaT1 = 1e-4;
par.delta_IgammaT8 = 1e-4;%
par.delta_IgammaNK = 5e-6;%
par.delta_IgammaN1 = 5e-5;
par.delta_TbetaTreg = 5e-2;
par.delta_TbetaX = 1.1e-6;%
par.delta_TbetaM2 = 8e-3;
par.delta_TbetaN2 = 1e-2;
par.delta_TalphaM1 = 1e-6;%
par.delta_TalphaT1 = 5e-4;%
par.delta_TalphaT8 = 2e-4;%
par.delta_TalphaN1 = 5e-3;
par.delta_MCSFX = 6.0e-7;
par.delta_GCSFX = 6.0e-7;

%% kinetic parameters of secretion (chemokine)

par.delta_C1X = 7e-2;
par.delta_C2X = 7.5e-2;
par.delta_C5X = 9e-2;
par.delta_C8Treg = 7.5e-5;
par.delta_C8X = 6e-5;
par.delta_C9D = 2.5e-4;
par.delta_C9X = 6e-4;
par.delta_C9M1 = 3e-10;%
par.delta_C10D = 1e-3;
par.delta_C10X = 8e-2;
par.delta_C10M1 = 1e-10;%
par.delta_C12X = 8e-2;
par.delta_C13D = 2e-3;
par.delta_C13Tfh = 1e-4;
par.delta_C13M2 = 2.5e-4;

par.delta_L1Treg = 5e-3;
par.delta_L1M2 = 1.5e-3;
par.delta_L2M1 = 9e-6;%
par.delta_L2N1 = 9e-5;
par.delta_L2X = 8.2e-7;%
par.delta_L3M1 = 5e-5;
par.delta_L3N1 = 8e-5;
par.delta_L3MMDSC = 5e-7;
par.delta_L3X = 2e-5;
par.delta_L4M1 = 5e-4;
par.delta_L4N2 = 2.5e-3;
par.delta_L4MMDSC = 3e-5;
par.delta_L5M1 = 1.5e-6;
par.delta_L5N2 = 6e-6;
par.delta_L5X = 1.5e-5;
par.delta_L5T8 = 2.5e-6;
par.delta_L5MMDSC = 4e-7;
par.delta_L5NK = 2.5e-7;
par.delta_L11X = 1e-3;
par.delta_L11Eos = 5e-4;
par.delta_L17D = 2e-8;%
par.delta_L17M2 = 8e-4;
par.delta_L17N2 = 5e-4;
par.delta_L19D = 3e-4;
par.delta_L20X = 1.2e-4;
par.delta_L21D = 5e-3;
par.delta_L22D = 8e-2;
par.delta_L22M2 = 8e-2;
par.delta_L22X = 1.25e-2;


%% kinetic parameters of degradation

par.d_TA = 0.01;%
par.d_I2 = 2.38;%
par.d_I4 = 1.00;%
par.d_I6 = 4.16;%
par.d_I10 = 8.32;%
par.d_I12 = 1.38;%
par.d_I21 = 5.00;
par.d_Igamma = 7.68;%
par.d_Tbeta = 499.07;%
par.d_Talpha = 55.01;%
par.d_MCSF = 4.8;%
par.d_GCSF = 8.32;%

par.d_C1 = 69.31;%
par.d_C2 = 69.31;%
par.d_C5 = 693.15;%
par.d_C8 = 27.73;%
par.d_C9 = 40.77;%
par.d_C10 = 256.72;%
par.d_C12 = 1980.42;%
par.d_C13 = 23.10;%

par.d_L1 = 20.00;
par.d_L2 = 1.73;%
par.d_L3 = 11.09;%
par.d_L4 = 20.00;
par.d_L5 = 2.47;%
par.d_L11 = 34.66;%
par.d_L17 = 20.00;
par.d_L19 = 20.00;
par.d_L20 = 20.00;
par.d_L21 = 20.00;
par.d_L22 = 288.81;%


%% kinetic parameters of antigen presentation

par.kappa_1 = 0.1;
par.kappa_2 = 0.3;
par.kappa_3 = 0.6;

par.n = 2;
par.K_TA = 5e8;
% par.rho_DD0 = 0.8;


%% kinetic parameters of immunosuppression

% par.phi_P = 2.49e-7;%
% par.phi_L = 5.22e-7;%
par.alpha_PL = 0.1;
par.varepsilon_NK = 5e-4;

par.lambda_PL = 0.5;
par.K_PL = 150;
par.K_T1Treg = 1e5;
par.K_T8Treg = 1e5;

par.lambda_T1PL = 0.8;
par.lambda_T2PL = 0.8;
par.lambda_T17PL = 0.8;
par.lambda_TfhPL = 0.8;
par.lambda_T8PL = 0.8;
par.lambda_NKPL = 0.8;
par.lambda_T1Treg = 0.8;
par.lambda_T8Treg = 0.8;

%% kinetic parameters of pharmacokinetics

par.k_in_Targ = 0;%
par.k_in_Chem = 0;%

par.k_12_Trag = 0.223;%
par.k_21_Trag = 0.215;%
par.k_10_Trag = 0.0779;%

par.k_12_Chem = 3.64;%
par.k_21_Chem = 5.55;%
par.k_10_Chem = 7.81;%

%% kinetic parameters of tumor

% par.beta_X1 = 0.0665;
% par.beta_X2 = 0.0365;
% par.beta_X3 = 0.0415;

par.d_X1 = 0.05;
par.d_X2 = 0.02;
par.d_X3 = 0.01;

par.a11 = 1;
par.a12 = 2;
par.a13 = 3;
par.a21 = 1.5;
par.a22 = 1;
par.a23 = 2;
par.a31 = 1;
par.a32 = 1;
par.a33 = 1;

par.K1 = 5e9;
par.K2 = 3e9;
par.K3 = 1.5e9;

% par.rho_X3X1 = 0.6;
% par.rho_X3X2 = 0.9;
par.n_c = 2;
% par.sigma_X1 = 0.05;
% par.sigma_X2 = 0.1;
par.sigma_X3 = 0;
par.K_Chem = 47.5;
% par.varepsilon_TX1 = 5.25e-3;
% par.varepsilon_TX2 = 3.25e-3;
% par.varepsilon_TX3 = 1.25e-3;
par.varepsilon_CX1 = 2.10e-2;
par.varepsilon_CX2 = 2.10e-2;
par.varepsilon_CX3 = 0;

par.eta_X1T1 = 5e-10;
par.eta_X2T1 = 5e-10;
par.eta_X3T1 = 5e-10;
par.eta_X1T8 = 5e-9;
par.eta_X2T8 = 5e-9;
par.eta_X3T8 = 5e-9;
par.eta_X1NK = 1e-12;
par.eta_X2NK = 1e-12;
par.eta_X3NK = 1e-12;


end