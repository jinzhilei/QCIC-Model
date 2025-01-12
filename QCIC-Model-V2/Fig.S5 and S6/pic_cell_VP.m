function pic_cell_VP()

sample = 100; 
times = 366;

D_A=zeros(times,sample);    TN4_A=zeros(times,sample);  T1_A=zeros(times,sample);  T2_A=zeros(times,sample);  T17_A=zeros(times,sample);
Treg_A=zeros(times,sample); Tfh_A=zeros(times,sample);  TN8_A=zeros(times,sample); T8_A=zeros(times,sample);  NK_A=zeros(times,sample); 

TN4_B=zeros(times,sample);  T1_B=zeros(times,sample);   T2_B=zeros(times,sample);  T17_B=zeros(times,sample); Treg_B=zeros(times,sample);
Tfh_B=zeros(times,sample);  TN8_B=zeros(times,sample);  T8_B=zeros(times,sample);  D0_B=zeros(times,sample);  D_B=zeros(times,sample);
NK_B=zeros(times,sample);   MMDSC_B=zeros(times,sample); GMDSC_B=zeros(times,sample); M_B=zeros(times,sample); M1_B=zeros(times,sample);
M2_B=zeros(times,sample);   N_B=zeros(times,sample);     N1_B=zeros(times,sample); N2_B=zeros(times,sample);   Eos_B=zeros(times,sample);
Bas_B=zeros(times,sample);  

T1_C=zeros(times,sample);   T2_C=zeros(times,sample);   T17_C=zeros(times,sample);  Treg_C=zeros(times,sample); Tfh_C=zeros(times,sample);
T8_C=zeros(times,sample);   D0_C=zeros(times,sample);   D_C=zeros(times,sample);    NK_C=zeros(times,sample);   MMDSC_C=zeros(times,sample);
GMDSC_C=zeros(times,sample); M_C=zeros(times,sample);   M1_C=zeros(times,sample);   M2_C=zeros(times,sample);   N_C=zeros(times,sample);
N1_C=zeros(times,sample);    N2_C=zeros(times,sample);  Eos_C=zeros(times,sample);  Bas_C=zeros(times,sample);  

for i=1:sample
    file=['./VP/','VP',num2str(i),'.mat'];
    A=cell2mat(struct2cell(load(file)));

    D_A(:,i) = A(:,1);       TN4_A(:,i) = A(:,2);    T1_A(:,i) = A(:,3);     T2_A(:,i) = A(:,4);     T17_A(:,i) = A(:,5);
    Treg_A(:,i) = A(:,6);    Tfh_A(:,i) = A(:,7);    TN8_A(:,i) = A(:,8);    T8_A(:,i) = A(:,9);     NK_A(:,i) = A(:,10);

    TN4_B(:,i) = A(:,11);    T1_B(:,i) = A(:,12);    T2_B(:,i) = A(:,13);    T17_B(:,i) = A(:,14);   Treg_B(:,i) = A(:,15);
    Tfh_B(:,i) = A(:,16);    TN8_B(:,i) = A(:,17);   T8_B(:,i) = A(:,18);    D0_B(:,i) = A(:,19);    D_B(:,i) = A(:,20);
    NK_B(:,i) = A(:,21);     MMDSC_B(:,i) = A(:,22); GMDSC_B(:,i) = A(:,23); M_B(:,i) = A(:,24);     M1_B(:,i) = A(:,25);
    M2_B(:,i) = A(:,26);     N_B(:,i) = A(:,27);     N1_B(:,i) = A(:,28);    N2_B(:,i) = A(:,29);    Eos_B(:,i) = A(:,30);
    Bas_B(:,i) = A(:,31);  

    T1_C(:,i) = A(:,35);     T2_C(:,i) = A(:,36);     T17_C(:,i) = A(:,37);   Treg_C(:,i) = A(:,38);  Tfh_C(:,i) = A(:,39);
    T8_C(:,i) = A(:,40);     D0_C(:,i) = A(:,41);     D_C(:,i) = A(:,42);     NK_C(:,i) = A(:,43);    MMDSC_C(:,i) = A(:,44); 
    GMDSC_C(:,i) = A(:,45);  M_C(:,i) = A(:,46);      M1_C(:,i) = A(:,47);    M2_C(:,i) = A(:,48);    N_C(:,i) = A(:,49); 
    N1_C(:,i) = A(:,50);     N2_C(:,i) = A(:,51);     Eos_C(:,i) = A(:,52);   Bas_C(:,i) = A(:,53);   

end

time=1:1:times;
Q=56:56:times;
LW=1;FS=18;Pos=[10 10 29 7];

%% Plot DC0_module

figure(1)

subplot(1,3,1)
for j=1:sample
plot(time(Q),D0_B(Q,j),'Color',[218 112 214]./255,'LineWidth',LW);hold on
end
title('$[D_0]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),D0_C(Q,j),'Color',[218 112 214]./255,'LineWidth',LW);hold on
end
title('$[D_0]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/DC0_module','-dpng','-r600')


%% Plot DC_module

figure(2)

subplot(1,3,1)
for j=1:sample
plot(time(Q),D_A(Q,j),'Color',[186 85 211]./255,'LineWidth',LW);hold on
end
title('$[D]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),D_B(Q,j),'Color',[186 85 211]./255,'LineWidth',LW);hold on
end
title('$[D]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),D_C(Q,j),'Color',[186 85 211]./255,'LineWidth',LW);hold on
end
title('$[D]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/DC_module','-dpng','-r600')

%% Plot naive CD4+T_module

figure(3)

subplot(1,3,1)
for j=1:sample
plot(time(Q),TN4_A(Q,j),'Color',[0 0 139]./255,'LineWidth',LW);hold on
end
title('$[T_{N4}]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),TN4_B(Q,j),'Color',[0 0 139]./255,'LineWidth',LW);hold on
end
title('$[T_{N4}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/NaiveCD4+T_module','-dpng','-r600')

%% Plot T1_module

figure(4)

subplot(1,3,1)
for j=1:sample
plot(time(Q),T1_A(Q,j),'Color',[0 0 205]./255,'LineWidth',LW);hold on
end
title('$[T_1]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),T1_B(Q,j),'Color',[0 0 205]./255,'LineWidth',LW);hold on
end
title('$[T_1]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),T1_C(Q,j),'Color',[0 0 205]./255,'LineWidth',LW);hold on
end
title('$[T_1]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/T1_module','-dpng','-r600')

%% Plot T2_module

figure(5)

subplot(1,3,1)
for j=1:sample
plot(time(Q),T2_A(Q,j),'Color',[72 118 255]./255,'LineWidth',LW);hold on
end
title('$[T_2]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),T2_B(Q,j),'Color',[72 118 255]./255,'LineWidth',LW);hold on
end
title('$[T_2]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),T2_C(Q,j),'Color',[72 118 255]./255,'LineWidth',LW);hold on
end
title('$[T_2]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/T2_module','-dpng','-r600')

%% Plot T17_module

figure(6)

subplot(1,3,1)
for j=1:sample
plot(time(Q),T17_A(Q,j),'Color',[30 144 255]./255,'LineWidth',LW);hold on
end
title('$[T_{17}]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),T17_B(Q,j),'Color',[30 144 255]./255,'LineWidth',LW);hold on
end
title('$[T_{17}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),T17_C(Q,j),'Color',[30 144 255]./255,'LineWidth',LW);hold on
end
title('$[T_{17}]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/T17_module','-dpng','-r600')

%% Plot Treg_module

figure(7)

subplot(1,3,1)
for j=1:sample
plot(time(Q),Treg_A(Q,j),'Color',[0 191 255]./255,'LineWidth',LW);hold on
end
title('$[T_{reg}]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),Treg_B(Q,j),'Color',[0 191 255]./255,'LineWidth',LW);hold on
end
title('$[T_{reg}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),Treg_C(Q,j),'Color',[0 191 255]./255,'LineWidth',LW);hold on
end
title('$[T_{reg}]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/Treg_module','-dpng','-r600')

%% Plot Tfh_module

figure(8)

subplot(1,3,1)
for j=1:sample
plot(time(Q),Tfh_A(Q,j),'Color',[0 154 205]./255,'LineWidth',LW);hold on
end
title('$[T_{fh}]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),Tfh_B(Q,j),'Color',[0 154 205]./255,'LineWidth',LW);hold on
end
title('$[T_{fh}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),Tfh_C(Q,j),'Color',[0 154 205]./255,'LineWidth',LW);hold on
end
title('$[T_{fh}]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/Tfh_module','-dpng','-r600')

%% Plot naive CD8+T_module

figure(9)

subplot(1,3,1)
for j=1:sample
plot(time(Q),TN8_A(Q,j),'Color',[107 142 35]./255,'LineWidth',LW);hold on
end
title('$[T_{N8}]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),TN8_B(Q,j),'Color',[107 142 35]./255,'LineWidth',LW);hold on
end
title('$[T_{N8}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/NaiveCD8+T_module','-dpng','-r600')

%% Plot T8_module

figure(10)

subplot(1,3,1)
for j=1:sample
plot(time(Q),T8_A(Q,j),'Color',[50 205 50]./255,'LineWidth',LW);hold on
end
title('$[T_8]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),T8_B(Q,j),'Color',[50 205 50]./255,'LineWidth',LW);hold on
end
title('$[T_8]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),T8_C(Q,j),'Color',[50 205 50]./255,'LineWidth',LW);hold on
end
title('$[T_8]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/T8_module','-dpng','-r600')

%% Plot NK_module

figure(11)

subplot(1,3,1)
for j=1:sample
plot(time(Q),NK_A(Q,j),'Color',[255 0 0]./255,'LineWidth',LW);hold on
end
title('$[NK]_A$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),NK_B(Q,j),'Color',[255 0 0]./255,'LineWidth',LW);hold on
end
title('$[NK]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,3)
for j=1:sample
plot(time(Q),NK_C(Q,j),'Color',[255 0 0]./255,'LineWidth',LW);hold on
end
title('$[NK]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);

set(gcf,'unit','centimeters','position',Pos);
print('cell/NK_module','-dpng','-r600')

%% Plot M-MDSC_module

figure(12)

subplot(1,3,1)
for j=1:sample
plot(time(Q),MMDSC_B(Q,j),'Color',[255 0 0]./255,'LineWidth',LW);hold on
end
title('$[M_{MDSC}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),MMDSC_C(Q,j),'Color',[255 0 0]./255,'LineWidth',LW);hold on
end
title('$[M_{MDSC}]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/MMDSC_module','-dpng','-r600')

%% Plot G-MDSC_module

figure(13)

subplot(1,3,1)
for j=1:sample
plot(time(Q),GMDSC_B(Q,j),'Color',[255 99 71]./255,'LineWidth',LW);hold on
end
title('$[G_{MDSC}]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),GMDSC_C(Q,j),'Color',[255 99 71]./255,'LineWidth',LW);hold on
end
title('$[G_{MDSC}]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/GMDSC_module','-dpng','-r600')

%% Plot Monocytes_module

figure(14)

subplot(1,3,1)
for j=1:sample
plot(time(Q),M_B(Q,j),'Color',[205 102 29]./255,'LineWidth',LW);hold on
end
title('$[M]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),M_C(Q,j),'Color',[205 102 29]./255,'LineWidth',LW);hold on
end
title('$[M]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/M_module','-dpng','-r600')

%% Plot M1-type-macrophages_module

figure(15)

subplot(1,3,1)
for j=1:sample
plot(time(Q),M1_B(Q,j),'Color',[255 127 36]./255,'LineWidth',LW);hold on
end
title('$[M_1]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),M1_C(Q,j),'Color',[255 127 36]./255,'LineWidth',LW);hold on
end
title('$[M_1]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/M1_module','-dpng','-r600')

%% Plot M2-type-macrophages_module

figure(16)

subplot(1,3,1)
for j=1:sample
plot(time(Q),M2_B(Q,j),'Color',[255 165 79]./255,'LineWidth',LW);hold on
end
title('$[M_2]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),M2_C(Q,j),'Color',[255 165 79]./255,'LineWidth',LW);hold on
end
title('$[M_2]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/M2_module','-dpng','-r600')

%% Plot Neutrophils_module

figure(17)

subplot(1,3,1)
for j=1:sample
plot(time(Q),N_B(Q,j),'Color',[205 16 118]./255,'LineWidth',LW);hold on
end
title('$[N]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),N_C(Q,j),'Color',[205 16 118]./255,'LineWidth',LW);hold on
end
title('$[N]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/N_module','-dpng','-r600')

%% Plot N1-type-neutrophils_module

figure(18)

subplot(1,3,1)
for j=1:sample
plot(time(Q),N1_B(Q,j),'Color',[255 20 147]./255,'LineWidth',LW);hold on
end
title('$[N_1]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),N1_C(Q,j),'Color',[255 20 147]./255,'LineWidth',LW);hold on
end
title('$[N_1]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/N1_module','-dpng','-r600')

%% Plot N2-type-neutrophils_module

figure(19)

subplot(1,3,1)
for j=1:sample
plot(time(Q),N2_B(Q,j),'Color',[255 110 180]./255,'LineWidth',LW);hold on
end
title('$[N_2]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),N2_C(Q,j),'Color',[255 110 180]./255,'LineWidth',LW);hold on
end
title('$[N_2]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/N2_module','-dpng','-r600')

%% Plot  Eosinophils_module

figure(20)

subplot(1,3,1)
for j=1:sample
plot(time(Q),Eos_B(Q,j),'Color',[154 205 50]./255,'LineWidth',LW);hold on
end
title('$[Eos]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),Eos_C(Q,j),'Color',[154 205 50]./255,'LineWidth',LW);hold on
end
title('$[Eos]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

set(gcf,'unit','centimeters','position',Pos);
print('cell/Eos_module','-dpng','-r600')

%% Plot Basophils_module

figure(21)

subplot(1,3,1)
for j=1:sample
plot(time(Q),Bas_B(Q,j),'Color',[102 205 170]./255,'LineWidth',LW);hold on
end
title('$[Bas]_B$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]); 

subplot(1,3,2)
for j=1:sample
plot(time(Q),Bas_C(Q,j),'Color',[102 205 170]./255,'LineWidth',LW);hold on
end
title('$[Bas]_C$','Interpreter','latex'); set(gca,'FontSize',FS); xlim([50 350]);  

set(gcf,'unit','centimeters','position',Pos);
print('cell/Bas_module','-dpng','-r600')