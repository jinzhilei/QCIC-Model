function pic_bar_TASBEV_OS()

file='Ave_TASBEV.mat';
A=cell2mat(struct2cell(load(file)));
x=A(1:90:365);
X=[100-x(1),x(1)-x(2),x(2)-x(3),x(3)-x(4),x(4)-x(5)]
t=length(A)/30;
T=linspace(0,12,5);

plot(T,X,'-or','LineWidth',3,'Color',[255 165 79]./255,'MarkerSize',16,'MarkerEdgeColor',[255 140 0]./255,'MarkerFaceColor',[255 165 0]./255)
hold on

file1='1.Kuboki.2017.OS.TB.mat';
A1=cell2mat(struct2cell(load(file1)));
X1=[0 0 16.3121 19.8581 20.5674];
plot(T,X1,'-.or','LineWidth',1,'Color',[255 0 0]./255,'MarkerSize',8,'MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255)
hold on

file2='2.Kotani.2019.OS.TB.mat';
A2=cell2mat(struct2cell(load(file2)));
X2=[0 15.8654 11.0577 26.4423 8.1731];
plot(T,X2,'-.or','LineWidth',1,'Color',[255 127 80]./255,'MarkerSize',8,'MarkerEdgeColor',[255 140 0]./255,'MarkerFaceColor',[255 165 0]./255)
hold on

file3='3.Pfeiffer.2020.OS.TB.mat';
A3=cell2mat(struct2cell(load(file3)));
X3=[0 8.6294 14.2132 26.396 20.3045];
plot(T,X3,'-.or','LineWidth',1,'Color',[255 165 0]./255,'MarkerSize',8,'MarkerEdgeColor',[238 173 14]./255,'MarkerFaceColor',[255 185 15]./255)
hold on

file4='4.Takahashi.2021.OS.TB(M).mat';
A4=cell2mat(struct2cell(load(file4)));
X4=[0 3.9164 24.0209 22.1932 19.8434];
plot(T,X4,'-.or','LineWidth',1,'Color',[50 205 50]./255,'MarkerSize',8,'MarkerEdgeColor',[102 205 0]./255,'MarkerFaceColor',[154 205 50]./255)
hold on

file5='5.Takahashi.2021.OS.TB(W).mat';
A5=cell2mat(struct2cell(load(file5)));
X5=[0 6.1358 18.5378 20.1045 12.7937]; 
plot(T,X5,'-.or','LineWidth',1,'Color',[0 206 209]./255,'MarkerSize',8,'MarkerEdgeColor',[72 209 204]./255,'MarkerFaceColor',[64 224 208]./255)
hold on

file6='6.Yoshida.2021.OS.TB.mat';
A6=cell2mat(struct2cell(load(file6)));
X6=[0 8.6667 21 15 14.6666];
plot(T,X6,'-.or','LineWidth',1,'Color',[0 191 255]./255,'MarkerSize',8,'MarkerEdgeColor',[30 144 255]./255,'MarkerFaceColor',[135 206 250]./255)
hold on

file7='7.Prager.2023.OS.TB.mat';
A7=cell2mat(struct2cell(load(file7)));
X7=[0 5.8824 16.8627 18.6274 16.0784];
plot(T,X7,'-.or','LineWidth',1,'Color',[123 104 238]./255,'MarkerSize',8,'MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255)
hold on

%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 50]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
ylabel('Frequency');
xlabel('Time (months)');
title('TAS-102+Bevacizumab');
legend('model simulation','Kuboki. 2017','Kotani. 2019','Pfeiffer. 2020','Takahashi. 2021 (M)','Takahashi. 2021 (W)','Yoshida. 2021','Prager. 2023','Location','EastOutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('TASBEV-102_OS','-dpng','-r600')

end