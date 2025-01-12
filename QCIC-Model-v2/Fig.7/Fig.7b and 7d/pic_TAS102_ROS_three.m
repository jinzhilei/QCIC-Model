function pic_TAS102_ROS_three()

file1='./TSA102_ROC/T_C_sample.mat';
A=cell2mat(struct2cell(load(file1)));

file2='./TSA102_ROC/T1_C_sample.mat';
T1=cell2mat(struct2cell(load(file2)));

file3='./TSA102_ROC/T8_C_sample.mat';
T8=cell2mat(struct2cell(load(file3)));

file4='./TSA102_ROC/T1Treg_sample.mat';
T1Treg=cell2mat(struct2cell(load(file4)));

file5='./TSA102_ROC/T8Treg_sample.mat';
T8Treg=cell2mat(struct2cell(load(file5)));

T1 = (T1-min(T1))./(max(T1)-min(T1));
T8 = (T8-min(T8))./(max(T8)-min(T8));
T1Treg = (T1Treg-min(T1Treg))./(max(T1Treg)-min(T1Treg));
T8Treg = (T8Treg-min(T8Treg))./(max(T8Treg)-min(T8Treg));

T1_T8 = T1 + T8;
T1_T1Treg = T1 + T1Treg;
T1_T8Treg = T1 + T8Treg;
T8_T1Treg = T8 + T1Treg;
T8_T8Treg = T8 + T8Treg;
T1Treg_T8Treg = T1Treg + T8Treg;

x=0:0.1:1;
y=x;
plot(x,y,'--','color','#808080','LineWidth',2);
hold on

[X_T1_T1Treg,Y_T1_T1Treg,~,AUC_T1_T1Treg] = perfcurve(A,T1_T1Treg,1);
P_T1_T1Treg = plot(X_T1_T1Treg,Y_T1_T1Treg,'-.','color','#FFA500','linewidth',2);
hold on

[X_T1_T8Treg,Y_T1_T8Treg,~,AUC_T1_T8Treg] = perfcurve(A,T1_T8Treg,1);
P_T1_T8Treg = plot(X_T1_T8Treg,Y_T1_T8Treg,'-.','color','#33CC52','linewidth',2);
hold on

[X_T8_T1Treg,Y_T8_T1Treg,~,AUC_T8_T1Treg] = perfcurve(A,T8_T1Treg,1);
P_T8_T1Treg = plot(X_T8_T1Treg,Y_T8_T1Treg,'-.','color','#FF1493','linewidth',2);
hold on

[X_T1_T8,Y_T1_T8,~,AUC_T1_T8] = perfcurve(A,T1_T8,1);
P_T1_T8 = plot(X_T1_T8,Y_T1_T8,'-.','color','#FF0000','linewidth',2);
hold on

[X_T8_T8Treg,Y_T8_T8Treg,~,AUC_T8_T8Treg] = perfcurve(A,T8_T8Treg,1);
P_T8_T8Treg = plot(X_T8_T8Treg,Y_T8_T8Treg,'-.','color','#00BFFF','linewidth',2);
hold on

[X_T1Treg_T8Treg,Y_T1Treg_T8Treg,~,AUC_T1Treg_T8Treg] = perfcurve(A,T1Treg_T8Treg,1);
P_T1Treg_T8Treg = plot(X_T1Treg_T8Treg,Y_T1Treg_T8Treg,'-.','color','#8A2BE2','linewidth',2);
hold on

AUC=[AUC_T1_T1Treg,AUC_T1_T8Treg,AUC_T8_T1Treg,AUC_T1_T8,AUC_T8_T8Treg,AUC_T1Treg_T8Treg]

%% Output image setting

set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 1]);
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
xlabel('1-Specificity');
ylabel('Sensitivity');
title('TAS-102')
legend([P_T1_T1Treg P_T1_T8Treg P_T8_T1Treg P_T1_T8 P_T8_T8Treg P_T1Treg_T8Treg],'T1+T1/Treg              AUC=0.92','T1+CTL/Treg           AUC=0.85','CTL+T1/Treg           AUC=0.85','T1+CTL                   AUC=0.77','CTL+CTL/Treg        AUC=0.77','T1/Treg+CTL/Treg  AUC=0.68','location','southeast');
legend('boxon')
set(gcf,'unit','centimeters','position',[3 15 18 16])
print('ROC_Three','-dpng','-r600')

end
