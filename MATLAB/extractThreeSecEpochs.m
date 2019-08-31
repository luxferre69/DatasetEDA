function [edaThreeSecEpochs, edaThreeSecEpochsTimes] = extractThreeSecEpochs(edaFileName, name)

% It read the EDA and annotated data, and puts it into a variable
edaData_An = csvread(edaFileName);
[edaDataNumRows, ~] = size(edaData_An);
numEpochs = edaDataNumRows - 11;
edaThreeSecEpochs = zeros(numEpochs,12);
edaThreeSecEpochsTimes = zeros(numEpochs,12);

% Window size: 3 second (12 samples)
slidingWindowU = 1;
slidingWindowB = 12;
for numWindow = 1:numEpochs
    valuesWindow = edaData_An(slidingWindowU:slidingWindowB, 1);
    % Traspose window values and insert them into result matrix
    windowAux = valuesWindow(:,1)';
    edaThreeSecEpochs(numWindow,:)= windowAux;
    % Insert in times matrix the times corresponding to each data
    edaThreeSecEpochsTimes(numWindow,:)= edaData_An(slidingWindowU:slidingWindowB, 2)';
    % Window overlap: 75 per cent | Window size: 3 sec (12 samples)
    slidingWindowU = slidingWindowU + 1;
    slidingWindowB = slidingWindowB + 1;
end

csvwrite(cat(2, name,'threeSecEpochs.csv'), edaThreeSecEpochs);
%csvwrite(cat(2, name,'threeSecEpochsTimes.csv'), edaThreeSecEpochsTimes);

end