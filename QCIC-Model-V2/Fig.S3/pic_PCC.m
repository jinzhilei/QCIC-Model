
%% Data input
Data = readtable('PCC.xlsx');
Log_basic = table2array(Data(:,2));
% Log_data = zeros(404,1);
% for i = 1:404
%     if Log_basic(i) > 0
%         Log_data(i) = -log(Log_basic(i));
%     else
%         Log_data(i) = log(-Log_basic(i));
%     end
% end

% Plot picture
barh(Log_basic,'FaceColor',[43,93,248]./255);
% barh(Log_data,'FaceColor',[6,40,144]./255);

%% Output image setting
% set(gca, 'XScale', 'log');
set(gca,'yticklabel',[])
set(gca,'Linewidth',1);
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
xlabel('Pilson correlation coefficient');
ylabel('Parameter arrangement');
title('Global sensitivity analysis');
set(gcf,'unit','centimeters','position',[10 10 12 50])
print('GSA','-dpng','-r600')