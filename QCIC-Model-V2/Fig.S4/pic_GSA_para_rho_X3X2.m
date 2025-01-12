function pic_GSA_para_rho_X3X2()

file_1 = './Data_GSA_para/rho_X3X2_GSA.mat';
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

text(0.365,80,'DCR','FontSize',26,'color','#000000');
text(0.365,20,'PD','FontSize',26,'color','#000000');

%% Output image setting

set(gca,'XLim',[a b]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Pressure  mutation rate of DRTC to DPTC{\bf (\rho_{X3X2})} ');
ylabel('RECIST (%)');
set(gcf,'unit','centimeters','position',[4 20 18 10])
print('rho_X3X2_GSA','-dpng','-r600')

end