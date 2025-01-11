function pic_scatter_TASBEV_OS()

x=0:0.1:12; 
y=x;
plot(x,y,'--','color','#808080','LineWidth',1)
hold on

x=[25 60 46 98 32 246]./507;

B1=10.01;
B2=10.1;
scatter(B1,B2,'filled','MarkerEdgeColor',[255 140 0]./255,'MarkerFaceColor',[255 165 0]./255,'SizeData',1000);
hold on
B3=11.4;
B4=10.1;
scatter(B3,B4,'filled','MarkerEdgeColor',[255 69 0]./255,'MarkerFaceColor',[255 99 71]./255,'SizeData',1000*x(1));
hold on
B5=8.6;
B6=10.1;
scatter(B5,B6,'filled','MarkerEdgeColor',[244 164 96]./255,'MarkerFaceColor',[255 130 71]./255,'SizeData',1000*x(2));
hold on
B7=9.4;
B8=10.1;
scatter(B7,B8,'filled','MarkerEdgeColor',[238 238 0]./255,'MarkerFaceColor',[255 255 0]./255,'SizeData',1000*x(3));
hold on
B9=9.1;
B10=10.1;
scatter(B9,B10,'filled','MarkerEdgeColor',[102 205 0]./255,'MarkerFaceColor',[154 205 50]./255,'SizeData',1000*x(4));
hold on
B11=9.2;
B12=10.1;
scatter(B11,B12,'filled','MarkerEdgeColor',[30 144 255]./255,'MarkerFaceColor',[135 206 250]./255,'SizeData',1000*x(5));
hold on
B13=10.8;
B14=10.1;
scatter(B13,B14,'filled','MarkerEdgeColor',[106 90 205]./255,'MarkerFaceColor',[132 112 255]./255,'SizeData',1000*x(6));

%% Output image setting
set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 12]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
xlabel('Clinical medical data');
ylabel('Model simulation data');
title('TAS-102+Bevacizumab (M-OS)');
legend('','Average','Kuboki. 2017','Kotani. 2019','Pfeiffer. 2020','Takahashi. 2011','Yoshida. 2021','Prager. 2023','Location','bestoutside','FontSize',20);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 20 24 14])
print('Scatter_TASBEV_OS','-dpng','-r600')

end