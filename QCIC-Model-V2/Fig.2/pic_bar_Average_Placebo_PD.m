function pic_bar_Average_Placebo_PD()

y_PD=[85;84.5];
b = bar(y_PD,0.8,'FaceAlpha',0.7);
b.FaceColor = 'flat';
b.CData(1,:) = [190 190 190]./255;
b.CData(2,:) = [30 144 255]./255;
hold on

plot(0.15:0.05:2.85,85.*ones(1,55),'--','Color',[54 54 54]./255)
hold on 
plot(1.75,86,'Marker','.','Color','#FF0000','Markersize',50);
hold on;
plot(2,83.6,'Marker','.','Color','#FFA500','Markersize',50);
hold on;
plot(2.25,85.4,'Marker','.','Color','#00CED1','Markersize',50);
hold on;
text(0.85,92,'85%','Color',[190 190 190]./255,'FontSize',25)
hold on
text(1.8,92,'84.5%','Color',[30 144 255]./255,'FontSize',25)

%% Output image setting
set(gca,'XLim',[0.15 2.85]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'simulation data' 'clinical data'});
set(gca,'Linewidth',1);
set(gca,'FontSize',22);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('Placebo (PD)');
set(gcf,'unit','centimeters','position',[2 25 18 10])
print('Placebo_Average_PD','-dpng','-r600')

end