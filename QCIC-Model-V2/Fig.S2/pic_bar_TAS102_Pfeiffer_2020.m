function pic_bar_TAS102_Pfeiffer_2020()

y_Pfeiffer_2020=[0 0;1 0;44 51.1;55 48.9;1 0;45 51.1];

b=bar(y_Pfeiffer_2020,0.8,'FaceAlpha',0.7);

xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22)

xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22)

hold on
t1=[0.85 1.85 2.85 3.85 4.85 5.85];
t2=[1.15 2.15 3.15 4.15 5.15 6.15];
m1=[0 1 44 55 1 45];
m2=[0 0 51.1 48.9 0 51.1];
plot(t1,m1,'-.or','LineWidth',1,'Color',[190 190 190]./255,'MarkerSize',10,'MarkerEdgeColor',[190 190 190]./255,'MarkerFaceColor',[190 190 190]./255);
hold on
plot(t2,m2,'-.or','LineWidth',1,'Color','#7B68EE','MarkerSize',10,'MarkerEdgeColor','#7B68EE','MarkerFaceColor','#7B68EE');


set(b(1),'FaceColor',[190 190 190]./255);
set(b(2),'FaceColor','#7B68EE');

%% Output image setting
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'CR' 'PR' 'SD' 'PD' 'ORR' 'DCR'});
set(gca,'Linewidth',1);
set(gca,'FontSize',28);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('Pfeiffer.2020');
legend('model simulation','clinical data','Location','northwest','FontSize',28);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 25 28 18])
print('TAS102_Pfeiffer_2020','-dpng','-r600')

end