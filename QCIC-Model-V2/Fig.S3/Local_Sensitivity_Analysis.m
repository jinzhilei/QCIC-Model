function Local_Sensitivity_Analysis()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Parameter Sensitivity Analysis (Local Sensitivity Analysis)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic parameter input
global par
Y = [0.65;1e-3;0.4;2;2;0.4;0.4;1e-3;1e-3;0.2;0.2;1e-3;1e-3;1e-3;1e-3;1e-3;1e-3;0.65;0.65;0.65;0.65;0.65;0.65;2;2;2;2;2;2;0.65;0.65;0.65;0.65;0.65;0.65;1e-3;0.65;2;0.65;1.25;1.25;1.25;1.25;0.15;0.15;0.15;0.15;
    1.75;1.75;1.75;1.75;1.75;1.75;0.25;0.25;0.25;0.25;0.25;0.25;
    0.01;4.50;0.80;
    0.5;0.5;0.3;0.25;0.15;0.2;0.15;0.4;0.1;0.25;0.25;0.05;0.05;0.1;0.25;0.05;0.15;0.05;5e7;5e7;
    0.2;0.06;0.02;0.05;0.04;0.1;0.6;0.6;0.5;0.05;0.05;0.3;0.4;0.2;
    0.3;0.3;0.3;0.3;0.6;0.1;0.1;0.5;0.3;0.2;0.1;0.1;0.3;
    2.5e-2;2.5e-2;2.5e-2;2.34e-3;1.5e-1;2.5e-3;1.25e-1;
    0.1;0.1;0.1;0.5;0.1;0.5;0.09;0.15;0.11;0.17;0.22;0.1;0.35;0.58;0.1;0.11;0.1;0.1;0.04;0.15;0.17;0.02;0.09;0.12;0.55;0.02;0.09;0.15;0.1;0.1;0.1;0.1;0.35;0.14;0.15;0.56;0.13;0.25;0.15;0.15;0.05;0.55;0.1;0.1;0.1;0.1;0.1;0.05;0.1;0.1;0.1;
    1e9;7e10;3e10;2e10;5.5e10;2e10;5e10;1.2e11;5e3;6.5e4;3e3;6e3;8e3;1.5e2;1e4;3e4;2.06e4;1e3;1e3;6e7;3.25e4;1.03e4;5e3;1.03e4;5e3;3.25e4;5e3;2.5e3;4.37e4;1.03e4;4.37e4;5.5e4;7.5e4;4e3;5e4;1.5e3;6e4;2.5e4;2e5;8e3;2e7;5e5;1.7e5;2.5e5;8e5;5e3;5e4;1.75e5;1.8e6;3e4;
    0.1;0.1;0.05;0.05;0.197;0.2;0.2;0.2;0.2;0.18;0.3;0.3;0.3;0.3;0.1;0.1;1.8;0.6;0.6;0.1;0.1;0.8;0.1;0.1;0.1;0.1;0.1;0.3;0.1;
    3e8;2e8;3e8;5e8;2e8;3e8;1e9;1.5e10;4e8;1e8;
    5e-4;5e-4;1e-3;1e-5;3e-5;6e-5;1e-4;2e-4;1.4e-5;8e-7;8e-7;2e-7;2e-7;1.3e-7;5e-5;5.5e-6;8e-7;4e-5;5e-6;5e-6;1e-6;1e-4;1e-4;5e-6;5e-5;5e-2;1.1e-6;8e-3;1e-2;1e-6;5e-4;2e-4;5e-3;6e-7;6e-7;
    7e-2;7.5e-2;9e-2;7.5e-5;6e-5;2.5e-4;6e-4;3e-10;1e-3;8e-2;1e-10;8e-2;2e-3;1e-4;2.5e-4;5e-3;1.5e-3;9e-6;9e-5;8.2e-7;5e-5;8e-5;5e-7;2e-5;5e-4;2.5e-3;3e-5;1.5e-6;6e-6;1.5e-5;2.5e-6;4e-7;2.5e-7;1e-3;5e-4;2e-8;8e-4;5e-4;3e-4;1.2e-4;5e-3;8e-2;8e-2;1.25e-2;
    0.01;2.38;1.00;4.16;8.32;1.38;5.00;7.68;499.07;55.01;4.8;8.32;69.31;69.31;693.15;27.73;40.77;256.72;1980.42;23.10;20.00;1.73;11.09;20.00;2.47;34.66;20.00;20.00;20.00;20.00;288.81;
    0.1;0.3;0.6;2;5e8;0.8;2.49e-7;5.22e-7;0.1;5e-4;0.5;150;1e5;1e5;0.8;0.8;0.8;0.8;0.8;0.8;0.8;0.8;
    0.0665;0.0365;0.05;0.02;1;2;1.5;1;5e9;3e9;5e-10;5e-10;5e-9;5e-9;1e-12;1e-12];

% ODE45 parameter
t_time = 56;
t_start = 0;
t_end = 365;
t_vec = t_start:1:t_end;
x0=initialzation();

% Basic QCIC
x = Y;

par.V_D_CA = x(1);            par.V_D_BA = x(2);             par.V_D_AB = x(3);            par.V_D_CB = x(4);         par.V_D0_CB = x(5);           par.V_D_BC = x(6);           par.V_D0_BC = x(7);          par.V_TN4_BA = x(8);        par.V_TN8_BA = x(9);         par.V_TN4_AB = x(10);
par.V_TN8_AB = x(11);         par.V_T1_BA = x(12);           par.V_T2_BA = x(13);          par.V_T17_BA = x(14);      par.V_Treg_BA = x(15);        par.V_Tfh_BA = x(16);        par.V_T8_BA = x(17);         par.V_T1_AB = x(18);        par.V_T2_AB = x(19);         par.V_T17_AB = x(20);
par.V_Treg_AB = x(21);        par.V_Tfh_AB = x(22);          par.V_T8_AB = x(23);          par.V_T1_CB = x(24);       par.V_T2_CB = x(25);          par.V_T17_CB = x(26);        par.V_Treg_CB = x(27);       par.V_Tfh_CB = x(28);       par.V_T8_CB = x(29);         par.V_T1_BC = x(30);
par.V_T2_BC = x(31);          par.V_T17_BC = x(32);          par.V_Treg_BC = x(33);        par.V_Tfh_BC = x(34);      par.V_T8_BC = x(35);          par.V_NK_BA = x(36);         par.V_NK_AB = x(37);         par.V_NK_CB = x(38);        par.V_NK_BC = x(39);         par.V_MMDSC_CB = x(40);
par.V_M_CB = x(41);           par.V_M1_CB = x(42);           par.V_M2_CB = x(43);          par.V_MMDSC_BC = x(44);    par.V_M_BC = x(45);           par.V_M1_BC = x(46);         par.V_M2_BC = x(47);         par.V_GMDSC_CB = x(48);     par.V_N_CB = x(49);          par.V_N1_CB = x(50);
par.V_N2_CB = x(51);          par.V_Eos_CB = x(52);          par.V_Bas_CB = x(53);         par.V_GMDSC_BC = x(54);    par.V_N_BC = x(55);           par.V_N1_BC = x(56);         par.V_N2_BC = x(57);         par.V_Eos_BC = x(58);       par.V_Bas_BC = x(59);

par.V_A = x(60);              par.V_B = x(61);               par.V_C = x(62);

par.beta_TN4 = x(63);         par.beta_TN8 = x(64);          par.beta_T1 = x(65);          par.beta_T2 = x(66);       par.beta_T17 = x(67);         par.beta_Treg = x(68);       par.beta_Tfh = x(69);        par.beta_T8 = x(70);
par.beta_NK = x(71);          par.lambda_T1I2 = x(72);       par.lambda_betaT2I4 = x(73);  par.lambda_T17I21 = x(74); par.lambda_TregI21 = x(75);   par.lambda_TfhI21 = x(76);   par.lambda_T8I2 = x(77);     par.lambda_T8I21 = x(78);   par.lambda_NKI12 = x(79);    par.lambda_NKI21 = x(80);
par.K_TN4 = x(81);            par.K_TN8 = x(82);

par.kappa_T1 = x(83);         par.kappa_T2 = x(84);          par.kappa_T17 = x(85);        par.kappa_Treg = x(86);    par.kappa_Tfh = x(87);        par.kappa_T8 = x(88);        par.lambda_T1I12 = x(89);    par.lambda_T1Igamma = x(90);
par.lambda_kappaT2I4 = x(91); par.lambda_T17I6Tbeta = x(92); par.lambda_TregTbeta = x(93); par.lambda_TfhI6 = x(94);  par.lambda_TfhI21 = x(95);    par.lambda_T8I12 = x(96);

par.psi_M1 = x(97);           par.psi_M2 = x(98);            par.psi_N1 = x(99);           par.psi_N2 = x(100);
par.lambda_MIgamma = x(101);  par.lambda_MTbeta = x(102);    par.lambda_MI10 = x(103);     par.lambda_MI4 = x(104);   par.lambda_NIgamma = x(105);  par.lambda_NTalpha = x(106); par.lambda_NI10 = x(107);    par.lambda_NTbeta = x(108); par.lambda_NGCSF = x(109);

par.rho_T1T17 = x(110);       par.rho_T2T17 = x(111);        par.rho_T17Treg = x(112);     par.rho_M1M2 = x(113);     par.rho_M2M1 = x(114);        par.rho_N1N2 = x(115);       par.rho_N2N1 = x(116);

par.X_DL19_CA = x(117);       par.X_DL21_CA = x(118);        par.X_TN4L19_BA = x(119);     par.X_TN4L21_BA = x(120);  par.X_TN8L19_BA = x(121);     par.X_TN8L21_BA = x(122);    par.X_T1C9_BC = x(123);      par.X_T1C10_BC = x(124);    par.X_T1L3_BC = x(125);     par.X_T1L4_BC = x(126);
par.X_T1L5_BC = x(127);       par.X_T2L1_BC = x(128);        par.X_T2L17_BC = x(129);      par.X_T2L22_BC = x(130);   par.X_T17L17_BC = x(131);     par.X_T17L20_BC = x(132);    par.X_T17L22_BC = x(133);    par.X_T17C12_BC = x(134);   par.X_TregL1_BC = x(135);   par.X_TregL17_BC  = x(136);
par.X_TregL22_BC = x(137);    par.X_TfhC13_BC = x(138);      par.X_T8C9_BC = x(139);       par.X_T8C10_BC = x(140);   par.X_T8C12_BC = x(141);


par.X_D0L20_BC = x(142);      par.X_NKC9_BC = x(143);        par.X_NKC10_BC = x(144);      par.X_MMDSCL2_BC = x(145); par.X_MMDSCC12_BC = x(146);   par.X_GMDSCL5_BC = x(147);   par.X_GMDSCC8_BC = x(148);   par.X_ML2_BC = x(149);      par.X_ML5_BC = x(150);      par.X_M1L2_BC = x(151);
par.X_M1L5_BC = x(152);       par.X_M2L2_BC = x(153);        par.X_M2L5_BC = x(154);       par.X_NC1_BC = x(155);     par.X_NC2_BC = x(156);        par.X_NC5_BC = x(157);       par.X_NC8_BC = x(158);       par.X_N1L5_BC = x(159);     par.X_N1L19_BC = x(160);    par.X_N1L21_BC = x(161);
par.X_N1C9_BC = x(162);       par.X_N1C10_BC = x(163);       par.X_N2C12_BC = x(164);      par.X_EosL11_BC = x(165);  par.X_BasL2_BC = x(166);      par.X_BasL11_BC = x(167);


par.K_D = x(168);             par.K_T1 = x(169);             par.K_T2 = x(170);            par.K_T17 = x(171);        par.K_Treg = x(172);          par.K_Tfh = x(173);          par.K_NK = x(174);           par.K_T8 = x(175);          par.K_I2 = x(176);          par.K_I4 = x(177);
par.K_I6 = x(178);            par.K_I10 = x(179);            par.K_I12 = x(180);           par.K_I21 = x(181);        par.K_Igamma = x(182);        par.K_Talpha = x(183);       par.K_Tbeta = x(184);        par.K_MCSF = x(185);        par.K_GCSF = x(186);        par.K_I6Tbeta = x(187);
par.K_T1I4 = x(188);          par.K_T1Tbeta = x(189);        par.K_T2Igamma = x(190);      par.K_T2Tbeta = x(191);    par.K_T17Igamma = x(192);     par.K_T17I4 = x(193);        par.K_TregIgamma = x(194);   par.K_TfhI2 = x(195);       par.K_T8I10 = x(196);       par.K_T8Tbeta = x(197);
par.K_NKI10 = x(198);         par.K_L1 = x(199);             par.K_L2 = x(200);            par.K_L3 = x(201);         par.K_L4 = x(202);            par.K_L5 = x(203);           par.K_L11 = x(204);          par.K_L17 = x(205);         par.K_L19 = x(206);         par.K_L20 = x(207);
par.K_L21 = x(208);           par.K_L22 = x(209);            par.K_C1 = x(210);            par.K_C2 = x(211);         par.K_C5 = x(212);            par.K_C8 = x(213);           par.K_C9 = x(214);           par.K_C10 = x(215);         par.K_C12 = x(216);         par.K_C13 = x(217);

par.d_D = x(218);             par.d_D0 = x(219);             par.d_TN4 = x(220);           par.d_TN8 = x(221);        par.d_T1 = x(222);            par.d_T2 = x(223);           par.d_T17 = x(224);          par.d_Treg = x(225);        par.d_Tfh = x(226);         par.d_T8 = x(227);
par.d_NK = x(228);            par.d_MMDSC = x(229);          par.d_GMDSC = x(230);         par.d_M = x(231);          par.d_M1 = x(232);            par.d_M2 = x(233);           par.d_N = x(234);            par.d_N1 = x(235);          par.d_N2 = x(236);          par.d_Eos = x(237);
par.d_Bas = x(238);           par.lambda_TregI2 = x(239);    par.lambda_T1 = x(240);       par.lambda_T2 = x(241);    par.lambda_T17 = x(242);      par.lambda_Treg = x(243);    par.lambda_Tfh = x(244);     par.lambda_T8 = x(245);     par.lambda_NK = x(246);

par.theta_TN4_DB = x(247);    par.theta_TN8_DB = x(248);     par.theta_D0_DB = x(249);     par.theta_NK_DB = x(250);  par.theta_MMDSC_DB = x(251);  par.theta_GMDSC_DB = x(252); par.theta_M_DB = x(253);     par.theta_N_DB = x(254);    par.theta_Eos_DB = x(255);  par.theta_Bas_DB = x(256);

par.delta_I2T1 = x(257);      par.delta_I2T8 = x(258);       par.delta_I4T2 = x(259);      par.delta_I4Tfh = x(260);  par.delta_I4Eos = x(261);     par.delta_I4Bas = x(262);      par.delta_I6T2 = x(263);      par.delta_I10T2 = x(264);  par.delta_I10Treg = x(265);   par.delta_I10M2 = x(266);
par.delta_I10N2 = x(267);     par.delta_I10MMDSC = x(268);   par.delta_I10GMDSC = x(269);  par.delta_I10X = x(270);   par.delta_I12D = x(271);      par.delta_I12M1 = x(272);      par.delta_I12Eos = x(273);    par.delta_I21T2 = x(274);  par.delta_I21T17 = x(275);    par.delta_I21Tfh = x(276);
par.delta_I21NK = x(277);     par.delta_IgammaT1 = x(278);   par.delta_IgammaT8 = x(279);  par.delta_IgammaNK = x(280); par.delta_IgammaN1 = x(281);par.delta_TbetaTreg = x(282);  par.delta_TbetaX = x(283);    par.delta_TbetaM2 = x(284);par.delta_TbetaN2 = x(285);   par.delta_TalphaM1 = x(286);
par.delta_TalphaT1 = x(287);  par.delta_TalphaT8 = x(288);   par.delta_TalphaN1 = x(289);  par.delta_MCSFX = x(290); par.delta_GCSFX = x(291);


par.delta_C1X = x(292);       par.delta_C2X = x(293);        par.delta_C5X = x(294);       par.delta_C8Treg = x(295); par.delta_C8X = x(296);      par.delta_C9D = x(297);      par.delta_C9X = x(298);     par.delta_C9M1 = x(299);     par.delta_C10D = x(300);   par.delta_C10X = x(301);
par.delta_C10M1 = x(302);     par.delta_C12X = x(303);       par.delta_C13D = x(304);      par.delta_C13Tfh = x(305); par.delta_C13M2 = x(306);    par.delta_L1Treg = x(307);   par.delta_L1M2 = x(308);    par.delta_L2M1 = x(309);     par.delta_L2N1 = x(310);   par.delta_L2X = x(311);
par.delta_L3M1 = x(312);      par.delta_L3N1 = x(313);       par.delta_L3MMDSC = x(314);   par.delta_L3X = x(315);    par.delta_L4M1 = x(316);     par.delta_L4N2 = x(317);     par.delta_L4MMDSC = x(318); par.delta_L5M1 = x(319);     par.delta_L5N2 = x(320);   par.delta_L5X = x(321);
par.delta_L5T8 = x(322);      par.delta_L5MMDSC = x(323);    par.delta_L5NK = x(324);      par.delta_L11X = x(325);   par.delta_L11Eos = x(326);   par.delta_L17D = x(327);     par.delta_L17M2 = x(328);   par.delta_L17N2 = x(329);    par.delta_L19D = x(330);   par.delta_L20X = x(331);
par.delta_L21D = x(332);      par.delta_L22D = x(333);       par.delta_L22M2 = x(334);     par.delta_L22X = x(335);

par.d_TA = x(336);            par.d_I2 = x(337);             par.d_I4 = x(338);            par.d_I6 = x(339);         par.d_I10 = x(340);   par.d_I12 = x(341);           par.d_I21 = x(342);            par.d_Igamma = x(343);        par.d_Tbeta = x(344);      par.d_Talpha = x(345);
par.d_MCSF = x(346);          par.d_GCSF = x(347);           par.d_C1 = x(348);            par.d_C2 = x(349);         par.d_C5 = x(350);    par.d_C8 = x(351);            par.d_C9 = x(352);             par.d_C10 = x(353);           par.d_C12 = x(354);        par.d_C13 = x(355);
par.d_L1 = x(356);            par.d_L2 = x(357);             par.d_L3 = x(358);            par.d_L4 = x(359);         par.d_L5 = x(360);    par.d_L11 = x(361);           par.d_L17 = x(362);            par.d_L19 = x(363);           par.d_L20 = x(364);        par.d_L21 = x(365);
par.d_L22 = x(366);


par.kappa_1 = x(367);         par.kappa_2 = x(368);          par.kappa_3 = x(369);         par.n = x(370);            par.K_TA = x(371);            par.rho_DD0 = x(372);
par.phi_P = x(373);           par.phi_L = x(374);            par.alpha_PL = x(375);        par.varepsilon_NK = x(376);par.lambda_PL = x(377);       par.K_PL = x(378);          par.K_T1Treg = x(379);       par.K_T8Treg = x(380);
par.lambda_T1PL = x(381);     par.lambda_T2PL = x(382);      par.lambda_T17PL = x(383);    par.lambda_TfhPL = x(384); par.lambda_T8PL = x(385);     par.lambda_NKPL = x(386);   par.lambda_T1Treg = x(387);  par.lambda_T8Treg = x(388);

par.beta_X1 = x(389);         par.beta_X2 = x(390);
par.d_X1 = x(391);            par.d_X2 = x(392);             par.a11 = x(393);             par.a12 = x(394);          par.a21 = x(395);             par.a22 = x(396);            par.K1 = x(397);             par.K2 = x(398);            par.eta_X1T1 = x(399);       par.eta_X2T1 = x(400);
par.eta_X1T8 = x(401);        par.eta_X2T8 = x(402);         par.eta_X1NK = x(403);        par.eta_X2NK = x(404);

[~, B] = ode45(@(t,B) QCIC(t,B), t_vec, x0);
file='./VP/VP_Basic.mat';
save(file,'B');

U_cell = B(t_time,32) + B(t_time,33) + B(t_time,34);
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
U_basic = ( par.V_tumor * U_cell * par.V_C ) / par.V_E;

file_S='./VP/U_basic.mat';
save(file_S,'U_basic');

% Restore
n = size(Y,1);
m = 1000;
Y_RN = zeros(n,m);
Q = zeros(m,1);

% Parameter randomization
for i = 1:m
    RN = 0.2 .* rand(n,1) - 0.1;
    Y_RN(:,i) = Y .* (1 + RN) ;
end
file_S='./VP/Parameter.mat';
save(file_S,'Y_RN');

% Parameter iteration and calculation
for j = 1:m
    x = Y_RN(:,j);

    par.V_D_CA = x(1);            par.V_D_BA = x(2);             par.V_D_AB = x(3);            par.V_D_CB = x(4);         par.V_D0_CB = x(5);           par.V_D_BC = x(6);           par.V_D0_BC = x(7);          par.V_TN4_BA = x(8);        par.V_TN8_BA = x(9);         par.V_TN4_AB = x(10);
    par.V_TN8_AB = x(11);         par.V_T1_BA = x(12);           par.V_T2_BA = x(13);          par.V_T17_BA = x(14);      par.V_Treg_BA = x(15);        par.V_Tfh_BA = x(16);        par.V_T8_BA = x(17);         par.V_T1_AB = x(18);        par.V_T2_AB = x(19);         par.V_T17_AB = x(20);
    par.V_Treg_AB = x(21);        par.V_Tfh_AB = x(22);          par.V_T8_AB = x(23);          par.V_T1_CB = x(24);       par.V_T2_CB = x(25);          par.V_T17_CB = x(26);        par.V_Treg_CB = x(27);       par.V_Tfh_CB = x(28);       par.V_T8_CB = x(29);         par.V_T1_BC = x(30);
    par.V_T2_BC = x(31);          par.V_T17_BC = x(32);          par.V_Treg_BC = x(33);        par.V_Tfh_BC = x(34);      par.V_T8_BC = x(35);          par.V_NK_BA = x(36);         par.V_NK_AB = x(37);         par.V_NK_CB = x(38);        par.V_NK_BC = x(39);         par.V_MMDSC_CB = x(40);
    par.V_M_CB = x(41);           par.V_M1_CB = x(42);           par.V_M2_CB = x(43);          par.V_MMDSC_BC = x(44);    par.V_M_BC = x(45);           par.V_M1_BC = x(46);         par.V_M2_BC = x(47);         par.V_GMDSC_CB = x(48);     par.V_N_CB = x(49);          par.V_N1_CB = x(50);
    par.V_N2_CB = x(51);          par.V_Eos_CB = x(52);          par.V_Bas_CB = x(53);         par.V_GMDSC_BC = x(54);    par.V_N_BC = x(55);           par.V_N1_BC = x(56);         par.V_N2_BC = x(57);         par.V_Eos_BC = x(58);       par.V_Bas_BC = x(59);

    par.V_A = x(60);              par.V_B = x(61);               par.V_C = x(62);

    par.beta_TN4 = x(63);         par.beta_TN8 = x(64);          par.beta_T1 = x(65);          par.beta_T2 = x(66);       par.beta_T17 = x(67);         par.beta_Treg = x(68);       par.beta_Tfh = x(69);        par.beta_T8 = x(70);
    par.beta_NK = x(71);          par.lambda_T1I2 = x(72);       par.lambda_betaT2I4 = x(73);  par.lambda_T17I21 = x(74); par.lambda_TregI21 = x(75);   par.lambda_TfhI21 = x(76);   par.lambda_T8I2 = x(77);     par.lambda_T8I21 = x(78);   par.lambda_NKI12 = x(79);    par.lambda_NKI21 = x(80);
    par.K_TN4 = x(81);            par.K_TN8 = x(82);

    par.kappa_T1 = x(83);         par.kappa_T2 = x(84);          par.kappa_T17 = x(85);        par.kappa_Treg = x(86);    par.kappa_Tfh = x(87);        par.kappa_T8 = x(88);        par.lambda_T1I12 = x(89);    par.lambda_T1Igamma = x(90);
    par.lambda_kappaT2I4 = x(91); par.lambda_T17I6Tbeta = x(92); par.lambda_TregTbeta = x(93); par.lambda_TfhI6 = x(94);  par.lambda_TfhI21 = x(95);    par.lambda_T8I12 = x(96);

    par.psi_M1 = x(97);           par.psi_M2 = x(98);            par.psi_N1 = x(99);           par.psi_N2 = x(100);
    par.lambda_MIgamma = x(101);  par.lambda_MTbeta = x(102);    par.lambda_MI10 = x(103);     par.lambda_MI4 = x(104);   par.lambda_NIgamma = x(105);  par.lambda_NTalpha = x(106); par.lambda_NI10 = x(107);    par.lambda_NTbeta = x(108); par.lambda_NGCSF = x(109);

    par.rho_T1T17 = x(110);       par.rho_T2T17 = x(111);        par.rho_T17Treg = x(112);     par.rho_M1M2 = x(113);     par.rho_M2M1 = x(114);        par.rho_N1N2 = x(115);       par.rho_N2N1 = x(116);

    par.X_DL19_CA = x(117);       par.X_DL21_CA = x(118);        par.X_TN4L19_BA = x(119);     par.X_TN4L21_BA = x(120);  par.X_TN8L19_BA = x(121);     par.X_TN8L21_BA = x(122);    par.X_T1C9_BC = x(123);      par.X_T1C10_BC = x(124);    par.X_T1L3_BC = x(125);     par.X_T1L4_BC = x(126);
    par.X_T1L5_BC = x(127);       par.X_T2L1_BC = x(128);        par.X_T2L17_BC = x(129);      par.X_T2L22_BC = x(130);   par.X_T17L17_BC = x(131);     par.X_T17L20_BC = x(132);    par.X_T17L22_BC = x(133);    par.X_T17C12_BC = x(134);   par.X_TregL1_BC = x(135);   par.X_TregL17_BC  = x(136);
    par.X_TregL22_BC = x(137);    par.X_TfhC13_BC = x(138);      par.X_T8C9_BC = x(139);       par.X_T8C10_BC = x(140);   par.X_T8C12_BC = x(141);


    par.X_D0L20_BC = x(142);      par.X_NKC9_BC = x(143);        par.X_NKC10_BC = x(144);      par.X_MMDSCL2_BC = x(145); par.X_MMDSCC12_BC = x(146);   par.X_GMDSCL5_BC = x(147);   par.X_GMDSCC8_BC = x(148);   par.X_ML2_BC = x(149);      par.X_ML5_BC = x(150);      par.X_M1L2_BC = x(151);
    par.X_M1L5_BC = x(152);       par.X_M2L2_BC = x(153);        par.X_M2L5_BC = x(154);       par.X_NC1_BC = x(155);     par.X_NC2_BC = x(156);        par.X_NC5_BC = x(157);       par.X_NC8_BC = x(158);       par.X_N1L5_BC = x(159);     par.X_N1L19_BC = x(160);    par.X_N1L21_BC = x(161);
    par.X_N1C9_BC = x(162);       par.X_N1C10_BC = x(163);       par.X_N2C12_BC = x(164);      par.X_EosL11_BC = x(165);  par.X_BasL2_BC = x(166);      par.X_BasL11_BC = x(167);


    par.K_D = x(168);             par.K_T1 = x(169);             par.K_T2 = x(170);            par.K_T17 = x(171);        par.K_Treg = x(172);          par.K_Tfh = x(173);          par.K_NK = x(174);           par.K_T8 = x(175);          par.K_I2 = x(176);          par.K_I4 = x(177);
    par.K_I6 = x(178);            par.K_I10 = x(179);            par.K_I12 = x(180);           par.K_I21 = x(181);        par.K_Igamma = x(182);        par.K_Talpha = x(183);       par.K_Tbeta = x(184);        par.K_MCSF = x(185);        par.K_GCSF = x(186);        par.K_I6Tbeta = x(187);
    par.K_T1I4 = x(188);          par.K_T1Tbeta = x(189);        par.K_T2Igamma = x(190);      par.K_T2Tbeta = x(191);    par.K_T17Igamma = x(192);     par.K_T17I4 = x(193);        par.K_TregIgamma = x(194);   par.K_TfhI2 = x(195);       par.K_T8I10 = x(196);       par.K_T8Tbeta = x(197);
    par.K_NKI10 = x(198);         par.K_L1 = x(199);             par.K_L2 = x(200);            par.K_L3 = x(201);         par.K_L4 = x(202);            par.K_L5 = x(203);           par.K_L11 = x(204);          par.K_L17 = x(205);         par.K_L19 = x(206);         par.K_L20 = x(207);
    par.K_L21 = x(208);           par.K_L22 = x(209);            par.K_C1 = x(210);            par.K_C2 = x(211);         par.K_C5 = x(212);            par.K_C8 = x(213);           par.K_C9 = x(214);           par.K_C10 = x(215);         par.K_C12 = x(216);         par.K_C13 = x(217);

    par.d_D = x(218);             par.d_D0 = x(219);             par.d_TN4 = x(220);           par.d_TN8 = x(221);        par.d_T1 = x(222);            par.d_T2 = x(223);           par.d_T17 = x(224);          par.d_Treg = x(225);        par.d_Tfh = x(226);         par.d_T8 = x(227);
    par.d_NK = x(228);            par.d_MMDSC = x(229);          par.d_GMDSC = x(230);         par.d_M = x(231);          par.d_M1 = x(232);            par.d_M2 = x(233);           par.d_N = x(234);            par.d_N1 = x(235);          par.d_N2 = x(236);          par.d_Eos = x(237);
    par.d_Bas = x(238);           par.lambda_TregI2 = x(239);    par.lambda_T1 = x(240);       par.lambda_T2 = x(241);    par.lambda_T17 = x(242);      par.lambda_Treg = x(243);    par.lambda_Tfh = x(244);     par.lambda_T8 = x(245);     par.lambda_NK = x(246);

    par.theta_TN4_DB = x(247);    par.theta_TN8_DB = x(248);     par.theta_D0_DB = x(249);     par.theta_NK_DB = x(250);  par.theta_MMDSC_DB = x(251);  par.theta_GMDSC_DB = x(252); par.theta_M_DB = x(253);     par.theta_N_DB = x(254);    par.theta_Eos_DB = x(255);  par.theta_Bas_DB = x(256);

    par.delta_I2T1 = x(257);      par.delta_I2T8 = x(258);       par.delta_I4T2 = x(259);      par.delta_I4Tfh = x(260);  par.delta_I4Eos = x(261);     par.delta_I4Bas = x(262);      par.delta_I6T2 = x(263);      par.delta_I10T2 = x(264);  par.delta_I10Treg = x(265);   par.delta_I10M2 = x(266);
    par.delta_I10N2 = x(267);     par.delta_I10MMDSC = x(268);   par.delta_I10GMDSC = x(269);  par.delta_I10X = x(270);   par.delta_I12D = x(271);      par.delta_I12M1 = x(272);      par.delta_I12Eos = x(273);    par.delta_I21T2 = x(274);  par.delta_I21T17 = x(275);    par.delta_I21Tfh = x(276);
    par.delta_I21NK = x(277);     par.delta_IgammaT1 = x(278);   par.delta_IgammaT8 = x(279);  par.delta_IgammaNK = x(280); par.delta_IgammaN1 = x(281);par.delta_TbetaTreg = x(282);  par.delta_TbetaX = x(283);    par.delta_TbetaM2 = x(284);par.delta_TbetaN2 = x(285);   par.delta_TalphaM1 = x(286);
    par.delta_TalphaT1 = x(287);  par.delta_TalphaT8 = x(288);   par.delta_TalphaN1 = x(289);  par.delta_MCSFX = x(290); par.delta_GCSFX = x(291);


    par.delta_C1X = x(292);       par.delta_C2X = x(293);        par.delta_C5X = x(294);       par.delta_C8Treg = x(295); par.delta_C8X = x(296);      par.delta_C9D = x(297);      par.delta_C9X = x(298);     par.delta_C9M1 = x(299);     par.delta_C10D = x(300);   par.delta_C10X = x(301);
    par.delta_C10M1 = x(302);     par.delta_C12X = x(303);       par.delta_C13D = x(304);      par.delta_C13Tfh = x(305); par.delta_C13M2 = x(306);    par.delta_L1Treg = x(307);   par.delta_L1M2 = x(308);    par.delta_L2M1 = x(309);     par.delta_L2N1 = x(310);   par.delta_L2X = x(311);
    par.delta_L3M1 = x(312);      par.delta_L3N1 = x(313);       par.delta_L3MMDSC = x(314);   par.delta_L3X = x(315);    par.delta_L4M1 = x(316);     par.delta_L4N2 = x(317);     par.delta_L4MMDSC = x(318); par.delta_L5M1 = x(319);     par.delta_L5N2 = x(320);   par.delta_L5X = x(321);
    par.delta_L5T8 = x(322);      par.delta_L5MMDSC = x(323);    par.delta_L5NK = x(324);      par.delta_L11X = x(325);   par.delta_L11Eos = x(326);   par.delta_L17D = x(327);     par.delta_L17M2 = x(328);   par.delta_L17N2 = x(329);    par.delta_L19D = x(330);   par.delta_L20X = x(331);
    par.delta_L21D = x(332);      par.delta_L22D = x(333);       par.delta_L22M2 = x(334);     par.delta_L22X = x(335);

    par.d_TA = x(336);            par.d_I2 = x(337);             par.d_I4 = x(338);            par.d_I6 = x(339);         par.d_I10 = x(340);   par.d_I12 = x(341);           par.d_I21 = x(342);            par.d_Igamma = x(343);        par.d_Tbeta = x(344);      par.d_Talpha = x(345);
    par.d_MCSF = x(346);          par.d_GCSF = x(347);           par.d_C1 = x(348);            par.d_C2 = x(349);         par.d_C5 = x(350);    par.d_C8 = x(351);            par.d_C9 = x(352);             par.d_C10 = x(353);           par.d_C12 = x(354);        par.d_C13 = x(355);
    par.d_L1 = x(356);            par.d_L2 = x(357);             par.d_L3 = x(358);            par.d_L4 = x(359);         par.d_L5 = x(360);    par.d_L11 = x(361);           par.d_L17 = x(362);            par.d_L19 = x(363);           par.d_L20 = x(364);        par.d_L21 = x(365);
    par.d_L22 = x(366);


    par.kappa_1 = x(367);         par.kappa_2 = x(368);          par.kappa_3 = x(369);         par.n = x(370);            par.K_TA = x(371);            par.rho_DD0 = x(372);
    par.phi_P = x(373);           par.phi_L = x(374);            par.alpha_PL = x(375);        par.varepsilon_NK = x(376);par.lambda_PL = x(377);       par.K_PL = x(378);          par.K_T1Treg = x(379);       par.K_T8Treg = x(380);
    par.lambda_T1PL = x(381);     par.lambda_T2PL = x(382);      par.lambda_T17PL = x(383);    par.lambda_TfhPL = x(384); par.lambda_T8PL = x(385);     par.lambda_NKPL = x(386);   par.lambda_T1Treg = x(387);  par.lambda_T8Treg = x(388);

    par.beta_X1 = x(389);         par.beta_X2 = x(390);
    par.d_X1 = x(391);            par.d_X2 = x(392);             par.a11 = x(393);             par.a12 = x(394);          par.a21 = x(395);             par.a22 = x(396);            par.K1 = x(397);             par.K2 = x(398);            par.eta_X1T1 = x(399);       par.eta_X2T1 = x(400);
    par.eta_X1T8 = x(401);        par.eta_X2T8 = x(402);         par.eta_X1NK = x(403);        par.eta_X2NK = x(404);

    [~, W] = ode45(@(t,W) QCIC(t,W), t_vec, x0);
    file=['./VP/','VP',num2str(j),'.mat'];
    save(file,'W');

    Q_cell = W(t_time,32) + W(t_time,33) + W(t_time,34);
    par.V_tumor = 2.572e-9;
    par.V_C = 0.8;
    par.V_E = 0.37;
    Q(j,1) = ( par.V_tumor * Q_cell * par.V_C ) / par.V_E;

end

V = ( Q - U_basic ) ./ U_basic;
file_S='./VP/Outcome.mat';
save(file_S,'V');

end
