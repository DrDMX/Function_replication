%Нахождение ошибки аппроксимации для заданной функции, границ и
%коэффициентов уравнения второго порядка

function u=minmaxbound(f,bound,coef)
a=min(bound);
b=max(bound);
step=(b-a)/1000000;
x=a:step:b;
j=1;
i=1;
flag=true;
interval_count=length(bound)-1;
coef_count=length(coef);

if (interval_count~=coef_count)
    u='Несоответствие данных';
else
            while(flag)
                if (i==1000000)
                    flag=false;
                else
                    
                    if (x(i)<=bound(j+1))
                        m=(x(i))^2*coef(j,1)+x(i)*coef(j,2)+coef(j,3);
                        err(i)=abs(feval(f,x(i))-m);
                        i=i+1;
                    else
                        j=j+1;
                    end
                end
            end
    u=max(err);
    end

end