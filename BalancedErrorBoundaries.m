function u=BalancedErrorBoundaries(f,a,b,req_err)
x1=0;
x2=1;
flag=1;
m=2;
u(1)=a;
prev_x2=a;

while (flag)
    err=minmax(f,x1,x2);
    if (err<=req_err) %если достигнутая ошибка аппроксимации меньше, чем требуемая
        if (b<=x2)
           u(m)=x2;
           flag=0;
        else
           u(m)=x2;
           m=m+1;
           prev_x2=x2;
           x1=x2;
           x2=b;        
        end
    else
        change_x2=abs(x2 - prev_x2)/2;
        prev_x2=x2;
        x2=x2-change_x2;
    end     
end