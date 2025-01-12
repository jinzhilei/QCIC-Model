function pic_bar_TASBEV_Yoshida_2021()

y_Yoshida_2021=[0 0;3 6.2;61 59.4;36 34.4;3 6.2;64 65.6];

b=bar(y_Yoshida_2021,0.8,'FaceAlpha',0.7);

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
m1=[0 3 61 36 3 64];
m2=[0 6.2 59.4 34.4 6.2 65.6];
plot(t1,m1,'-.or','LineWidth',1,'Color',[190 190 190]./255,'MarkerSize',10,'MarkerEdgeColor',[190 190 190]./255,'MarkerFaceColor',[190 190 190]./255);
hold on
plot(t2,m2,'-.or','LineWidth',1,'Color','#32CD32','MarkerSize',10,'MarkerEdgeColor','#32CD32','MarkerFaceColor','#32CD32');


set(b(1),'FaceColor',[190 190 190]./255);
set(b(2),'FaceColor','#32CD32');

%% Output image setting
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'CR' 'PR' 'SD' 'PD' 'ORR' 'DCR'});
set(gca,'Linewidth',1);
set(gca,'FontSize',28);
set(gca,'FontName','Arial');
ylabel('RECITS (%)');
title('Yoshida.2021');
legend('model simulation','clinical data','Location','northwest','FontSize',28);
legend('boxoff');
set(gcf,'unit','centimeters','position',[2 25 28 18])
print('TASBEV_Yoshida_2021','-dpng','-r600')

end