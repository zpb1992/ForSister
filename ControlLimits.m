function [ dTitle,dAttack ] = ControlLimits( title,attack,finalTime )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % dTitle�� ƽ�����ǵı仯��
    % dAttack�� ƽ�����Ǳ仯��
   
    global gCon;
    titleTemp=0; attackTemp=0;
    for i=2:1:gCon.parD
        titleTemp=titleTemp+abs(title(1,i)-title(1,i-1));
        attackTemp=attackTemp+abs(attack(1,i)-attack(1,i-1));
    end
    dTitle=titleTemp/finalTime;
    dAttack=attackTemp/finalTime;
end

