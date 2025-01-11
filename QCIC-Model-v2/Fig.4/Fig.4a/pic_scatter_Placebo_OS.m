function pic_scatter_Placebo_OS()

x=0:0.1:12; 
y=x;
plot(x,y,'--','color','#808080','LineWidth',1)
hold on

x=[57 258 135 35 88]./573;

A1=6.01;
B1=6.1;
scatter(A1,B1,'filled','MarkerEdgeColor',[0 0 205]./255,'MarkerFaceColor',[0 191 255]./255,'SizeData',1000);
hold on
A2=6.6;
B2=6.1;
scatter(A2,B2,'filled','MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255,'SizeData',1000*x(1));
hold on
A3=5.3;
B3=6.1;
scatter(A3,B3,'filled','MarkerEdgeColor',[238 173 14]./255,'MarkerFaceColor',[255 185 15]./255,'SizeData',1000*x(2));
hold on
A4=7.1;
B4=6.1;
scatter(A4,B4,'filled','MarkerEdgeColor',[72 209 204]./255,'MarkerFaceColor',[64 224 208]./255,'SizeData',1000*x(3));
hold on
A5=6.7;
B5=6.1;
scatter(A5,B5,'filled','MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255,'SizeData',1000*x(4));
hold on
A6=4.3;
B6=6.1;
scatter(A6,B6,'filled','MarkerEdgeColor',[255 20 147]./255,'MarkerFaceColor',[238 130 238]./255,'SizeData',1000*x(5));

%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 12]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
xlabel('Clinical medical data');
ylabel('Model simulation data');
title('Placebo (M-OS)');
legend('','Average','Yoshino. 2012','Mayer. 2015','Xu. 2018','Van. 2018 (Japan)','Van. 2018 (US)','Location','bestoutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('Scatter_Placebo_OS','-dpng','-r600')

end