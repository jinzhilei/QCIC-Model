function pic_bar_Average_TAS102_DCR()

y_DCR=[45;45.7];
b = bar(y_DCR,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [255 106 106]./255;
hold on

plot(0.15:0.05:2.85,45.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,54.5,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(1.875,44,'Marker','.','Color','#FF7F00','Markersize',50);
hold on;
plot(2,44.1,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.125,46.8,'Marker','.','Color','#00BFFF','Markersize',50);
hold on;
plot(2.25,51.1,'Marker','.','Color','#7B68EE','Markersize',50);
hold on
text(0.85,87,'45%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,87,'45.7%','Color',[255 106 106]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('TAS-102 (DCR)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('TAS102_Average_DCR','-dpng','-r600')

end