function pic_proana_OS_Th1_95CI()

CI=40;
T=366;
t=1:1:T;
t_month=t./30;
Matrix_low_CI=zeros(T,CI);
Matrix_high_CI=zeros(T,CI);

for i=1:CI

    [Ave_low,Ave_high]=proana_OS_Th1();
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

plot(t_month,Ave_B,'--','color','#FA8072','linewidth',2);
hold on 
fill(X,YB,[255 0 0]./255,'EdgeColor',[255 0 0]./255,'LineStyle','--','FaceAlpha',0.2);
hold on
plot(t_month,Ave_A,'-','color','#FF0000','linewidth',2);
hold on
fill(X,YA,[250 128 114]./255,'EdgeColor',[250 128 114]./255,'LineStyle','-.','FaceAlpha',0.2);

%% Output image setting

set(gca,'XLim',[0 12]);
set(gca,'YLim',[0 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',20);
set(gca,'FontName','Arial');
xlabel('Time (months)');
ylabel('Overall survival (%)');
title('CD4+ Th1');
legend('Th1 high','95% CI','Th1 low','95% CI','location','east');
legend('boxoff')
set(gcf,'unit','centimeters','position',[37 3.5 18 13])
print('Th1_OS','-dpng','-r600')

end