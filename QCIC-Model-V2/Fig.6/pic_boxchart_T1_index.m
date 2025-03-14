function pic_boxchart_T1_index()

file_T1='./Data_Boxplot/T1.mat';
A=cell2mat(struct2cell(load(file_T1)));

% [~, P_T1_Placebo]=ttest2(A(:,1),A(:,2))
% [~,  P_T1_TAS102]=ttest2(A(:,3),A(:,4))
% [~,  P_T1_TASBEV]=ttest2(A(:,5),A(:,6))

%% Plot Th1 Placebo

figure(1)

T=[A(:,1) A(:,2)]; y1=A(:,1); y2=A(:,2);
boxchart(T,'BoxFaceColor',[0 0 0]./255,'MarkerStyle','none','Notch','on')
hold on

x=rand(500,1); x1=0.775+0.45*x; x2=1.775+0.45*x;
for i=1:500
plot(x1(i), y1(i), '.', 'MarkerSize', 15,'Color',[30 144 255]./255);
hold on
plot(x2(i), y2(i), '.', 'MarkerSize', 15,'Color',[255 99 71]./255);
hold on
end
box on

% Output image setting
set(gca,'xticklabel',{"R","NR"});
set(gca,'YLim',[3.5e5 6e5]);
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('CD4+ Th1 (cells/L)');
title('Placebo')
set(gcf,'unit','centimeters','position',[2 25 17 10])
print('T1_boxchart_Placebo','-dpng','-r600')

%% Plot Th1 TAS-102

figure(2)

T=[A(:,3) A(:,4)]; y1=A(:,3); y2=A(:,4);
boxchart(T,'BoxFaceColor',[0 0 0]./255,'MarkerStyle','none','Notch','on')
hold on

x=rand(500,1); x1=0.775+0.45*x; x2=1.775+0.45*x;
for i=1:500
plot(x1(i), y1(i), '.', 'MarkerSize', 15,'Color',[30 144 255]./255);
hold on
plot(x2(i), y2(i), '.', 'MarkerSize', 15,'Color',[255 99 71]./255);
hold on
end
box on

% Output image setting
set(gca,'xticklabel',{"R","NR"});
set(gca,'YLim',[3.5e5 6e5]);
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('CD4+ Th1 (cells/L)');
title('TAS-102')
set(gcf,'unit','centimeters','position',[2 25 17 10])
print('T1_boxchart_TAS-102','-dpng','-r600')

%% Plot Th1 TAS-102+Bevacizumab

figure(3)

T=[A(:,5) A(:,6)]; y1=A(:,5); y2=A(:,6);
boxchart(T,'BoxFaceColor',[0 0 0]./255,'MarkerStyle','none','Notch','on')
hold on

x=rand(500,1); x1=0.775+0.45*x; x2=1.775+0.45*x;
for i=1:500
plot(x1(i), y1(i), '.', 'MarkerSize', 15,'Color',[30 144 255]./255);
hold on
plot(x2(i), y2(i), '.', 'MarkerSize', 15,'Color',[255 99 71]./255);
hold on
end
box on

% Output image setting
set(gca,'xticklabel',{"R","NR"});
set(gca,'YLim',[3.5e5 6e5]);
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('CD4+ Th1 (cells/L)');
title('TAS-102+Bevacizumab')
set(gcf,'unit','centimeters','position',[2 25 17 10])
print('T1_boxchart_TAS-102+bevacizumab','-dpng','-r600')

end