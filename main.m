clear all
clc
h='f1';
a=0;
b=1;
%parameters: function,left bound, right boud, req_eps
tic;
x=BalancedErrorBoundaries(h,a,b,0.001); 
t1=toc;%����� ���������� ����������� ���������, ����������� �������, ��
%����������� ������ �����������
tic;
x2=ErrorBoundaries(h,0,1,0.001,0.001);
t2=toc; %����� ���������� ��������� � ������ �������� ��������� ��������� �����������
%���������� �������� ���������
step=(b-a)/100;
m=a:step:b;
%�������� ����������� ������������ ��� ���������� [a,b]
for i=1:length(m)
    y1(i)=f1(m(i));
end
maxi1=max(y1);
mini1=min(y1);
hold on
plot(m,y1)
%���������� ������������ ��������� �� ������
for i=2:(length(x)-1)
    line([x(i) x(i)], [mini1 maxi1]); 
end
hold off
%������� ������������ ��������� ��� ������� ���������
coeffic=GetApprCoef(h,x);
