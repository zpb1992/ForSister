function Main( )
%MAIN 此处显示有关此函数的摘要
%   此处显示详细说明
    Init();
    
    global gCon;
    for i=1:1:gCon.loopMax
        i
        OneStep(i);
    end
   
    Finish();
    
end

