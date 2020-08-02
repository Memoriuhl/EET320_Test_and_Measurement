%newobjs = instrfind
%fclose( newobjs)
s = serial('COM1');
fopen(s)
fprintf(s,'SYST:REM')
fprintf(s,'*rst')
fprintf(s,'APPL:SIN 2.0E+3,1.3')
for x=0:900000000,end
fprintf(s,'freq?')
freq_out = fscanf(s)
for x=0:100000000,end
fprintf(s,'volt?')
volt_out = fscanf(s)
fclose(s);
delete(s)
clear s
%newobjs = instrfind
%fclose( newobjs)
