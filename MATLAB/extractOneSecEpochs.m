function [edaOneSecEpochs, edaOneSecEpochsTimes] = extractOneSecEpochs(edaFileName, name)

% It read the EDA and annotated data, and puts it into a variable
edaData_An = csvread(edaFileName);
[edaDataNumRows, ~] = size(edaData_An);
numEpochs = edaDataNumRows - 3;
edaOneSecEpochs = zeros(numEpochs,5);
edaOneSecEpochsTimes = zeros(numEpochs,4);

% Window size: 1 second (4 samples)
slidingWindowU = 1;
slidingWindowB = 4;
for numWindow = 1:numEpochs
    valuesWindow = edaData_An(slidingWindowU:slidingWindowB, 1);
    seizuresWindow = logical(edaData_An(slidingWindowU:slidingWindowB, 3));
    % Size [rows, cols] of vector with positions of seizures
    sizeSeizures = size(find(seizuresWindow));
    % Rows size is in first position due to the vector is vertical
    numSeizures = sizeSeizures(1);
    % Traspose window values
    windowAux = valuesWindow(:,1)';
    % Label the epoch as a seizure if at least 3 samples are seizures
    if numSeizures >= 3
        windowAux(5) = 1;
    else
        windowAux(5) = 0;
    end
    % Insert the epoch in epochs matrix
    edaOneSecEpochs(numWindow,:)= windowAux;
    % Insert in times matrix the times corresponding to each data
    edaOneSecEpochsTimes(numWindow,:)= edaData_An(slidingWindowU:slidingWindowB, 2)';
    % Window overlap: 75 per cent | Window size: 1 sec (4 samples)
    slidingWindowU = slidingWindowU + 1;
    slidingWindowB = slidingWindowB + 1;
end

csvwrite(cat(2, name,'OneSecEpochs.csv'), edaOneSecEpochs);
csvwrite(cat(2, name,'OneSecEpochsTimes.csv'), edaOneSecEpochsTimes);

end