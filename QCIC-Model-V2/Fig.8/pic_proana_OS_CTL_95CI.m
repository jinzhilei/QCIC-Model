function pic_proana_OS_CTL_95CI()

CI=40;
T=366;
t=1:1:T;
t_month=t./30;
Matrix_low_CI=zeros(T,CI);
Matrix_high_CI=zeros(T,CI);

for i=1:CI

    [Ave_low,Ave_high]=proana_OS_CTL();
    Matrix_low_CI(:,i)=Ave_low;
    Matrix_high_CI(:,i)=Ave_high;

end

A=sort(Matrix_low_CI,2);
B=sort(Matrix_high_CI,2);

Matrix_low_CI_95=A(:,2:1:39);
Matrix_high_CI_95=B(:,2:1:39);

Ave_A=mean(Matrix_low_CI_95,2);
Ave_B=mean(Matrix_high_CI_95,2);

Ave_A_max=max(Matrix_low_CI_95,[],2);
Ave_B_max=max(Matrix_high_CI_95,[],2);

Ave_A_min=min(Matrix_low_CI_95,[],2);
Ave_B_min=min(Matrix_high_CI_95,[],2);

X=[t_month fliplr(t_month )]';
YA=cat(1,Ave_A_min,flipud(Ave_A_max));
YB=cat(1,Ave_B_min,flipud(Ave_B_max));

% ans=[Ave_A(end) Ave_B(end) Ave_B(end)-Ave_A(end)]

figure(1)

plot(t_month,Ave_B,'--','color','#BA55D3','linewidth',2);
hold on 
fill(X,YB,[186 85 211]./255,'EdgeColor',[186 85 211]./255,'LineStyle','--','FaceAlpha',0.2);
hold on
plot(t_month,Ave_A,'-','color','#A020F0','linewidth',2);
hold on
fill(X,YA,[160 32 240]./255,'EdgeColor',[160 32 240]./255,'LineStyle','-.','FaceAlpha',0.2);


%% Output image setting

set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
xlabel('Time (months)');
ylabel('Overall survival (%)');
title('CD8+ CTL');
legend('CTL high','95% CI','CTL low','95% CI','location','east');
legend('boxoff')
set(gcf,'unit','centimeters','position',[37 3.5 18 13])
print('CTL_OS','-dpng','-r600')

end