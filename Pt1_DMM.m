%newobjs = instrfind
%fclose( newobjs)
s = serial('COM1');
fopen(s)
inspect(s)
fprintf(s,'SYST:REM')
fprintf(s,'*rst')
pause(1)
%fprintf(s,'CONFigure:VOLTage:DC')
%fprintf(s,'CONFigure:CURRent:AC')
%fprintf(s,'CONFigure:RESistance')
%fprintf(s,'MEASure:VOLTage:DC?')
%fprintf(s,'MEASure:CURRent:AC?')
fprintf(s,'MEASure:RESistance?')
pause(1)
%fprintf(s,'VOLTage?')
%DMM_Volts = fscanf(s)
ohm_out = fscanf(s)
%AMPS_out = fscanf(s)
%for x=0:900000000,end
%fprintf(s,'current')
%fprintf(s,'resistance')
fclose(s);
delete(s)
clear s
%newobjs = instrfind
%fclose( newobjs)
