%функци€ разбиени€ интервалов апроксимации дл€ достижени€ заданной ошибки на всем
%отрезке, учитывающ€€ возможность обратных колебаний промежутков

function [ u ] = ErrorBoundaries(f,a,b,req_err,ulp)
x1=a;
x2=b;
m=2;
u(1)=a;
flag=0;
check_x2=0;
x2_pr=a;
osc=0;
while (~flag)
    error=minmax(f,x1,x2)
    if (error <= req_err*0.6)
        if (x2==b)
            u(m)=x2;
            flag=1;
        else
            if (osc)
                u(m)=x2;
                x2_pr=x2;
                x1=x2;
                x2=b;
                m=m+1;
                osc=0;
            else
               x2_ch=abs(x2-x2_pr)/2;
               x2_pr=x2;
               if(x2_ch>ulp)
                   x2=x2+x2_ch;
               else
                   x2=x2+ulp;
               end
            end
        end
    else
        x2_ch=abs(x2-x2_pr)/2;
        x2_pr=x2;
        if (x2_ch>ulp)
            x2=x2-x2_ch;
        else
            x2=x2-ulp;
            if(check_x2==x2)
                osc=1;
            else
                check_x2=x2;
            end
        end
    end
end
    
end

