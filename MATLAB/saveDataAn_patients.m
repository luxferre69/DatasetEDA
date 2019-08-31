function saveDataAn_patients(patients)

   getAnnotatedData();

    %-----------------------------------------------------------------------------%
    function getAnnotatedData()

        for k = 1:length(patients)
            patient = patients(k);
            
            edaData = buildPath(patient, strcat(patient, 'DataEDA.csv'), 0);
            tonicData = buildPath(patient, strcat(patient, 'TonicData.csv'), 0);
            phasicData = buildPath(patient, strcat(patient, 'PhasicData.csv'), 0);
            
            seizTimes = buildPath(patient, strcat(patient, 'Times.csv'), 0);
            seizures = buildPath(patient, strcat(patient, 'Seizures.csv'), 0);
 
            outputEdaData = buildPath(patient, strcat(patient, 'DataEDA_An.csv'), 1);
            outputTonicData = buildPath(patient, strcat(patient, 'TonicData_An.csv'), 1);
            outputPhasicData = buildPath(patient, strcat(patient, 'PhasicData_An.csv'), 1);

            saveAnnotatedData(edaData, seizTimes, seizures, outputEdaData);
            saveAnnotatedData(tonicData, seizTimes, seizures, outputTonicData);
            saveAnnotatedData(phasicData, seizTimes, seizures, outputPhasicData);
            
            extractEpochsEDA_patient(outputEdaData, outputTonicData, outputPhasicData, patient);
            buildFeaturesDS(patient);
            
        end
    end
    
    %-----------------------------------------------------------------------------%
    function extractEpochsEDA_patient(outputEdaData, outputTonicData, outputPhasicData, patient)
        
        patientEDA = buildPath(patient, strcat(patient, 'EDA'), 1);
        patientSCL = buildPath(patient, strcat(patient, 'SCL'), 1);
        patientSCR = buildPath(patient, strcat(patient, 'SCR'), 1);
        
        [oneSecEp, ~] = extractOneSecEpochs(outputEdaData, patientEDA);
        [threeSecEp, ~] = extractThreeSecEpochs(outputEdaData, patientEDA);
        concatEpochsEDA(threeSecEp,oneSecEp, patientEDA);
        
        extractOneSecEpochs(outputTonicData, patientSCL);
        extractOneSecEpochs(outputPhasicData, patientSCR);
        
    end

    %-----------------------------------------------------------------------------%
    function featuresDS = buildFeaturesDS(patient)
        
        sclScrFeatures = calculateSclScrFeatures(buildPath(patient, strcat(patient, 'SCLOneSecEpochs.csv'),1), buildPath(patient, strcat(patient, 'SCROneSecEpochs.csv'),1), buildPath(patient, strcat(patient, 'EDAOneSecEpochsTimes.csv'),1));        
        edaFeatures = calculateEdaFeatures(buildPath(patient, strcat(patient, 'EDACompleteEpochs.csv'),1), buildPath(patient, strcat(patient, 'EDAOneSecEpochsTimes.csv'),1));
        featuresDS = createPatienteFeaturesDS(sclScrFeatures, edaFeatures);
        p = char(strcat(patient, 'FeaturesDS.csv'));
        csvwrite(fullfile('Dataset/features', p), featuresDS);
        
    end
    
    %-----------------------------------------------------------------------------%
    function path = buildPath(patient, file, cond)
        
        folder = 'Dataset';
        subdir = 'usrDataEDA';
        
        if(cond == 1)
            path = char(fullfile(folder, patient, subdir, file));
        else
            path = char(fullfile(folder, patient, file)); 
        end
    end

end

