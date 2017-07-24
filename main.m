clear all
clc
h='f1';
a=0+0.0001;
b=1;
%parameters: function,left bound, right boud, req_eps
% tic;
% x=BalancedErrorBoundaries(h,a,b,0.0001); 
% t1=toc;%¬рем€ выполнени€ упрощенного алгоритма, работающего быстрее, но
% %выдел€ющего больше промежутков
x2=ErrorBoundaries(h,a,b,0.0001,0.0001);
 %¬рем€ выполнени€ алгоритма с учЄтом обратных колебаний изменени€ промежутков
%построение графиков разбиени€
step=(b-a)/100;
m=a:step:b;
%просмотр построенной апроксимации дл€ промежутка [a,b]
for i=1:length(m)
    y1(i)=f1(m(i));
end
maxi1=max(y1);
mini1=min(y1);
hold on
plot(m,y1,'r')
%добавление промежуатков разбиени€ на график
for i=2:(length(x2)-1)
    line([x2(i) x2(i)], [mini1 maxi1]); 
end
hold off
% %получим коеффициенты разбиени€ дл€ каждого интервала
% coeffic=GetApprCoef(h,x);
coeffic1=GetApprCoef(h,x2);
% minmaxbound(h,x,coeffic)
rr=rand(1,30000000)*pi/2;

% minmaxbound(h,x2,coeffic1)