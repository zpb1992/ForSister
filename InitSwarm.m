function InitSwarm()
%INITSWARM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    global gCon;    %Usage
    
    global swarm;
    
    tempSwarm1=rand(gCon.swarmN,gCon.parD); %���
    tempSwarm2=rand(gCon.swarmN,gCon.parD); %����
    tempSwarmTime=rand(gCon.swarmN,1);      %ʱ��
    
    tempSwarm1=tempSwarm1*(gCon.scope(1,2)-gCon.scope(1,1))+gCon.scope(1,1);
    tempSwarm2=tempSwarm2*(gCon.scope(2,2)-gCon.scope(2,1))+gCon.scope(2,1);
    tempSwarmTime=tempSwarmTime*(gCon.scopeTime(2)-gCon.scopeTime(1))+gCon.scopeTime(1);
    
    swarm=[tempSwarm1 tempSwarm2 tempSwarmTime];
end

