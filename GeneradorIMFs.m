%% Generador de IMFs
% Autor : Jose Daniel Rosas Avila
% Contacto : daniel_pumas_59@hotmail.com
% Programa para calcular funciones IMF a partir de archivos txt mediante el
% uso de las funciones del HHT_GUI
% 
%% %% Limpiamos el Workspace
clc;clear;close all;
%% Se agregan las rutas necesarias
addpath("Funciones","Funciones_IIUNAM","txt");

%% Cargamos los datos de un archivo txt
archivo = 'CS66201709191 SupV.txt'; %Archivo de ejemplo
x = load(archivo);

%% Se empieza el proceso de descomposicion para generar las IMFs
% La funcion emd() recibe dos parametros, el primero deben ser los datos a
% procesar y el segundo es un parametro fijo de valor 0.1.
% Posteriormente a esto se guardan las funciones en un archivo del mismo
% nombre que el de entrada agregandose IMFS al final de este.

 imf = emd(x,0.1);
 saveIMFs(imf,archivo);
 
 
  
 