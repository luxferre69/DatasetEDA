
patients = {'heidy', 'jhoan', 'laura', 'marian', 'nicolas'};

saveDataAn_patients(patients)

dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE scl_mean NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE scl_correlation NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE scr_mean NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE scr_std NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_slope NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_greater_v NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_difference NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_mean NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_variance NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_skewness NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE eda_kurtosis NUMERIC', '-append', 'delimiter','');
dlmwrite('Dataset/edaFeaturesDataSet.csv','@ATTRIBUTE class {0,1}', '-append', 'delimiter','', 'roffset', 1);
dlmwrite('Dataset/edaFeaturesDataSet.csv','@DATA', '-append', 'delimiter','', 'roffset', 1);

filepath = 'Dataset/features/';
files = dir(strcat(filepath,'*.csv'));
filecontents = cell(numel(files), 1);

for fileid = 1:numel(files)
   filecontents{fileid} = csvread(fullfile(filepath, files(fileid).name));
end
content = cat(1, filecontents{:});
%csvwrite('Dataset/edaFeaturesDataSet.csv', content); 
dlmwrite('Dataset/edaFeaturesDataSet.csv','', '-append', 'delimiter','', 'roffset', 1);
dlmwrite('Dataset/edaFeaturesDataSet.csv', content, '-append');

