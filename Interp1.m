function [ result ] = Interp1( x,t )
%INTERP Summary of this function goes here
%   Detailed explanation goes here
    % x�� ����� ���Ʊ��� 1*gCon.parD
    % t�� �Ա��� ʱ��
    % result�� ���ǻ������ǰ�
    
    global gCon;
    for i=1:1:(gCon.parD-1)
        if t>=(i-1)/(gCon.parD-1)&&t<=i/(gCon.parD-1)
            result=-(x(1,i+1)-x(1,i))*(gCon.parD-1)*((i+1)/(gCon.parD-1)-t)+x(1,i+1);
        end
    end
end
