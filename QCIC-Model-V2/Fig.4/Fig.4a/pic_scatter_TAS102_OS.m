function pic_scatter_TAS102_OS()


x=0:0.1:12; 
y=x;
plot(x,y,'--','color','#808080','LineWidth',1)
hold on

x=[112 502 271 64 178 66 36 47 246]./1522;

A1=7.45;
B1=7.52;
scatter(A1,B1,'filled','MarkerEdgeColor',[255 0 0]./255,'MarkerFaceColor',[255 99 71]./255,'SizeData',1000);
hold on
A2=9.0;
B2=7.52;
scatter(A2,B2,'filled','MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255,'SizeData',1000*x(1));
hold on
A3=7.1;
B3=7.52;
scatter(A3,B3,'filled','MarkerEdgeColor',[255 140 0]./255,'MarkerFaceColor',[255 165 0]./255,'SizeData',1000*x(2));
hold on
A4=7.8;
B4=7.52;
scatter(A4,B4,'filled','MarkerEdgeColor',[238 173 14]./255,'MarkerFaceColor',[255 185 15]./255,'SizeData',1000*x(3));
hold on
A5=6.5;
B5=7.52;
scatter(A5,B5,'filled','MarkerEdgeColor',[102 205 0]./255,'MarkerFaceColor',[154 205 50]./255,'SizeData',1000*x(4));
hold on
A6=7.8;
B6=7.52;
scatter(A6,B6,'filled','MarkerEdgeColor',[72 209 204]./255,'MarkerFaceColor',[64 224 208]./255,'SizeData',1000*x(5));
hold on
A7=8.0;
B7=7.52;
scatter(A7,B7,'filled','MarkerEdgeColor',[30 144 255]./255,'MarkerFaceColor',[135 206 250]./255,'SizeData',1000*x(6));
hold on
A8=6.7;
B8=7.52;
scatter(A8,B8,'filled','MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255,'SizeData',1000*x(8));
hold on
A9=7.5;
B9=7.52;
scatter(A9,B9,'filled','MarkerEdgeColor',[255 20 147]./255,'MarkerFaceColor',[238 130 238]./255,'SizeData',1000*x(9));


%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 12]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
xlabel('Clinical medical data');
ylabel('Model simulation data');
title('TAS-102 (M-OS)');
legend('','Average','Yoshino. 2012','Mayer. 2015','Xu. 2018','Van. 2018 (Japan)','Van. 2018 (US)','Kotani. 2019','Pfeiffer. 2020','Prager. 2023','Location','bestoutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('Scatter_TAS102_OS','-dpng','-r600')

end