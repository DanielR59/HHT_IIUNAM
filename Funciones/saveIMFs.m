function [] = saveIMFs(imf,archivo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[~,column] = size(imf);
 IMF = single(zeros(size(imf{1},2),size(imf,2)));
 for i = 1:column
     IMF(:,i) = single(imf{i});
 end

 IMF = array2table(IMF);

 
 newArchivo =  archivo(1:end-4);

 if ~exist('ArchivosIMF','dir')
    mkdir ArchivosIMF
 end

 writetable(IMF,strcat(pwd,'\ArchivosIMF',newArchivo,'IMFS.txt'),'Delimiter','\t');

end

