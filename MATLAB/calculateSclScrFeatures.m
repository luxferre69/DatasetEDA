% SCL features (1 sec epochs):
% 8. SCL epoch mean
% 9. Correlation coefficient between time and SCL data per epoch
%
% SCR features (1 sec epochs):
% 10. SCR epoch mean
% 11. SCR epoch standard deviation

function sclScrFeatures = calculateSclScrFeatures(dataFileNameSCL, dataFileNameSCR, oneSecEpochsTimesFileName)

sclData = csvread(dataFileNameSCL);
scrData = csvread(dataFileNameSCR);
timesOneSecEpData = csvread(oneSecEpochsTimesFileName);

dataSize = size(sclData);
dataSize = dataSize(1);
% Columns: 4 features
sclScrFeatures = zeros(dataSize,4);

for epoch = 1:dataSize
    sclOneSecEpoch = sclData(epoch,1:4);
    scrOneSecEpoch = scrData(epoch,1:4);
    oneSecEpochTimes = timesOneSecEpData(epoch,:);
    
    % Feature 8: SCL epoch mean
    sclScrFeatures(epoch,1) = mean(sclOneSecEpoch);
    
    % Feature 9: Correlation coefficient between time and SCL data per epoch
    correlation = corrcoef(oneSecEpochTimes, sclOneSecEpoch);
    if isnan(correlation(2))
       sclScrFeatures(epoch,2) = 0;
    else
        sclScrFeatures(epoch,2) = correlation(2);
    end    
    
    % Feature 10: SCR epoch mean
    sclScrFeatures(epoch,3) = mean(scrOneSecEpoch);
    
    % Feature 11: SCR epoch standard deviation
    sclScrFeatures(epoch,4) = std(scrOneSecEpoch);
end

end