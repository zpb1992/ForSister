function Main( )
%MAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Init();
    
    global gCon;
    for i=1:1:gCon.loopMax
        i
        OneStep(i);
    end
   
    Finish();
    
end

