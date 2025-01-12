
% Load data
file_Para='./VP/Parameter.mat';
A=(cell2mat(struct2cell(load(file_Para))))';
file_Out='./VP/Outcome.mat';
B=cell2mat(struct2cell(load(file_Out)));

% Correlation analysis (PCC)
Par_sample = size(A,2);
PCC = size(Par_sample,1);
for i = 1:Par_sample
PCC(i) = corr(A(:,i),B, 'type','pearson');
end

% Data save
Data = cell(Par_sample,2);
stringsName = {'par.V_D_CA';'par.V_D_BA';'par.V_D_AB';'par.V_D_CB';'par.V_D0_CB';'par.V_D_BC';'par.V_D0_BC';'par.V_TN4_BA';'par.V_TN8_BA';'par.V_TN4_AB';
    'par.V_TN8_AB';'par.V_T1_BA';'par.V_T2_BA';'par.V_T17_BA';'par.V_Treg_BA';'par.V_Tfh_BA';'par.V_T8_BA';'par.V_T1_AB';'par.V_T2_AB';'par.V_T17_AB';
    'par.V_Treg_AB';'par.V_Tfh_AB';'par.V_T8_AB';'par.V_T1_CB';'par.V_T2_CB';'par.V_T17_CB';'par.V_Treg_CB';'par.V_Tfh_CB';'par.V_T8_CB';'par.V_T1_BC';
    'par.V_T2_BC';'par.V_T17_BC';'par.V_Treg_BC';'par.V_Tfh_BC';'par.V_T8_BC';'par.V_NK_BA';'par.V_NK_AB';'par.V_NK_CB';'par.V_NK_BC';'par.V_MMDSC_CB';
    'par.V_M_CB';'par.V_M1_CB';'par.V_M2_CB';'par.V_MMDSC_BC';'par.V_M_BC';'par.V_M1_BC';'par.V_M2_BC';'par.V_GMDSC_CB';'par.V_N_CB';'par.V_N1_CB';
    'par.V_N2_CB';'par.V_Eos_CB';'par.V_Bas_CB';'par.V_GMDSC_BC';'par.V_N_BC';'par.V_N1_BC';'par.V_N2_BC';'par.V_Eos_BC';'par.V_Bas_BC';'par.V_A';
    'par.V_B';'par.V_C';'par.beta_TN4';'par.beta_TN8';'par.beta_T1';'par.beta_T2';'par.beta_T17';'par.beta_Treg';'par.beta_Tfh';'par.beta_T8';
    'par.beta_NK';'par.lambda_T1I2';'par.lambda_betaT2I4';'par.lambda_T17I21';'par.lambda_TregI21';'par.lambda_TfhI21';'par.lambda_T8I2';'par.lambda_T8I21';'par.lambda_NKI12';'par.lambda_NKI21';
    'par.K_TN4';'par.K_TN8';'par.kappa_T1';'par.kappa_T2';'par.kappa_T17';'par.kappa_Treg';'par.kappa_Tfh';'par.kappa_T8';'par.lambda_T1I12';'par.lambda_T1Igamma';
    'par.lambda_kappaT2I4';'par.lambda_T17I6Tbeta';'par.lambda_TregTbeta';'par.lambda_TfhI6';'par.lambda_TfhI21';'par.lambda_T8I12';'par.psi_M1';'par.psi_M2';'par.psi_N1';'par.psi_N2';
    'par.lambda_MIgamma';'par.lambda_MTbeta';'par.lambda_MI10';'par.lambda_MI4';'par.lambda_NIgamma';'par.lambda_NTalpha';'par.lambda_NI10';'par.lambda_NTbeta';'par.lambda_NGCSF';'par.rho_T1T17';
    'par.rho_T2T17';'par.rho_T17Treg';'par.rho_M1M2';'par.rho_M2M1';'par.rho_N1N2';'par.rho_N2N1';'par.X_DL19_CA';'par.X_DL21_CA';'par.X_TN4L19_BA';'par.X_TN4L21_BA';
    'par.X_TN8L19_BA';'par.X_TN8L21_BA';'par.X_T1C9_BC';'par.X_T1C10_BC';'par.X_T1L3_BC';'par.X_T1L4_BC';'par.X_T1L5_BC';'par.X_T2L1_BC';'par.X_T2L17_BC';'par.X_T2L22_BC';
    'par.X_T17L17_BC';'par.X_T17L20_BC';'par.X_T17L22_BC';'par.X_T17C12_BC';'par.X_TregL1_BC';'par.X_TregL17_BC';'par.X_TregL22_BC';'par.X_TfhC13_BC';'par.X_T8C9_BC';'par.X_T8C10_BC';
    'par.X_T8C12_BC';'par.X_D0L20_BC';'par.X_NKC9_BC';'par.X_NKC10_BC';'par.X_MMDSCL2_BC';'par.X_MMDSCC12_BC';'par.X_GMDSCL5_BC';'par.X_GMDSCC8_BC';'par.X_ML2_BC';'par.X_ML5_BC';
    'par.X_M1L2_BC';'par.X_M1L5_BC';'par.X_M2L2_BC';'par.X_M2L5_BC';'par.X_NC1_BC';'par.X_NC2_BC';'par.X_NC5_BC';'par.X_NC8_BC';'par.X_N1L5_BC';'par.X_N1L19_BC';
    'par.X_N1L21_BC';'par.X_N1C9_BC';'par.X_N1C10_BC';'par.X_N2C12_BC';'par.X_EosL11_BC';'par.X_BasL2_BC';'par.X_BasL11_BC';'par.K_D';'par.K_T1';'par.K_T2';
    'par.K_T17';'par.K_Treg';'par.K_Tfh';'par.K_NK';'par.K_T8';'par.K_I2';'par.K_I4';'par.K_I6';'par.K_I10';'par.K_I12';
    'par.K_I21';'par.K_Igamma';'par.K_Talpha';'par.K_Tbeta';'par.K_MCSF';'par.K_GCSF';'par.K_I6Tbeta';'par.K_T1I4';'par.K_T1Tbeta';'par.K_T2Igamma';
    'par.K_T2Tbeta';'par.K_T17Igamma';'par.K_T17I4';'par.K_TregIgamma';'par.K_TfhI2';'par.K_T8I10';'par.K_T8Tbeta';'par.K_NKI10';'par.K_L1';'par.K_L2';
    'par.K_L3';'par.K_L4';'par.K_L5';'par.K_L11';'par.K_L17';'par.K_L19';'par.K_L20';'par.K_L21';'par.K_L22';'par.K_C1';
    'par.K_C2';'par.K_C5';'par.K_C8';'par.K_C9';'par.K_C10';'par.K_C12';'par.K_C13';'par.d_D';'par.d_D0';'par.d_TN4';
    'par.d_TN8';'par.d_T1';'par.d_T2';'par.d_T17';'par.d_Treg';'par.d_Tfh';'par.d_T8';'par.d_NK';'par.d_MMDSC';'par.d_GMDSC';
    'par.d_M';'par.d_M1';'par.d_M2';'par.d_N';'par.d_N1';'par.d_N2';'par.d_Eos';'par.d_Bas';'par.lambda_TregI2';'par.lambda_T1';
    'par.lambda_T2';'par.lambda_T17';'par.lambda_Treg';'par.lambda_Tfh';'par.lambda_T8';'par.lambda_NK';'par.theta_TN4_DB';'par.theta_TN8_DB';'par.theta_D0_DB';'par.theta_NK_DB';
    'par.theta_MMDSC_DB';'par.theta_GMDSC_DB';'par.theta_M_DB';'par.theta_N_DB';'par.theta_Eos_DB';'par.theta_Bas_DB';'par.delta_I2T1';'par.delta_I2T8';'par.delta_I4T2';'par.delta_I4Tfh';
    'par.delta_I4Eos';'par.delta_I4Bas';'par.delta_I6T2';'par.delta_I10T2';'par.delta_I10Treg';'par.delta_I10M2';'par.delta_I10N2';'par.delta_I10MMDSC';'par.delta_I10GMDSC';'par.delta_I10X';
    'par.delta_I12D';'par.delta_I12M1';'par.delta_I12Eos';'par.delta_I21T2';'par.delta_I21T17';'par.delta_I21Tfh';'par.delta_I21NK';'par.delta_IgammaT1';'par.delta_IgammaT8';'par.delta_IgammaNK';
    'par.delta_IgammaN1';'par.delta_TbetaTreg';'par.delta_TbetaX';'par.delta_TbetaM2';'par.delta_TbetaN2';'par.delta_TalphaM1';'par.delta_TalphaT1';'par.delta_TalphaT8';'par.delta_TalphaN1';'par.delta_MCSFX';
    'par.delta_GCSFX';'par.delta_C1X';'par.delta_C2X';'par.delta_C5X';'par.delta_C8Treg';'par.delta_C8X';'par.delta_C9D';'par.delta_C9X';'par.delta_C9M1';'par.delta_C10D';
    'par.delta_C10X';'par.delta_C10M1';'par.delta_C12X';'par.delta_C13D';'par.delta_C13Tfh';'par.delta_C13M2';'par.delta_L1Treg';'par.delta_L1M2';'par.delta_L2M1';'par.delta_L2N1';
    'par.delta_L2X';'par.delta_L3M1';'par.delta_L3N1';'par.delta_L3MMDSC';'par.delta_L3X';'par.delta_L4M1';'par.delta_L4N2';'par.delta_L4MMDSC';'par.delta_L5M1';'par.delta_L5N2';
    'par.delta_L5X';'par.delta_L5T8';'par.delta_L5MMDSC';'par.delta_L5NK';'par.delta_L11X';'par.delta_L11Eos';'par.delta_L17D';'par.delta_L17M2';'par.delta_L17N2';'par.delta_L19D';
    'par.delta_L20X';'par.delta_L21D';'par.delta_L22D';'par.delta_L22M2';'par.delta_L22X';'par.d_TA';'par.d_I2';'par.d_I4';'par.d_I6';'par.d_I10';
    'par.d_I12';'par.d_I21';'par.d_Igamma';'par.d_Tbeta';'par.d_Talpha';'par.d_MCSF';'par.d_GCSF';'par.d_C1';'par.d_C2';'par.d_C5';
    'par.d_C8';'par.d_C9';'par.d_C10';'par.d_C12';'par.d_C13';'par.d_L1';'par.d_L2';'par.d_L3';'par.d_L4';'par.d_L5';
    'par.d_L11';'par.d_L17';'par.d_L19';'par.d_L20';'par.d_L21';'par.d_L22';'par.kappa_1';'par.kappa_2';'par.kappa_3';'par.n';
    'par.K_TA';'par.rho_DD0';'par.phi_P';'par.phi_L';'par.alpha_PL';'par.varepsilon_NK';'par.lambda_PL';'par.K_PL';'par.K_T1Treg';'par.K_T8Treg';
    'par.lambda_T1PL';'par.lambda_T2PL';'par.lambda_T17PL';'par.lambda_TfhPL';'par.lambda_T8PL';'par.lambda_NKPL';'par.lambda_T1Treg';'par.lambda_T8Treg';'par.beta_X1';'par.beta_X2';
    'par.d_X1';'par.d_X2';'par.a11';'par.a12';'par.a21';'par.a22';'par.K1';'par.K2';'par.eta_X1T1';'par.eta_X2T1';
    'par.eta_X1T8';'par.eta_X2T8';'par.eta_X1NK';'par.eta_X2NK'};
for i = 1:Par_sample
    Data{i,1} = stringsName{i};
    Data{i,2} = PCC(i);
end

% Writes the cell array to excel
filename = 'PCC.xlsx';
writecell(Data,filename);


