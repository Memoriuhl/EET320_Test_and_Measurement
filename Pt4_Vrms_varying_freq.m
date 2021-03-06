n=0;
while n<1
    %help instrument
    g = gpib('ni',0,1);   %gpib address of device
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'APPLy:SINusoid 100,3')%generating sin wave and parameters 
    fclose(g)
    
    g = gpib('ni',0,2);%gpib address of device
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'MEASure:FREQuency?')%querying dmm to measure frequency 
    DMM_FreqA = fscanf(g)
    fprintf(g,'MEASure:AC?')%querying dmm to measure RMS
    DMM_RMSA = fscanf(g)
    fclose(g)
    delete(g)
    clear g
    
    f = gpib('ni',0,3);%gpib address of device
    fopen(f)
    f.status
    inspect(f)
    fprintf(f,':AUTO')%enabling auto scale for scope
    pause(7)
    fprintf(f,':MEASure:FREQuency?')%querying scope to measure frequency
    Oscope_FreqA = fscanf(f)
    fprintf(f,':MEASure:VRMS?')%querying scope to measure frequency
    Oscope_RMSA = fscanf(f)
    fclose(f)
    delete(f)
    clear g
    
    pause(5)
    
    g = gpib('ni',0,1);
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'APPLy:SINusoid 1000,5')
    fclose(g)
    
    g = gpib('ni',0,2);
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'MEASure:FREQuency?')
    DMM_FreqB = fscanf(g)
    fprintf(g,'MEASure:AC?')
    DMM_RMSB = fscanf(g)
    fclose(g)
    delete(g)
    clear g
    
    f = gpib('ni',0,3);
    fopen(f)
    f.status
    inspect(f)
    fprintf(f,':AUTO')
    pause(4)
    fprintf(f,':MEASure:FREQuency?')
    Oscope_FreqB = fscanf(f)
    fprintf(f,':MEASure:VRMS?')
    Oscope_RMSB = fscanf(f)
    fclose(f)
    delete(f)
    clear f
    
    pause(10)
    
    g = gpib('ni',0,1);
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'APPLy:SINusoid 500,1')
    fclose(g)
    
    g = gpib('ni',0,2);
    fopen(g)
    g.status
    inspect(g)
    fprintf(g,'MEASure:FREQuency?')
    DMM_FreqC = fscanf(g)
    fprintf(g,'MEASure:AC?')
    DMM_RMSC = fscanf(g)
    fclose(g)
    delete(g)
    clear g
    
    f = gpib('ni',0,3);
    fopen(f)
    f.status
    inspect(f)
    fprintf(f,':AUTO')
    pause(4)
    fprintf(f,':MEASure:FREQuency?')
    Oscope_FreqC = fscanf(f)
    fprintf(f,':MEASure:VRMS?')
    Oscope_RMSC = fscanf(f)
    fclose(f)
    delete(f)
    clear f
    
    pause(8)
    
    n = n + 1;
end
