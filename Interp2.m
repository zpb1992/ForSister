function [ title,attack ] = Interp2( x,t )
%INTERP Summary of this function goes here
%   Detailed explanation goes here
    % x�� ����� ���Ʊ��� 2*gCon.parD
    % t�� �Ա��� ʱ��
    % title�� ��ֵʱ�������
    % attack�� ��ֵʱ��Ĺ���
    
    global gCon;
    for i=1:1:(gCon.parD-1)
        if t>=(i-1)/(gCon.parD-1)&&t<=i/(gCon.parD-1)
            title=-(x(1,i+1)-x(1,i))*(gCon.parD-1)*((i+1)/(gCon.parD-1)-t)+x(1,i+1);
			attack=-(x(2,i+1)-x(2,i))*(gCon.parD-1)*((i+1)/(gCon.parD-1)-t)+x(2,i+1);
        end
    end
end

