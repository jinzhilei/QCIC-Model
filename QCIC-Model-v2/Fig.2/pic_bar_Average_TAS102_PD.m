function pic_bar_Average_TAS102_PD()

y_PD=[55;54.3];
b = bar(y_PD,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [255 106 106]./255;
hold on

plot(0.15:0.05:2.85,55.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,45.5,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(1.875,56,'Marker','.','Color','#FF7F00','Markersize',50);
hold on;
plot(2,55.9,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.125,53.2,'Marker','.','Color','#00BFFF','Markersize',50);
hold on;
plot(2.25,48.9,'Marker','.','Color','#7B68EE','Markersize',50);
hold on
text(0.85,87,'55%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,87,'54.3%','Color',[255 106 106]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('TAS-102 (PD)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('TAS102_Average_PD','-dpng','-r600')

end