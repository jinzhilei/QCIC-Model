function pic_bar_TAS102_OS()

file='Ave_TAS102.mat';
A=cell2mat(struct2cell(load(file)));
x=A(1:90:365);
X=[100-x(1),x(1)-x(2),x(2)-x(3),x(3)-x(4),x(4)-x(5)]
t=length(A)/30;
T=linspace(0,12,5);

plot(T,X,'-or','LineWidth',3,'Color',[255 69 0]./255,'MarkerSize',16,'MarkerEdgeColor',[255 0 0]./255,'MarkerFaceColor',[255 99 71]./255)
hold on

file1='1.Yoshino.2012.OS.T.mat';
A1=cell2mat(struct2cell(load(file1)));
X1=[0 7.21 24.138 18.4953 13.4796];
plot(T,X1,'-.or','LineWidth',1,'Color',[255 0 0]./255,'MarkerSize',8,'MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255)
hold on

file2='2.Mayer.2015.OS.T.mat';
A2=cell2mat(struct2cell(load(file2)));
X2=[0 13.7931 28.3525 17.6245 13.41];
plot(T,X2,'-.or','LineWidth',1,'Color',[255 127 80]./255,'MarkerSize',8,'MarkerEdgeColor',[255 140 0]./255,'MarkerFaceColor',[255 165 0]./255)
hold on

file3='3.Xu.2018.OS.T.mat';
A3=cell2mat(struct2cell(load(file3)));
X3=[0 11.9691 22.0077 21.6217 13.8996];
plot(T,X3,'-.or','LineWidth',1,'Color',[255 165 0]./255,'MarkerSize',8,'MarkerEdgeColor',[238 173 14]./255,'MarkerFaceColor',[255 185 15]./255)
hold on

file4='4.VanUS.2018.OS.T.mat';
A4=cell2mat(struct2cell(load(file4)));
X4=[0 16.4103 26.6666 12.3077 10.2564];
plot(T,X4,'-.or','LineWidth',1,'Color',[50 205 50]./255,'MarkerSize',8,'MarkerEdgeColor',[102 205 0]./255,'MarkerFaceColor',[154 205 50]./255)
hold on

file5='5.VanUS.2018.OS.T.mat';
A5=cell2mat(struct2cell(load(file5)));
X5=[0 6.6667 24.1025 24.1026 14.359];
plot(T,X5,'-.or','LineWidth',1,'Color',[0 206 209]./255,'MarkerSize',8,'MarkerEdgeColor',[72 209 204]./255,'MarkerFaceColor',[64 224 208]./255)
hold on

file6='6.Kotani.2019.OS.T.mat';
A6=cell2mat(struct2cell(load(file6)));
X6=[0 20.1923 16.3462 21.6346 11.5384];
plot(T,X6,'-.or','LineWidth',1,'Color',[0 191 255]./255,'MarkerSize',8,'MarkerEdgeColor',[30 144 255]./255,'MarkerFaceColor',[135 206 250]./255)
hold on

file7='7.Pfeiffer.2020.OS.T.mat';
A7=cell2mat(struct2cell(load(file7)));
X7=[0 14.7208 34.5178 19.2893 10.1523];
plot(T,X7,'-.or','LineWidth',1,'Color',[123 104 238]./255,'MarkerSize',8,'MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255)
hold on

file8='8.Prager.2023.OS.T.mat';
A8=cell2mat(struct2cell(load(file8)));
X8=[0 13.9216 25.6862 18.4314 12.1569];
plot(T,X8,'-.or','LineWidth',1,'Color',[255 105 180]./255,'MarkerSize',8,'MarkerEdgeColor',[255 20 147]./255,'MarkerFaceColor',[238 130 238]./255)
hold on


%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 50]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
ylabel('Frequency');
xlabel('Time (months)');
title('TAS-102');
legend('model simulation','Yoshino. 2012','Mayer. 2015','Xu. 2018','Van. 2018 (Japan)','Van. 2018 (US)','Kotani. 2019','Pfeiffer. 2020','Prager. 2023','Location','EastOutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('TAS-102_OS','-dpng','-r600')

end