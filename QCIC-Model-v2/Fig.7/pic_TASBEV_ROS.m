function pic_TASBEV_ROS()

file1='./TASBEV_ROC/T_C_sample.mat';
A=cell2mat(struct2cell(load(file1)));

file2='./TASBEV_ROC/T1_C_sample.mat';
T1=cell2mat(struct2cell(load(file2)));

file3='./TASBEV_ROC/T8_C_sample.mat';
T8=cell2mat(struct2cell(load(file3)));

file4='./TASBEV_ROC/T1Treg_sample.mat';
T1Treg=cell2mat(struct2cell(load(file4)));

file5='./TASBEV_ROC/T8Treg_sample.mat';
T8Treg=cell2mat(struct2cell(load(file5)));

x=0:0.1:1;
y=x;
Q = plot(x,y,'--','color','#808080','LineWidth',2);
hold on

[X_T8,Y_T8,~,AUC_T8] = perfcurve(A,T8,1);
P_T8 = plot(X_T8,Y_T8,'-','color','#A93CC4','linewidth',2);
hold on

[X_T1Treg,Y_T1Treg,~,AUC_T1Treg] = perfcurve(A,T1Treg,1);
P_T1Treg = plot(X_T1Treg,Y_T1Treg,'-','color','#0968F7','linewidth',2);
hold on

[X_T1,Y_T1,~,AUC_T1] = perfcurve(A,T1,1);
P_T1 = plot(X_T1,Y_T1,'-','color','#FF0000','linewidth',2);
hold on

[X_T8Treg,Y_T8Treg,~,AUC_T8Treg] = perfcurve(A,T8Treg,1);
P_T8Treg = plot(X_T8Treg,Y_T8Treg,'-','color','#33CC52','linewidth',2);
hold on

AUC=[AUC_T8,AUC_T1Treg,AUC_T1,AUC_T8Treg]

%% Output image setting

set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 1]);
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
xlabel('1-Specificity');
ylabel('Sensitivity');
title('TAS-102+Bevacizumab');
legend([P_T8 P_T1Treg P_T1 P_T8Treg],'CTL            AUC=0.77','Th1/Treg    AUC=0.76','Th1            AUC=0.71','CTL/Treg   AUC=0.67','location','southeast');
legend('boxon');
set(gcf,'unit','centimeters','position',[3 15 18 16])
print('ROC_TAS-102+Bevacizumab','-dpng','-r600')

end