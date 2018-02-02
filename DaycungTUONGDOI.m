function[ nghiem ] = DaycungTUONGDOI(fun,a,b,e)
%Danh gia bang SAI SO TUONG DOI
syms x;
format long;
df=symfun(diff(fun,x),x);
dfmin=fminbnd(@(x) df(x),a,b);
dfmax=fminbnd(@(x)-df(x),a,b);

d2f=symfun(diff(fun,x,2),x);
d2fmin=fminbnd(@(x) d2f(x),a,b);
d2fmax=fminbnd(@(x) -d2f(x),a,b);
if dfmin*dfmax<0
    disp('Ham f(x) da nhap khong thoa man dieu kien hoi tu df>0');
    return
end
%Chon x0,d sao cho: f(x0)*f''(x0)>0
df2=diff(df,x);
if feval(fun,a)*fevel(df2,x)>0
    x0=a;
    d=b;
else
    x0=b;
    d=a;
end
%Tinh toan
nghiem=x0-(d-x0)*(feval(fun,d)*feval(fun,x0))/(feval(fun,x0));
while abs(nghiem-x0)>e
    nghiem=x0-(d-x0)*(feval(fun,d)*feval(fun,x0))/(feval(fun,x0));
    x0=nghiem;
end
end