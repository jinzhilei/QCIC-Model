function main(i,K_TN4,K_TN8,rho_DD0,phi_P,phi_L,beta_X1,beta_X2,beta_X3,K1,K2,K3,d_X1,d_X2,d_X3,rho_X3X1,rho_X3X2,sigma_X1,sigma_X2,varepsilon_TX1,varepsilon_TX2,varepsilon_TX3)

t_start = 0;
t_end = 365;
t_vec = t_start:1:t_end;

x0=initialzation();

[~, x] = ode45(@(t,x) QCIC(t,x,K_TN4,K_TN8,rho_DD0,phi_P,phi_L,beta_X1,beta_X2,beta_X3,K1,K2,K3,d_X1,d_X2,d_X3,rho_X3X1,rho_X3X2,sigma_X1,sigma_X2,varepsilon_TX1,varepsilon_TX2,varepsilon_TX3), t_vec, x0);

file=['./VP/','VP',num2str(i),'.mat'];

save(file,'x');

end