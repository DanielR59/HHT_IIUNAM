function [] = txt(archivo,NS,EW,V)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funcion que genera archivos txt de cada componente del acelerograma
%Para archivos de formato 2.0. Formato estándar del Instituto de Ingeniería
%José Daniel Rosas Avila
%Facultad de Ingeniería
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Variables de entrada
%archivo                                 Nombre del archivo 
%NS,EW,V           Canal en el que se encuentran dentro del archivo (1-3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejemplo
%txt('C1669510091 12M.091',1,3,2)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist('txt','dir')
    mkdir txt
end
Datos=dlmread(archivo,'',109,0);
NS=Datos(:,NS);
EW=Datos(:,EW);
V=Datos(:,V);

dlmwrite(strcat(pwd,'\txt\',archivo,"NS.txt"),NS)
dlmwrite(strcat(pwd,'\txt\',archivo,"EW.txt"),EW)
dlmwrite(strcat(pwd,'\txt\',archivo,"V.txt"),V)

end