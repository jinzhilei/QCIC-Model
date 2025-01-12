function pic_TASBEV_OS_Clin_Sim()

%% Sim plot

n=10;
t=365;
TT=1:1:t;
T=TT./30;

load Ave.mat

% Q=TASBEV_OS_Sim_CI(t,n);
% Ave=sum(Q,2)./n;
% Max_CI=max(Q,[],2);
% Min_CI=min(Q,[],2);
% A = cat(1,Min_CI,flipud(Max_CI));
% B = cat(2,T,fliplr(T))';
% color=[102 204 255]./255;
% fill(B,A,color,'FaceAlpha',0.3); hold on

plot(T,Ave,'-','color','#FFD700','linewidth',3);
hold on 


%% Clin Data

B1=cell2mat(struct2cell(load('TASBEV_Clin/1.Kuboki.2017.OS.TB.mat')));
B2=cell2mat(struct2cell(load('TASBEV_Clin/2.Kotani.2019.OS.TB.mat')));
B3=cell2mat(struct2cell(load('TASBEV_Clin/3.Pfeiffer.2020.OS.TB.mat')));
B4=cell2mat(struct2cell(load('TASBEV_Clin/4.Takahashi.2021.OS.TB(M).mat')));
B5=cell2mat(struct2cell(load('TASBEV_Clin/5.Takahashi.2021.OS.TB(W).mat')));
B6=cell2mat(struct2cell(load('TASBEV_Clin/6.Yoshida.2021.OS.TB.mat')));
B7=cell2mat(struct2cell(load('TASBEV_Clin/7.Prager.2023.OS.TB.mat')));

%% curve plotting
plot(B1(:,1),B1(:,2),':','color','#FF0000','linewidth',1.5);
hold on
plot(B2(:,1),B2(:,2),':','color','#FF7F00','linewidth',1.5);
hold on
plot(B3(:,1),B3(:,2),':','color','#FFA500','linewidth',1.5);
hold on
plot(B4(:,1),B4(:,2),':','color','#32CD32','linewidth',1.5);
hold on
plot(B5(:,1),B5(:,2),':','color','#00CED1','linewidth',1.5);
hold on
plot(B6(:,1),B6(:,2),':','color','#00BFFF','linewidth',1.5);
hold on
plot(B7(:,1),B7(:,2),':','color','#7B68EE','linewidth',1.5);
hold on
grid on

% %% M_OS
% plot(linspace(0,10.1,303),linspace(50,50,303),'--','color','#FFD700','linewidth',1.5);
% hold on
% plot(linspace(10.1,10.1,50),linspace(0,50,50),'--','color','#FFD700','linewidth',1.5);
% hold on 
% text(1.75,56,'M-OS: 10.1 months','FontSize',22,'color','#FFD700');

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
title('TAS-102+Bevacizumab');
% Set legend
legend('Model simulation','Kuboki et al., 2017, TAS-102+Bevacizumab','Kotani et al., 2019, TAS-102+Bevacizumab','Pfeiffer et al., 2020, TAS-102+Bevacizumab','Takahashi et al., 2021, TAS-102+Bevacizumab (M)','Takahashi et al., 2021, TAS-102+Bevacizumab (W)','Yoshida et al., 2021, TAS-102+Bevacizumab','Prager et al., 2023, TAS-102+Bevacizumab','location','southwest');%'95% Confidence Interval',
legend('boxoff')
% Set the image name, format, and resolution
set(gcf,'unit','centimeters','position',[3 4 22 16])
print('TASBEV_OS','-dpng','-r600')
end