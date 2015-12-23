function [ Cl,Cd ] = ClCdFunc( attack,speed )
%CLCDFUNC Summary of this function goes here
%   Detailed explanation goes here
    % attack: ��ǰ�Ĺ���
    % speed����ǰ�ٶ�
    % Cl������ϵ��
    % Cd������ϵ��
    
    global gCon;
	Cl=2.9451*attack+0.2949*exp(-0.00033943*speed/gCon.vSound)-0.2355;
	Cd=2.3795*attack*attack+0.3983*exp(-0.0010794*speed/gCon.vSound)+0.0234;
end

