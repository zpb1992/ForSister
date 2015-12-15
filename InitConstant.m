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
    gCon.h=7254.26188;
    gCon.vSound=295.188;
    
    gCon.parD=20;       % 2*parD+1 倾侧角 攻角 终端时间
    gCon.swarmN=50;
    gCon.scopeCon=[-80*gCon.pi/180 80*gCon.pi/180;      %第一行：倾侧角
                10*gCon.pi/180 20*gCon.pi/180];         %第二行：攻角
    gCon.scopeTime=[1000 3000];
    
    gCon.constraintMax=[1000000     %热流密度
                       500000       %动压
                       6];          %过载
    gCon.loopMax=500;
    
    gCon.flightWeight=907.2;
    gCon.flightR=0.1;   %曲率半径
    gCon.flightS=0.4839;
    
    gCon.stateD=40;
end

