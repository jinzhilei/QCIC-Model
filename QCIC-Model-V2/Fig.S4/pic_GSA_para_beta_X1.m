function pic_GSA_para_beta_X1()

file_1 = './Data_GSA_para/beta_X1_GSA.mat';
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

text(0.057,80,'DCR','FontSize',26,'color','#000000');
text(0.057,20,'PD','FontSize',26,'color','#000000');

%% Output image setting

set(gca,'XLim',[a b]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Proliferation rate of DSTC {\bf (\beta_{X1})} ');
ylabel('RECIST (%)');
set(gcf,'unit','centimeters','position',[4 20 18 10])
print('beta_X1_GSA','-dpng','-r600')

end