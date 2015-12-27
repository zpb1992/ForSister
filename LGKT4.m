function [ ] = LGKT4( x,finalTime )
%LGKT4 Summary of this function goes here
%   Detailed explanation goes here
% ���΢�ַ��̣� ���ĳ�����ӵ����������е�״̬
    % x�� �Ա��� 2*gCon.parD ��ǰ���ӵ��������Ǻ͹���
    % t�� �ն�ʱ��
    % y�� ��ʼ���� ��gVar.state��ȫ�ֱ����и�����������ȥ��
    % ����ֵ�� ״̬���� gCon.stateN*gCon.stateD  ��gVar.state��ȫ�ֱ����и���
    
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

