function [ ] = LGKT4( x,finalTime )
%LGKT4 Summary of this function goes here
%   Detailed explanation goes here
% 求解微分方程： 求出某个粒子的整个过程中的状态
    % x： 自变量 2*gCon.parD 当前粒子的所有倾侧角和攻角
    % t： 终端时间
    % y： 初始条件 在gVar.state的全局变量中给出（所以略去）
    % 返回值： 状态变量 gCon.stateN*gCon.stateD  在gVar.state的全局变量中给出
    
    global gCon;
    global gVar;
    
    d=1/(gCon.stateD-1);
    for i=1:1:gCon.stateD-1
        [titleTemp,attackTemp]=Interp2(x,(i-1)*d);
        k1=DiffFunc(titleTemp,attackTemp,gVar.state(:,i));
        [titleTemp,attackTemp]=Interp2(x,(i-1)*d+d/2);
        k2=DiffFunc(titleTemp,attackTemp,gVar.state(:,i));
        [titleTemp,attackTemp]=Interp2(x,(i-1)*d+d/2);
        k3=DiffFunc(titleTemp,attackTemp,gVar.state(:,i));
        [titleTemp,attackTemp]=Interp2(x,i*d);
        k4=DiffFunc(titleTemp,attackTemp,gVar.state(:,i));
        
        for j=1:1:gCon.stateN
            gVar.state(j,i+1)=gVar.state(j,i)+finalTime*d*(k1(j)+2*k2(j)+2*k3(j)+k4(j))/6;
        end
    end
    if gVar.curParN<gCon.swarmN
        gVar.curParN=gVar.curParN+1;
    else
        gVar.curParN=1;
    end
end

