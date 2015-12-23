function [ result ] = FinalLimits()
%FINALLIMITS Summary of this function goes here
%   Detailed explanation goes here

    global gVar;
    global gCon;
    
    finalState=gVar.state(:,gCon.stateD);
    result=((finalState-gCon.finalState).*gCon.finalFlag)'*gCon.finalWeights;
end

