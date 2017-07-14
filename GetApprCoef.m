%Получить коэффициенты аппроксимации для заданных промежутков и функции
function [ u ] = GetApprCoef(f,x)

for i=1:(length(x)-1)
    step=(x(i+1)-x(i))/100;
    nn=x(i):step:x(i+1);
for j=1:length(nn)
    y(j)=feval(f,nn(j));
end
p=polyfit(nn,y,2);
for k=1:length(p)
    u(i,k)=p(k);
end
end

end

