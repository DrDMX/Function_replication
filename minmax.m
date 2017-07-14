%функция нахождение максимума ошибки аппроксимации на промежутке a,b
function u=minmax(f,a,b)
step=(b-a)/100;
x=a:step:b;
for i=1:length(x)
err(i)=abs(feval(f,x(i))-f2(f,a,b,x(i)));
end
u=max(err);
end