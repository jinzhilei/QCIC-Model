function pic_volume_VP()

sample = 100; 

global par
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
par.T = 4e8;

Response=zeros(7,sample);
label1=0;label2=0;label3=0;
average1=zeros(7,sample);average2=zeros(7,sample);average3=zeros(7,sample);

figure(1)

for i=1:sample

    file=['./VP/','VP',num2str(i),'.mat'];
    A=cell2mat(struct2cell(load(file)));
    % calculation of volume and diameter
    T = A(1:56:end,32)+A(1:56:end,33)+A(1:56:end,34);
    X = length(T);
    V_before = ( par.V_tumor * par.T * par.V_C ) / par.V_E;
    V_after  = ( par.V_tumor .* T .* par.V_C ) / par.V_E;
    V = V_after / V_before - 1;
    Response(:,i)=V;
    % Drawing a map of changes in tumor diameter
    VX = 1:1:X;
    plot(VX,zeros(1,7),'--','color','#808080','LineWidth',2);
    hold on
    if V(2)>=0.2
        plot(VX,V,'color','#f20c00');
        label1 = label1 +1;
        average1(:,i)=V;
        hold on
    elseif V(2)>=-0.3 && V(2)<0.2
        plot(VX,V,'color','#ffcc00');
        label2 = label2 +1;
        average2(:,i)=V;
        hold on
    else
        plot(VX,V,'color','#66ccff');
        label3 = label3 +1;
        average3(:,i)=V;
        hold on
    end

end

    Y1=sum(average1,2)./label1;
    Y2=sum(average2,2)./label2;
    Y3=sum(average3,2)./label3;
    hold on
    plot(VX,Y1,'color','#f20c00','LineWidth',4);
    hold on
    plot(VX,Y1,'.', 'MarkerSize', 30,'color','#f20c00');
    hold on 
    plot(VX,Y2,'color','#ffcc00','LineWidth',4);
    hold on 
    plot(VX,Y2,'.', 'MarkerSize', 30,'color','#ffcc00');
    hold on 
    plot(VX,Y3,'color','#66ccff','LineWidth',4);
    hold on 
    plot(VX,Y3,'.', 'MarkerSize', 30,'color','#66ccff');
    hold on 

edges = [-inf -0.8 -0.3 0.2 inf];
N = histcounts(Response(2,:),edges);
CR = N(1)./sample
PR = N(2)./sample
SD = N(3)./sample
PD = N(4)./sample

%% Output image setting
set(gca,'XLim',[1 7]);
set(gca,'YLim',[-1 1]);
set(gca,'XTickLabel', linspace(0,336,7));
set(gca,'YTickLabel', [-100 -50 0 50 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',21);
set(gca,'FontName','Arial');
xlabel('Time (day)');
ylabel('Percentage change of tumor (%)');
title('TAS-102');
set(gcf,'unit','centimeters','position',[10 10 20 15])
print('picture/TAS102_TumorSize','-dpng','-r600')


figure(2)

Volume_TAS102 = Response(2,:);
Volume_TAS102_Sort = sort(Volume_TAS102,2,'descend');
bar(Volume_TAS102_Sort,'FaceColor','#0099ff');

hold on 
plot(linspace(0,110,111),linspace(0.2,0.2,111),'--','color','#808080','LineWidth',2);
hold on 
plot(linspace(0,110,111),linspace(-0.3,-0.3,111),'--','color','#808080','LineWidth',2);
hold on
plot(linspace(55.5,55.5,100),linspace(-1,1,100),'--','color','#0033ff','LineWidth',2);

text(100,-0.60,'CR/PR','FontSize',20);
text(103,-0.15,'SD','FontSize',20);
text(103,0.50,'PD','FontSize',20);

text(31.5,0.6,'DCR of clinical data:','FontSize',20,'color',[190 190 190]./255);
text(56.5,0.6,'45.7%','FontSize',20,'color',[190 190 190]./255);

text(26,0.8,'DCR of model prediction:','FontSize',20,'color',[255 106 106]./255);
text(56.5,0.8,'45%','FontSize',20,'color',[255 106 106]./255);

%% Output image setting
set(gca,'XLim',[0 110]);
set(gca,'YLim',[-1 1]);
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel', [-100 -50 0 50 100]);
set(gca,'Linewidth',1);
set(gca,'FontSize',21);
set(gca,'FontName','Arial');
ylabel('Change from baseline tumor (%)');
title('TAS-102');
set(gcf,'unit','centimeters','position',[10 10 40 15])
print('picture/TAS102_Bar','-dpng','-r600')

end