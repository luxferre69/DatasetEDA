function edaDataAnnotated = saveAnnotatedData(edaFileName, timeFileName, seizuresFileName, outName)

    edaData = csvread(edaFileName);
    timeData = csvread(timeFileName);
    seizuresData = csvread(seizuresFileName);
    edaDataAnnotated = cat(2,edaData, timeData, seizuresData);
    csvwrite(outName, edaDataAnnotated);

end