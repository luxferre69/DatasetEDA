function patienteDataSet = createPatienteFeaturesDS (sclScrFeatures, edaFeatures)

[sizeEdaF, colsEdaF] = size(edaFeatures);
[sizeSclScrF,colsSclScrF] = size(sclScrFeatures);

if sizeEdaF <= sizeSclScrF
    rows = sizeEdaF;
else
    rows = sizeSclScrF;
end

patienteDataSet = cat(2, sclScrFeatures(1:rows,:), edaFeatures(1:rows,:));

end