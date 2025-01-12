function pic_Placebo_OS_Clin_Sim()

%% Sim plot

n=10;
t=365;
TT=1:1:t;
T=TT./30;

load Ave.mat

% Q=Placebo_OS_Sim_CI(t,n);
% Q=load('Ave.mat');
% Ave=sum(Q,2)./n;
% Max_CI=max(Q,[],2);
% Min_CI=min(Q,[],2);
% A = cat(1,Min_CI,flipud(Max_CI));
% B = cat(2,T,fliplr(T))';
% color=[102 204 255]./255;
% fill(B,A,color,'FaceAlpha',0.1); hold on

plot(T,Ave,'-','color','#66ccff','linewidth',3);hold on 

%% Clin Data

P1=cell2mat(struct2cell(load('Placebo_Clin/1.Yoshino.2012.OS.P.mat')));
P2=cell2mat(struct2cell(load('Placebo_Clin/2.Mayer.2015.OS.P.mat')));
P3=cell2mat(struct2cell(load('Placebo_Clin/3.Xu.2018.OS.P.mat')));
P4=cell2mat(struct2cell(load('Placebo_Clin/4.VanUS.2018.OS.P.mat')));
P5=cell2mat(struct2cell(load('Placebo_Clin/5.VanUS.2018.OS.P.mat')));

%% curve plotting
plot(P1(:,1),P1(:,2),':','color','#FF0000','linewidth',1);
hold on
plot(P2(:,1),P2(:,2),':','color','#FFA500','linewidth',1);
hold on
plot(P3(:,1),P3(:,2),':','color','#00CED1','linewidth',1);
hold on
plot(P4(:,1),P4(:,2),':','color','#7B68EE','linewidth',1);
hold on
plot(P5(:,1),P5(:,2),':','color','#ff99cc','linewidth',1);
hold on
grid on

% %% M_OS
% plot(linspace(0,6.03,183),linspace(50,50,183),'--','color','#66ccff','linewidth',1.5);
% hold on
% plot(linspace(6.03,6.03,50),linspace(0,50,50),'--','color','#66ccff','linewidth',1.5);
% hold on 
% text(0.6,56,'M-OS: 6.1 months','FontSize',22,'color','#66ccff');


%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Time (months)');
ylabel('Overall survival (%)');
title('Placebo');
legend('Model simulation','Yoshino et al., 2012, Placebo','Mayer et al., 2015, Placebo','Xu et al., 2018, Placebo','Van et al., 2018, Placebo (Japan)','Van et al., 2018, Placebo (USA)','location','southwest');
legend('boxoff');
set(gcf,'unit','centimeters','position',[3 4 22 16]);
print('Placebo_OS','-dpng','-r600');

end