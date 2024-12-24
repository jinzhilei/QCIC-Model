function VirPat()

delete (gcp('nocreate'))

% Results of random sampling of tumor heterogeneity parameters
S=LHS_Matrix();
file_S='./VP/VP_LHS_Matrix.mat';
save(file_S,'S');
[n,~]=size(S);

%% Parallel Computing Toolbox

% Set the number of CPU cores on the machine
number = 100; 
parpool(number); 

parfor i=1:n
    disp(i)
    K_TN4=S(i,1);
    K_TN8=S(i,2);
    rho_DD0=S(i,3);
    phi_P=S(i,4);
    phi_L=S(i,5);
    beta_X1=S(i,6);
    beta_X2=S(i,7);
    beta_X3=S(i,8);
    K1=S(i,9);
    K2=S(i,10);
    K3=S(i,11);
    d_X1=S(i,12);
    d_X2=S(i,13);
    d_X3=S(i,14);
    rho_X3X1=S(i,15);
    rho_X3X2=S(i,16);
    sigma_X1=S(i,17);
    sigma_X2=S(i,18);
    varepsilon_TX1=S(i,19);
    varepsilon_TX2=S(i,20);
    varepsilon_TX3=S(i,21);

    main(i,K_TN4,K_TN8,rho_DD0,phi_P,phi_L,beta_X1,beta_X2,beta_X3,K1,K2,K3,d_X1,d_X2,d_X3,rho_X3X1,rho_X3X2,sigma_X1,sigma_X2,varepsilon_TX1,varepsilon_TX2,varepsilon_TX3)

end

end

