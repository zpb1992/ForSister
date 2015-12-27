function InitConstant()
%INITGLOBAL 此处显示有关此函数的摘要
%   此处显示详细说明
    global gCon;
    gCon.pi=3.1416;
    gCon.earthR=6378000;
    gCon.g0=9.80665;
    gCon.uE=3.986e14;
    gCon.wE=2*gCon.pi/(24*36000);
    gCon.vC=7900;
    gCon.den0=1.2258;
    gCon.h=7254.26188;  % 密度高度: 求大气密度
    gCon.vSound=295.188;
    
    gCon.parD=20;       % 2*parD+1 倾侧角 攻角 终端时间
    gCon.swarmN=50;     % 粒子个数
    gCon.scopeCon=[-80*gCon.pi/180 80*gCon.pi/180;      %第一行：倾侧角
                10*gCon.pi/180 20*gCon.pi/180];         %第二行：攻角
    gCon.scopeTime=[1000 3000];                         %终端时间
    
    gCon.constraintMax=[1000000     %热流密度
                       500000       %动压
                       6];          %过载
    gCon.loopMax=100;   % 循环次数
    
    gCon.flightWeight=907.2;    
    gCon.flightR=0.1;   %曲率半径
    gCon.flightS=0.4839;
    
    gCon.stateD=40;     % 状态量纬度
    gCon.stateN=6;      % 6个状态
    
    gCon.finalState=[20000+gCon.earthR;     %终端条件
        232/180*gCon.pi;
        37/180*gCon.pi;
        1000;
        0;
        0];
    gCon.finalFlag=[1;1;1;1;0;0];           %是否需要考虑终端条件 对应6个状态量
    gCon.finalWeights=[0.4438;              % 终端权重
        0.4438;
        0.4438;
        0.4438;
        0.4438;
        0.4438];
    
    % 热流密度 动压 过载 总热量：权重
    gCon.pathWeights=[0.2488; 
        0.2488;
        0.2488;
        0.0394];
    % 倾侧角、攻角 的变化率：权重
    gCon.controlWeights=[0.0762;
        0.0762];
    % 航迹角、航迹角变化率: 权重
    gCon.trackWeights=[0.0762;
        0.0762];
end

