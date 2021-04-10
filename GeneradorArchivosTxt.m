%% Generador de archivos txt
% Autor : Jose Daniel Rosas Avila
% Contacto : daniel_pumas_59@hotmail.com
% Programa para generar los archivos txt, a partir de archivos con formato
% estandar ASCII (ASA 2.0) del Instituto de Ingenieria de la UNAM

%% Limpiamos el Workspace
clc;clear;close all;
%% Se agregan las rutas necesarias
addpath("Funciones");

%% Generamos los archivos 
% Los archivos pueden estar dentro de la carpeta raiz o ponerse en alguna
% carpeta dentro de esta
% Nota: en caso de estar dentro de una carpeta, debera agregarse la ruta
% incluyendo el codigo:
% 
%   addpath("NombreDeLaCarpeta");
% 
% Dentro de la funcion txt() debera incluirse el nombre del
% archivo a leer entre comillas, y la ubicacion de las componentes NS,EW y
% V en ese orden dentro del archivo con formato ASA 2.0, esta informacion
% se checa en la linea 37. A continuacipn se musetra un ejemplo
%
%   txt("ArchivoDelAcelerograma",1,3,2)
%
% Los archivos se guardan dentro de una carpeta llamada txt la cual se crea
% en caso de no existir

txt("CS66201709191 Sup",1,3,2);


