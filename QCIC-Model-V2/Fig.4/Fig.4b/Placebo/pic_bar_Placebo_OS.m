function pic_bar_Placebo_OS()

file='Ave_Placebo.mat';
A=cell2mat(struct2cell(load(file)));
x=A(1:90:365);
X=[100-x(1),x(1)-x(2),x(2)-x(3),x(3)-x(4),x(4)-x(5)]
t=length(A)/30;
T=linspace(0,12,5);

plot(T,X,'-or','LineWidth',3,'Color',[30 144 255]./255,'MarkerSize',16,'MarkerEdgeColor',[0 0 205]./255,'MarkerFaceColor',[0 191 255]./255)
hold on

file1='1.Yoshino.2012.OS.P.mat';
A1=cell2mat(struct2cell(load(file1)));
X1=[0 19.4357 26.3323 22.5706 15.6739];
plot(T,X1,'-.or','LineWidth',1,'Color',[255 0 0]./255,'MarkerSize',8,'MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255)
hold on

file2='2.Mayer.2015.OS.P.mat';
A2=cell2mat(struct2cell(load(file2)));
X2=[0 24.5211 31.8007 19.5403 6.5134];
plot(T,X2,'-.or','LineWidth',1,'Color',[255 165 0]./255,'MarkerSize',8,'MarkerEdgeColor',[238 173 14]./255,'MarkerFaceColor',[255 185 15]./255)
hold on

file3='3.Xu.2018.OS.P.mat';
A3=cell2mat(struct2cell(load(file3)));
X3=[0 15.4440 26.2548 19.6912 16.2162];
plot(T,X3,'-.or','LineWidth',1,'Color',[0 206 209]./255,'MarkerSize',8,'MarkerEdgeColor',[72 209 204]./255,'MarkerFaceColor',[64 224 208]./255)
hold on

file4='4.VanUS.2018.OS.P.mat';
A4=cell2mat(struct2cell(load(file4)));
X4=[0 19.4872 40.0513 14.8718 0];
plot(T,X4,'-.or','LineWidth',1,'Color',[123 104 238]./255,'MarkerSize',8,'MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255)
hold on

file5='5.VanUS.2018.OS.P.mat';
A5=cell2mat(struct2cell(load(file5)));
X5=[0 15.8974 30.2564 21.0257 9.2308];
plot(T,X5,'-.or','LineWidth',1,'Color',[255 105 180]./255,'MarkerSize',8,'MarkerEdgeColor',[255 20 147]./255,'MarkerFaceColor',[238 130 238]./255)
hold on

%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 50]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
ylabel('Frequency');
xlabel('Time (months)');
title('Placebo');
legend('model simulation','Yoshino. 2012','Mayer. 2015','Xu. 2018','Van. 2018 (Japan)','Van. 2018 (US)','Location','EastOutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('Placebo_OS','-dpng','-r600')

end