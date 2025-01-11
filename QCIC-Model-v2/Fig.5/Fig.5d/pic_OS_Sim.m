function pic_OS_Sim()

t=365;
TT=linspace(0,t,365);
T=TT./30;

%% Data

A1=cell2mat(struct2cell(load('Ave_Placebo.mat')));
A2=cell2mat(struct2cell(load('Ave_TAS102.mat')));
A3=cell2mat(struct2cell(load('Ave_TASBEV.mat')));
A4=100*ones(365,1);
A1(:,end)

%% area

area(T,A4,'FaceAlpha',1);
hold on
area(T,A3,'FaceAlpha',1);
hold on
area(T,A2,'FaceAlpha',1);
hold on
area(T,A1,'FaceAlpha',1);

%% color

newcolors = [217 217 217; 255 215 0; 255 106 106; 102 204 255]/255;
colororder(newcolors)

%% Output image setting

set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Time (months)');
ylabel('Overall survival (%)');
set(gcf,'unit','centimeters','position',[3 4 22 16])
print('Stacking','-dpng','-r600')
end