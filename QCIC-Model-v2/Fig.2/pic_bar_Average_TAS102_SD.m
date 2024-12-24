function pic_bar_Average_TAS102_SD()

y_SD=[44;44.4];
b = bar(y_SD,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [255 106 106]./255;
hold on

plot(0.15:0.05:2.85,44.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,53.6,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(1.875,42.4,'Marker','.','Color','#FF7F00','Markersize',50);
hold on;
plot(2,43,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.125,45.3,'Marker','.','Color','#00BFFF','Markersize',50);
hold on;
plot(2.25,51.1,'Marker','.','Color','#7B68EE','Markersize',50);
hold on
text(0.85,87,'44%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,87,'44.4%','Color',[255 106 106]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('TAS-102 (SD)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('TAS102_Average_SD','-dpng','-r600')

end