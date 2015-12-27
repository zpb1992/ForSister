function InitConstant()
%INITGLOBAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    global gCon;
    gCon.pi=3.1416;
    gCon.earthR=6378000;
    gCon.g0=9.80665;
    gCon.uE=3.986e14;
    gCon.wE=2*gCon.pi/(24*36000);
    gCon.vC=7900;
    gCon.den0=1.2258;
    gCon.h=7254.26188;  % �ܶȸ߶�: ������ܶ�
    gCon.vSound=295.188;
    
    gCon.parD=20;       % 2*parD+1 ���� ���� �ն�ʱ��
    gCon.swarmN=50;     % ���Ӹ���
    gCon.scopeCon=[-80*gCon.pi/180 80*gCon.pi/180;      %��һ�У�����
                10*gCon.pi/180 20*gCon.pi/180];         %�ڶ��У�����
    gCon.scopeTime=[1000 3000];                         %�ն�ʱ��
    
    gCon.constraintMax=[1000000     %�����ܶ�
                       500000       %��ѹ
                       6];          %����
    gCon.loopMax=100;   % ѭ������
    
    gCon.flightWeight=907.2;    
    gCon.flightR=0.1;   %���ʰ뾶
    gCon.flightS=0.4839;
    
    gCon.stateD=40;     % ״̬��γ��
    gCon.stateN=6;      % 6��״̬
    
    gCon.finalState=[20000+gCon.earthR;     %�ն�����
        232/180*gCon.pi;
        37/180*gCon.pi;
        1000;
        0;
        0];
    gCon.finalFlag=[1;1;1;1;0;0];           %�Ƿ���Ҫ�����ն����� ��Ӧ6��״̬��
    gCon.finalWeights=[0.4438;              % �ն�Ȩ��
        0.4438;
        0.4438;
        0.4438;
        0.4438;
        0.4438];
    
    % �����ܶ� ��ѹ ���� ��������Ȩ��
    gCon.pathWeights=[0.2488; 
        0.2488;
        0.2488;
        0.0394];
    % ���ǡ����� �ı仯�ʣ�Ȩ��
    gCon.controlWeights=[0.0762;
        0.0762];
    % �����ǡ������Ǳ仯��: Ȩ��
    gCon.trackWeights=[0.0762;
        0.0762];
end

