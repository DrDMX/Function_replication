%значение аппроксимирующей функции второго порядка, найденной по МНК, в точке z
function [ u ] = f2(f,a,b,z)
step=(b-a)/10;
x=a:step:b;
u=0;
for i=1:length(x)
    y(i)=feval(f,x(i));
end
p=polyfit(x,y,2);
u=z^2*p(1)+z*p(2)+p(3);
end

