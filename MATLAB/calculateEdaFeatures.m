% EDA features in 1 sec epochs:
% 1. Slope of the straight by least-squares fit
% 2. Number of values grater than previous one
% 3. Difference between epoch last and first values

% EDA features in 3 sec epochs:
% 4. mean
% 5. variance
% 6. skewness
% 7. kurtosis

function edaFeatures = calculateEdaFeatures(dataFileNameEDA, oneSecEpochsTimesFileName)

edaData = csvread(dataFileNameEDA);
timesOneSecEpData = csvread(oneSecEpochsTimesFileName);
dataSize = size(edaData);
dataSize = dataSize(1);
% Columns: 7 features and 1 label
edaFeatures = zeros(dataSize,8);

for epoch = 1:dataSize
    oneSecEpoch = edaData(epoch,13:16);
    oneSecEpochTimes = timesOneSecEpData(epoch,:);
    threeSecEpoch = edaData(epoch,1:12);
    
    % ONE-SEC EPOCHS FEATURES
    
    % Feature 1: Slope of the straight by least-squares fit
    % Calculate the least-squares of the epoch and extract m (c = [m,b]) (y = mx + b)
    c = polyfit(oneSecEpochTimes, oneSecEpoch, 1);
    edaFeatures(epoch,1) = c(1);
    
    % Feature 2: Number of values greater than previous one
    numValuesGreater = 0;
    for i=2:4
        if oneSecEpoch(i) > oneSecEpoch(i-1)
            numValuesGreater = numValuesGreater + 1;
        end
    end
    edaFeatures(epoch,2) = numValuesGreater;
    
    % Feature 3: Difference between last and first values
    edaFeatures(epoch,3) = oneSecEpoch(4) - oneSecEpoch(1);
    
    % THREE-SEC EPOCHS FEATURES
    
    % Feature 4: Mean
    edaFeatures(epoch,4) = mean(threeSecEpoch);
    
    % Feature 5: Variance
    edaFeatures(epoch,5) = var(threeSecEpoch);
    
    % Feature 6: Skewness
    edaFeatures(epoch,6) = skewness(threeSecEpoch);
    
    % Feature 7: Kurtosis
    edaFeatures(epoch,7) = kurtosis(threeSecEpoch);
    
    % Insert the epoch label
    edaFeatures(epoch,8) = edaData(epoch,17);
end

end