function [nghiem]=TieptuyenTUONGDOI(fun,a,b,e)
syms x;
%Kiem tra dieu kien hoi tu: f', f'' giu nguyen dau
df=symfun(diff(fun,x),x);
dfmin=fminbnd(@(x) df(x),a,b);
dfmax=fminbnd(@(x)-df(x),a,b);

d2f=symfun(diff(fun,x,2),x);
d2fmin=fminbnd(@(x) d2f(x),a,b);
d2fmax=fminbnd(@(x) -d2f(x),a,b);

if (dfmin*dfmax<=0 && d2fmin*d2fmax<=0)
    fprintf('Khong thoa man dieu kien hoi tu');
    return
end
%Tinh toan
xn=a;
nghiem=xn-(feval(fun,xn))/(feval(df,xn));
while abs(xn-nghiem)>e
    xn=nghiem;
    nghiem=xn-(feval(fun,xn))/(feval(df,xn));
end
nghiem=vpa(nghiem);
end