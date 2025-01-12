function pic_GSA_para_K_TN8()

file_1 = './Data_GSA_para/K_TN8_GSA.mat';
P1 = cell2mat(struct2cell(load(file_1)));
Top=100.*ones(5,1);
a=min(P1(:,1));b=max(P1(:,1));

area(P1(:,1),Top)
hold on
area(P1(:,1),P1(:,2).*100,'LineStyle',':')
hold on
scatter(P1(:,1),100.*P1(:,2),150,'MarkerEdgeColor',[0.35 0 0.35],'MarkerFaceColor',[0.75 0 0.75],'LineWidth',2)

newcolors = [255 99 71; 255 215 0]/255;
colororder(newcolors)

text(8.7e7,80,'DCR','FontSize',26,'color','#000000');
text(8.7e7,20,'PD','FontSize',26,'color','#000000');

%% Output image setting

set(gca,'XLim',[a b]);
set(gca,'YLim',[0 100]);
set(gca,'XTickLabel',{'5.5\times10^{7}','6\times10^{7}','6.5\times10^{7}','7\times10^{7}','7.5\times10^{7}','8\times10^{7}'});
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Carrying capacity of naive CD8+T cell {\bf (K_{TN8})} ');
ylabel('RECIST (%)');
set(gcf,'unit','centimeters','position',[4 20 18 10])
print('K_TN8_GSA','-dpng','-r600')

end