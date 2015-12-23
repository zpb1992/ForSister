function [ result ] = Interp1( x,t )
%INTERP Summary of this function goes here
%   Detailed explanation goes here
    % x： 因变量 控制变量 1*gCon.parD
    % t： 自变量 时间
    % result： 攻角或者倾侧角吧
    
    global gCon;
    for i=1:1:(gCon.parD-1)
        if t>=(i-1)/(gCon.parD-1)&&t<=i/(gCon.parD-1)
            result=-(x(1,i+1)-x(1,i))*(gCon.parD-1)*((i+1)/(gCon.parD-1)-t)+x(1,i+1);
        end
    end
end
