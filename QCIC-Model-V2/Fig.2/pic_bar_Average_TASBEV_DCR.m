function pic_bar_Average_TASBEV_DCR()

y_DCR=[64;62.8];
b = bar(y_DCR,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [255 215 0]./255;
hold on

plot(0.15:0.05:2.85,64.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,72,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(1.875,56.1,'Marker','.','Color','#FF7F00','Markersize',50);
hold on;
plot(2,67.4,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.125,61.5,'Marker','.','Color','#32CD32','Markersize',50);
hold on;
plot(2.25,65.6,'Marker','.','Color','#00BFFF','Markersize',50);
hold on
text(0.85,87,'64%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,87,'62.8%','Color',[255 215 0]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('TAS-102+Bevacizumab (DCR)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('TASBEV_Average_DCR','-dpng','-r600')

end