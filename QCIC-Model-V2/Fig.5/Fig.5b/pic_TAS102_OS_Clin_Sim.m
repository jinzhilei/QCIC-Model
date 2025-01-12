function pic_TAS102_OS_Clin_Sim()

%% Sim plot
n=10;
t=365;
TT=1:1:t;
T=TT./30;

load Ave.mat

% Q=TAS102_OS_Sim_CI(t,n);
% Ave=sum(Q,2)./n;
% Max_CI=max(Q,[],2);
% Min_CI=min(Q,[],2);
% A = cat(1,Min_CI,flipud(Max_CI));
% B = cat(2,T,fliplr(T))';
% color=[255 106 106]./255;

% fill(B,A,color,'FaceAlpha',0.1); hold on

plot(T,Ave,'-','color','#FF6A6A','linewidth',3);hold on 

%% Clin Data

T1=cell2mat(struct2cell(load('TAS102_Clin/1.Yoshino.2012.OS.T.mat')));
T2=cell2mat(struct2cell(load('TAS102_Clin/2.Mayer.2015.OS.T.mat')));
T3=cell2mat(struct2cell(load('TAS102_Clin/3.Xu.2018.OS.T.mat')));
T4=cell2mat(struct2cell(load('TAS102_Clin/4.VanUS.2018.OS.T.mat')));
T5=cell2mat(struct2cell(load('TAS102_Clin/5.VanUS.2018.OS.T.mat')));
T6=cell2mat(struct2cell(load('TAS102_Clin/6.Kotani.2019.OS.T.mat')));
T7=cell2mat(struct2cell(load('TAS102_Clin/7.Pfeiffer.2020.OS.T.mat')));
T8=cell2mat(struct2cell(load('TAS102_Clin/8.Prager.2023.OS.T.mat')));

%% curve plotting
plot(T1(:,1),T1(:,2),':','color','#FF0000','linewidth',1);
hold on
plot(T2(:,1),T2(:,2),':','color','#FF7F00','linewidth',1);
hold on
plot(T3(:,1),T3(:,2),':','color','#FFA500','linewidth',1);
hold on
plot(T4(:,1),T4(:,2),':','color','#32CD32','linewidth',1);
hold on
plot(T5(:,1),T5(:,2),':','color','#00CED1','linewidth',1);
hold on
plot(T6(:,1),T6(:,2),':','color','#00BFFF','linewidth',1);
hold on
plot(T7(:,1),T7(:,2),':','color','#7B68EE','linewidth',1);
hold on
plot(T8(:,1),T8(:,2),':','color','#ff99cc','linewidth',1);
hold on
grid on

% %% M_OS
% plot(linspace(0,7.6,228),linspace(50,50,228),'--','color','#FF6A6A','linewidth',1.5);
% hold on
% plot(linspace(7.6,7.6,50),linspace(0,50,50),'--','color','#FF6A6A','linewidth',1.5);
% hold on 
% text(0.8,56,'M-OS: 7.6 months','FontSize',22,'color','#FF6A6A');

%% Output image setting
% Set coordinate range
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 100]);
% Set outer border
set(gca,'Linewidth',1);
% Set font size
set(gca,'FontSize',18);
% Set font name
set(gca,'FontName','Arial');
% Set label
xlabel('Time (months)');
ylabel('Overall survival (%)');
title('TAS-102');
% Set legend
legend('Model simulation','Yoshino et al., 2012, TAS-102','Mayer et al., 2015, TAS-102','Xu et al., 2018, TAS-102','Van et al., 2018, TAS-102 (Japan)','Van et al., 2018, TAS-102 (USA)','Kotani et al., 2019, TAS-102','Pfeiffer et al., 2020, TAS-102','Prager et al., 2023, TAS-102','location','southwest');%'95% Confidence Interval',
legend('boxoff')
% Set the image name, format, and resolution
set(gcf,'unit','centimeters','position',[3 4 22 16])
print('TAS102_OS','-dpng','-r600')
end