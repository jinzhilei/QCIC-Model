
%% Load data
file_Para='./VP/Parameter.mat';
A=cell2mat(struct2cell(load(file_Para)));
file_Out='./VP/Outcome.mat';
B=cell2mat(struct2cell(load(file_Out)));
Data = readtable('PCC.xlsx');
PCC = table2array(Data(:,2));

%% Plot par.beta_X2(order=390)
figure(1)
order = 390;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$\beta_{X_2}$, $P$=',num2str(PCC(1))),'Interpreter','latex');
legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('beta_X2','-dpng','-r600');

%% Plot par.beta_X1(order=389)
figure(2)
order = 389;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$\beta_{X_1}$, $P$=',num2str(PCC(2))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('beta_X1','-dpng','-r600');

%% Plot par.V_C(order=62)
figure(3)
order = 62;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$V_C$, $P$=',num2str(PCC(3))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('V_C','-dpng','-r600');

%% Plot par.K2(order=398)
figure(4)
order = 398;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$K_2$, $P$=',num2str(PCC(4))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('K_2','-dpng','-r600');

%% Plot par.eta_X2T8(order=402)
figure(5)
order = 402;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$\eta_{X_2T_8}$, $P$=',num2str(PCC(401))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('eta_X2T8','-dpng','-r600');

%% Plot par.V_T8_BC(order=35)
figure(6)
order = 35;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$V_{T_8}^{BC}$, $P$=',num2str(PCC(402))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('V_T8_BC','-dpng','-r600');

%% Plot par.d_X1(order=391)
figure(7)
order = 391;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$d_{X_1}$, $P$=',num2str(PCC(403))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('d_X1','-dpng','-r600');

%% Plot par.d_X2(order=392)
figure(8)
order = 392;
[p,S] = polyfit(A(order,:),B,1);
[y_fit,~] = polyval(p,A(order,:),S);
scatter(A(order,:),B,15,'MarkerEdgeColor',[43,93,248]./255,'MarkerFaceColor',[6,40,144]./255,'LineWidth',1.5);
hold on
plot(A(order,:),y_fit,'Color',[247 17 22]./255,'LineWidth',3);
box on

% Output image setting
set(gca,'FontSize',18);
set(gca,'FontName','Arial');
title(strcat('$d_{X_2}$, $P$=',num2str(PCC(404))),'Interpreter','latex');
% legend('Data','Linear Fit','Location','NorthWest');
set(gcf,'unit','centimeters','position',[3 3 8 8]);
print('d_X2','-dpng','-r600');