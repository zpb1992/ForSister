function  InitVar()
%INITVAR �˴���ʾ�йش˺�����ժҪ
%   �����м���Ҫ��������������ṹ����
    % curLoop�� ��ǰѭ���Ĵ���
    % state�� ��ǰ��������·����״̬ 6*stateD
    
    global gCon;
    global gVar;
    %gVar.curLoop=0;
    gVar.state=zeros(gCon.stateN,gCon.stateD);
    gVar.state(1,1)=gCon.earthR+100000;
    gVar.state(2,1)=160/180*gCon.pi;
    gVar.state(3,1)=25/168*gCon.pi;
    gVar.state(4,1)=7200;
    gVar.state(5,1)=-2.0/180*gCon.pi;
    gVar.state(6,1)=58/180*gCon.pi;
    
end

