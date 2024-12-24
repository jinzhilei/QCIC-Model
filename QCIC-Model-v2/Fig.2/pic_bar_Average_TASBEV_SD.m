function pic_bar_Average_TASBEV_SD()

y_SD=[61;58.9];
b = bar(y_SD,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [255 215 0]./255;
hold on

plot(0.15:0.05:2.85,61.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,68,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(1.875,50.9,'Marker','.','Color','#FF7F00','Markersize',50);
hold on;
plot(2,65.2,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.125,58.3,'Marker','.','Color','#32CD32','Markersize',50);
hold on;
plot(2.25,59.4,'Marker','.','Color','#00BFFF','Markersize',50);
hold on
text(0.85,87,'61%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,87,'58.9%','Color',[255 215 0]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('TAS-102+Bevacizumab (SD)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('TASBEV_Average_SD','-dpng','-r600')

end