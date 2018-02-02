function [c] = Chiadoi(fun,a,b,e)
%Tinh toan theo SAI SO TUONG DOI
%fun: ham f(x)=0. Nhap duoi dang @(x), VD: @(x) x^2-1
%a,b: khoang phan ly
%e: sai so mong muon
format long
c=0;
while abs(c-(a+b)/2)>e
    c=(a+b)/2;
    if feval(fun,a)*feval(fun,c)<0
        b=c;
    else a=c;
    end
end
end


