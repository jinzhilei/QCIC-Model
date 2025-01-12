function S=LHS_Matrix()

sample = 100; 
para = 21;
S = zeros(sample,para);

% naive T cell pool
S(:,1)=Beta_Matrix(1e7,1e8,8,4,sample); % K_TN4
S(:,2)=Beta_Matrix(1e7,1e8,8,4,sample); % K_TN8

% immune activation
S(:,3)=Beta_Matrix(0,1,6,4,sample); % rho_DD0

% immune checkpoints
S(:,4)=Beta_Matrix(2.49e-6,2.49e-8,4,6,sample); % phi_P
S(:,5)=Beta_Matrix(2.49e-6,2.49e-8,4,6,sample); % phi_L

% tumor proliferation rate
S(:,6)=Beta_Matrix(0.04,0.06,6,4,sample); % beta_X1
S(:,7)=Beta_Matrix(0.03,0.06,3,7,sample); % beta_X2
S(:,8)=Beta_Matrix(0.01,0.07,0.6,0.3,sample); % beta_X3

% environmental carrying capacity
S(:,9)=Beta_Matrix(1.5e9,4e9,5,3,sample); % K1
S(:,10)=Beta_Matrix(1e9,3e9,7,4,sample);  % K2
S(:,11)=Beta_Matrix(1e9,1.75e9,4,7,sample);  % K3

% Tumor apoptosis
S(:,12)=Beta_Matrix(0.02,0.04,3,7,sample); % d_X1
S(:,13)=Beta_Matrix(0.015,0.03,4,6,sample);  % d_X2
S(:,14)=Beta_Matrix(0.005,0.01,7,9,sample); % d_X3

% chemotherapy

S(:,15)=Beta_Matrix(0.2,0.4,1,1,sample); % rho_X3X1
S(:,16)=Beta_Matrix(0.2,0.4,1,1,sample); % rho_X3X2
S(:,17)=Beta_Matrix(0.01,0.1,6,5,sample); % sigma_X1
S(:,18)=Beta_Matrix(0.01,0.1,6,5,sample); % sigma_X2

% targeted therapy
S(:,19)=Beta_Matrix(5e-4,5e-2,5,5,sample); % varepsilon_TX1
S(:,20)=Beta_Matrix(3e-4,3e-2,5,5,sample); % varepsilon_TX2
S(:,21)=Beta_Matrix(1e-4,1e-2,5,5,sample); % varepsilon_TX3

end



