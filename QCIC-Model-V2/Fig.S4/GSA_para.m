function GSA_para()

sample=100;
global par
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
par.T = 4e8;

% para
fil_Matrix = './VP/VP_LHS_Matrix.mat';
Y = cell2mat(struct2cell(load(fil_Matrix)));
K_TN4 = Y(:,1);            K_TN8 = Y(:,2);           rho_DD0 = Y(:,3);        phi_P = Y(:,4);        phi_L = Y(:,5); 
beta_X1 = Y(:,6);          beta_X2 = Y(:,7);         beta_X3 = Y(:,8);        K1 = Y(:,9);           K2 = Y(:,10);
K3 = Y(:,11);              d_X1 = Y(:,12);           d_X2 = Y(:,13);          d_X3 = Y(:,14);        rho_X3X1 = Y(:,15);
rho_X3X2 = Y(:,16);        sigma_X1 = Y(:,17);       sigma_X2 = Y(:,18);      varepsilon_TX1 = Y(:,19);
varepsilon_TX2 = Y(:,20);  varepsilon_TX3 = Y(:,21);

K_TN4_sample=zeros(sample,2); K_TN8_sample=zeros(sample,2); rho_DD0_sample=zeros(sample,2); phi_P_sample=zeros(sample,2); 
phi_L_sample=zeros(sample,2); beta_X1_sample=zeros(sample,2); beta_X2_sample=zeros(sample,2); beta_X3_sample=zeros(sample,2); 
K1_sample=zeros(sample,2); K2_sample=zeros(sample,2); K3_sample=zeros(sample,2); d_X1_sample=zeros(sample,2);
d_X2_sample=zeros(sample,2); d_X3_sample=zeros(sample,2); rho_X3X1_sample=zeros(sample,2); rho_X3X2_sample=zeros(sample,2);
sigma_X1_sample=zeros(sample,2); sigma_X2_sample=zeros(sample,2);  
varepsilon_TX1_sample=zeros(sample,2); varepsilon_TX2_sample=zeros(sample,2); varepsilon_TX3_sample=zeros(sample,2);


for i=1:sample

    file=['./VP/','VP',num2str(i),'.mat'];
    X=cell2mat(struct2cell(load(file)));
    A=X(57,:);
    [X1_C,X2_C,X3_C]=cell_data(A);
    X_C = X1_C+X2_C+X3_C;
    V_before = ( par.V_tumor * par.T * par.V_C ) / par.V_E;
    V_after  = ( par.V_tumor * X_C * par.V_C ) / par.V_E;
    V_T = V_after / V_before - 1;

    K_TN4_sample(i,1) = K_TN4(i);
    K_TN8_sample(i,1) = K_TN8(i);
    rho_DD0_sample(i,1) = rho_DD0(i);
    phi_P_sample(i,1) = phi_P(i);
    phi_L_sample(i,1) = phi_L(i);
    beta_X1_sample(i,1) = beta_X1(i);
    beta_X2_sample(i,1) = beta_X2(i);
    beta_X3_sample(i,1) = beta_X3(i);
    K1_sample(i,1) = K1(i);
    K2_sample(i,1) = K2(i);
    K3_sample(i,1) = K3(i);
    d_X1_sample(i,1) = d_X1(i);
    d_X2_sample(i,1) = d_X2(i);
    d_X3_sample(i,1) = d_X3(i);
    rho_X3X1_sample(i,1) = rho_X3X1(i);
    rho_X3X2_sample(i,1) = rho_X3X2(i);
    sigma_X1_sample(i,1) = sigma_X1(i);
    sigma_X2_sample(i,1) = sigma_X2(i);
    varepsilon_TX1_sample(i,1) = varepsilon_TX1(i);
    varepsilon_TX2_sample(i,1) = varepsilon_TX2(i);
    varepsilon_TX3_sample(i,1) = varepsilon_TX3(i);

    if V_T>=0.2
        K_TN4_sample(i,2) = 1;
        K_TN8_sample(i,2) = 1;
        rho_DD0_sample(i,2) = 1;
        phi_P_sample(i,2) = 1;
        phi_L_sample(i,2) = 1;   
        beta_X1_sample(i,2) = 1;
        beta_X2_sample(i,2) = 1;
        beta_X3_sample(i,2) = 1;
        K1_sample(i,2) = 1;
        K2_sample(i,2) = 1;
        K3_sample(i,2) = 1;
        d_X1_sample(i,2) = 1;
        d_X2_sample(i,2) = 1;
        d_X3_sample(i,2) = 1;
        rho_X3X1_sample(i,2) = 1;
        rho_X3X2_sample(i,2) = 1;
        sigma_X1_sample(i,2) = 1;
        sigma_X2_sample(i,2) = 1;
        varepsilon_TX1_sample(i,2) = 1;
        varepsilon_TX2_sample(i,2) = 1;
        varepsilon_TX3_sample(i,2) = 1;
    else
        K_TN4_sample(i,2) = 0;
        K_TN8_sample(i,2) = 0;
        rho_DD0_sample(i,2) = 0;
        phi_P_sample(i,2) = 0;
        phi_L_sample(i,2) = 0; 
        beta_X1_sample(i,2) = 0;
        beta_X2_sample(i,2) = 0;
        beta_X3_sample(i,2) = 0;
        K1_sample(i,2) = 0;
        K2_sample(i,2) = 0;
        K3_sample(i,2) = 0;
        d_X1_sample(i,2) = 0;
        d_X2_sample(i,2) = 0;
        d_X3_sample(i,2) = 0;
        rho_X3X1_sample(i,2) = 0;
        rho_X3X2_sample(i,2) = 0;
        sigma_X1_sample(i,2) = 0;
        sigma_X2_sample(i,2) = 0;
        varepsilon_TX1_sample(i,2) = 0;
        varepsilon_TX2_sample(i,2) = 0;
        varepsilon_TX3_sample(i,2) = 0;
    end

end

K_TN4_sample = sortrows(K_TN4_sample);
K_TN8_sample = sortrows(K_TN8_sample);
rho_DD0_sample = sortrows(rho_DD0_sample);
phi_P_sample = sortrows(phi_P_sample);
phi_L_sample = sortrows(phi_L_sample);
beta_X1_sample = sortrows(beta_X1_sample);
beta_X2_sample = sortrows(beta_X2_sample);
beta_X3_sample = sortrows(beta_X3_sample);
K1_sample = sortrows(K1_sample);
K2_sample = sortrows(K2_sample);
K3_sample = sortrows(K3_sample);
d_X1_sample = sortrows(d_X1_sample);
d_X2_sample = sortrows(d_X2_sample);
d_X3_sample = sortrows(d_X3_sample);
rho_X3X1_sample = sortrows(rho_X3X1_sample);
rho_X3X2_sample = sortrows(rho_X3X2_sample);
sigma_X1_sample = sortrows(sigma_X1_sample);
sigma_X2_sample = sortrows(sigma_X2_sample);
varepsilon_TX1_sample = sortrows(varepsilon_TX1_sample);
varepsilon_TX2_sample = sortrows(varepsilon_TX2_sample);
varepsilon_TX3_sample = sortrows(varepsilon_TX3_sample);

% save star
K_TN4_GSA = zeros(5,2);
K_TN8_GSA = zeros(5,2);
rho_DD0_GSA = zeros(5,2);
phi_P_GSA = zeros(5,2);
phi_L_GSA = zeros(5,2);
beta_X1_GSA = zeros(5,2);
beta_X2_GSA = zeros(5,2);
beta_X3_GSA = zeros(5,2);
K1_GSA = zeros(5,2);
K2_GSA = zeros(5,2);
K3_GSA = zeros(5,2);
d_X1_GSA = zeros(5,2);
d_X2_GSA = zeros(5,2);
d_X3_GSA = zeros(5,2);
rho_X3X1_GSA = zeros(5,2);
rho_X3X2_GSA = zeros(5,2);
sigma_X1_GSA = zeros(5,2);
sigma_X2_GSA = zeros(5,2);
varepsilon_TX1_GSA = zeros(5,2);
varepsilon_TX2_GSA = zeros(5,2);
varepsilon_TX3_GSA = zeros(5,2);


% save matrix

X_K_TN4 = K_TN4_sample(linspace(20,100,5));
Y_K_TN4 = [sum(K_TN4_sample(1:20,2))/20, sum(K_TN4_sample(21:40,2))/20, sum(K_TN4_sample(41:60,2))/20,sum(K_TN4_sample(61:80,2))/20, sum(K_TN4_sample(81:100,2))/20];
K_TN4_GSA(:,1) = X_K_TN4; K_TN4_GSA(:,2) = Y_K_TN4;
save('Data_GSA_para/K_TN4_GSA.mat','K_TN4_GSA');

X_K_TN8 = K_TN8_sample(linspace(20,100,5));
Y_K_TN8 = [sum(K_TN8_sample(1:20,2))/20, sum(K_TN8_sample(21:40,2))/20, sum(K_TN8_sample(41:60,2))/20,sum(K_TN8_sample(61:80,2))/20, sum(K_TN8_sample(81:100,2))/20];
K_TN8_GSA(:,1) = X_K_TN8; K_TN8_GSA(:,2) = Y_K_TN8;
save('Data_GSA_para/K_TN8_GSA.mat','K_TN8_GSA');

X_rho_DD0 = rho_DD0_sample(linspace(20,100,5));
Y_rho_DD0 = [sum(rho_DD0_sample(1:20,2))/20, sum(rho_DD0_sample(21:40,2))/20, sum(rho_DD0_sample(41:60,2))/20,sum(rho_DD0_sample(61:80,2))/20, sum(rho_DD0_sample(81:100,2))/20];
rho_DD0_GSA(:,1) = X_rho_DD0; rho_DD0_GSA(:,2) = Y_rho_DD0;
save('Data_GSA_para/rho_DD0_GSA.mat','rho_DD0_GSA');

X_phi_P = phi_P_sample(linspace(20,100,5));
Y_phi_P = [sum(phi_P_sample(1:20,2))/20, sum(phi_P_sample(21:40,2))/20, sum(phi_P_sample(41:60,2))/20,sum(phi_P_sample(61:80,2))/20, sum(phi_P_sample(81:100,2))/20];
phi_P_GSA(:,1) = X_phi_P; phi_P_GSA(:,2) = Y_phi_P;
save('Data_GSA_para/phi_P_GSA.mat','phi_P_GSA');

X_phi_L = phi_L_sample(linspace(20,100,5));
Y_phi_L = [sum(phi_L_sample(1:20,2))/20, sum(phi_L_sample(21:40,2))/20, sum(phi_L_sample(41:60,2))/20,sum(phi_L_sample(61:80,2))/20, sum(phi_L_sample(81:100,2))/20];
phi_L_GSA(:,1) = X_phi_L; phi_L_GSA(:,2) = Y_phi_L;
save('Data_GSA_para/phi_L_GSA.mat','phi_L_GSA');

X_beta_X1 = beta_X1_sample(linspace(20,100,5));
Y_beta_X1 = [sum(beta_X1_sample(1:20,2))/20, sum(beta_X1_sample(21:40,2))/20, sum(beta_X1_sample(41:60,2))/20,sum(beta_X1_sample(61:80,2))/20, sum(beta_X1_sample(81:100,2))/20];
beta_X1_GSA(:,1) = X_beta_X1; beta_X1_GSA(:,2) = Y_beta_X1;
save('Data_GSA_para/beta_X1_GSA.mat','beta_X1_GSA');

X_beta_X2 = beta_X2_sample(linspace(20,100,5));
Y_beta_X2 = [sum(beta_X2_sample(1:20,2))/20, sum(beta_X2_sample(21:40,2))/20, sum(beta_X2_sample(41:60,2))/20,sum(beta_X2_sample(61:80,2))/20, sum(beta_X2_sample(81:100,2))/20];
beta_X2_GSA(:,1) = X_beta_X2; beta_X2_GSA(:,2) = Y_beta_X2;
save('Data_GSA_para/beta_X2_GSA.mat','beta_X2_GSA');

X_beta_X3 = beta_X3_sample(linspace(20,100,5));
Y_beta_X3 = [sum(beta_X3_sample(1:20,2))/20, sum(beta_X3_sample(21:40,2))/20, sum(beta_X3_sample(41:60,2))/20,sum(beta_X3_sample(61:80,2))/20, sum(beta_X3_sample(81:100,2))/20];
beta_X3_GSA(:,1) = X_beta_X3; beta_X3_GSA(:,2) = Y_beta_X3;
save('Data_GSA_para/beta_X3_GSA.mat','beta_X3_GSA');

X_K1 = K1_sample(linspace(20,100,5));
Y_K1 = [sum(K1_sample(1:20,2))/20, sum(K1_sample(21:40,2))/20, sum(K1_sample(41:60,2))/20,sum(K1_sample(61:80,2))/20, sum(K1_sample(81:100,2))/20];
K1_GSA(:,1) = X_K1; K1_GSA(:,2) = Y_K1;
save('Data_GSA_para/K1_GSA.mat','K1_GSA');

X_K2 = K2_sample(linspace(20,100,5));
Y_K2 = [sum(K2_sample(1:20,2))/20, sum(K2_sample(21:40,2))/20, sum(K2_sample(41:60,2))/20, sum(K2_sample(61:80,2))/20, sum(K2_sample(81:100,2))/20];
K2_GSA(:,1) = X_K2; K2_GSA(:,2) = Y_K2;
save('Data_GSA_para/K2_GSA.mat','K2_GSA');

X_K3 = K3_sample(linspace(20,100,5));
Y_K3 = [sum(K3_sample(1:20,2))/20, sum(K3_sample(21:40,2))/20, sum(K3_sample(41:60,2))/20,sum(K3_sample(61:80,2))/20, sum(K3_sample(81:100,2))/20];
K3_GSA(:,1) = X_K3; K3_GSA(:,2) = Y_K3;
save('Data_GSA_para/K3_GSA.mat','K3_GSA');

X_d_X1 = d_X1_sample(linspace(20,100,5));
Y_d_X1 = [sum(d_X1_sample(1:20,2))/20, sum(d_X1_sample(21:40,2))/20, sum(d_X1_sample(41:60,2))/20,sum(d_X1_sample(61:80,2))/20, sum(d_X1_sample(81:100,2))/20];
d_X1_GSA(:,1) = X_d_X1; d_X1_GSA(:,2) = Y_d_X1;
save('Data_GSA_para/d_X1_GSA.mat','d_X1_GSA');

X_d_X2 = d_X2_sample(linspace(20,100,5));
Y_d_X2 = [sum(d_X2_sample(1:20,2))/20, sum(d_X2_sample(21:40,2))/20, sum(d_X2_sample(41:60,2))/20,sum(d_X2_sample(61:80,2))/20, sum(d_X2_sample(81:100,2))/20];
d_X2_GSA(:,1) = X_d_X2; d_X2_GSA(:,2) = Y_d_X2;
save('Data_GSA_para/d_X2_GSA.mat','d_X2_GSA');

X_d_X3 = d_X3_sample(linspace(20,100,5));
Y_d_X3 = [sum(d_X3_sample(1:20,2))/20, sum(d_X3_sample(21:40,2))/20, sum(d_X3_sample(41:60,2))/20,sum(d_X3_sample(61:80,2))/20, sum(d_X3_sample(81:100,2))/20];
d_X3_GSA(:,1) = X_d_X3; d_X3_GSA(:,2) = Y_d_X3;
save('Data_GSA_para/d_X3_GSA.mat','d_X3_GSA');

X_rho_X3X1 = rho_X3X1_sample(linspace(20,100,5));
Y_rho_X3X1 = [sum(rho_X3X1_sample(1:20,2))/20, sum(rho_X3X1_sample(21:40,2))/20, sum(rho_X3X1_sample(41:60,2))/20,sum(rho_X3X1_sample(61:80,2))/20, sum(rho_X3X1_sample(81:100,2))/20];
rho_X3X1_GSA(:,1) = X_rho_X3X1; rho_X3X1_GSA(:,2) = Y_rho_X3X1;
save('Data_GSA_para/rho_X3X1_GSA.mat','rho_X3X1_GSA');

X_rho_X3X2 = rho_X3X2_sample(linspace(20,100,5));
Y_rho_X3X2 = [sum(rho_X3X2_sample(1:20,2))/20, sum(rho_X3X2_sample(21:40,2))/20, sum(rho_X3X2_sample(41:60,2))/20,sum(rho_X3X2_sample(61:80,2))/20, sum(rho_X3X2_sample(81:100,2))/20];
rho_X3X2_GSA(:,1) = X_rho_X3X2; rho_X3X2_GSA(:,2) = Y_rho_X3X2;
save('Data_GSA_para/rho_X3X2_GSA.mat','rho_X3X2_GSA');

X_sigma_X1 = sigma_X1_sample(linspace(20,100,5));
Y_sigma_X1 = [sum(sigma_X1_sample(1:20,2))/20, sum(sigma_X1_sample(21:40,2))/20, sum(sigma_X1_sample(41:60,2))/20,sum(sigma_X1_sample(61:80,2))/20, sum(sigma_X1_sample(81:100,2))/20];
sigma_X1_GSA(:,1) = X_sigma_X1; sigma_X1_GSA(:,2) = Y_sigma_X1;
save('Data_GSA_para/sigma_X1_GSA.mat','sigma_X1_GSA');

X_sigma_X2 = sigma_X2_sample(linspace(20,100,5));
Y_sigma_X2 = [sum(sigma_X2_sample(1:20,2))/20, sum(sigma_X2_sample(21:40,2))/20, sum(sigma_X2_sample(41:60,2))/20,sum(sigma_X2_sample(61:80,2))/20, sum(sigma_X2_sample(81:100,2))/20];
sigma_X2_GSA(:,1) = X_sigma_X2; sigma_X2_GSA(:,2) = Y_sigma_X2;
save('Data_GSA_para/sigma_X2_GSA.mat','sigma_X2_GSA');

X_varepsilon_TX1 = varepsilon_TX1_sample(linspace(20,100,5));
Y_varepsilon_TX1 = [sum(varepsilon_TX1_sample(1:20,2))/20, sum(varepsilon_TX1_sample(21:40,2))/20, sum(varepsilon_TX1_sample(41:60,2))/20,sum(varepsilon_TX1_sample(61:80,2))/20, sum(varepsilon_TX1_sample(81:100,2))/20];
varepsilon_TX1_GSA(:,1) = X_varepsilon_TX1; varepsilon_TX1_GSA(:,2) = Y_varepsilon_TX1;
save('Data_GSA_para/varepsilon_TX1_GSA.mat','varepsilon_TX1_GSA');

X_varepsilon_TX2 = varepsilon_TX2_sample(linspace(20,100,5));
Y_varepsilon_TX2 = [sum(varepsilon_TX2_sample(1:20,2))/20, sum(varepsilon_TX2_sample(21:40,2))/20, sum(varepsilon_TX2_sample(41:60,2))/20,sum(varepsilon_TX2_sample(61:80,2))/20, sum(varepsilon_TX2_sample(81:100,2))/20];
varepsilon_TX2_GSA(:,1) = X_varepsilon_TX2; varepsilon_TX2_GSA(:,2) = Y_varepsilon_TX2;
save('Data_GSA_para/varepsilon_TX2_GSA.mat','varepsilon_TX2_GSA');

X_varepsilon_TX3 = varepsilon_TX3_sample(linspace(20,100,5));
Y_varepsilon_TX3 = [sum(varepsilon_TX3_sample(1:20,2))/20, sum(varepsilon_TX3_sample(21:40,2))/20, sum(varepsilon_TX3_sample(41:60,2))/20,sum(varepsilon_TX3_sample(61:80,2))/20, sum(varepsilon_TX3_sample(81:100,2))/20];
varepsilon_TX3_GSA(:,1) = X_varepsilon_TX3; varepsilon_TX3_GSA(:,2) = Y_varepsilon_TX3;
save('Data_GSA_para/varepsilon_TX3_GSA.mat','varepsilon_TX3_GSA');

end