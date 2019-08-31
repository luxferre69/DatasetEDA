function completeEpochsEDA = concatEpochsEDA(threeSecEp,oneSecEp,name)

[sizeThreeSecData, colsThree] = size(threeSecEp);
[sizeOneSecData,colsOne] = size(oneSecEp);

if sizeThreeSecData <= sizeOneSecData
    rows = sizeThreeSecData;
else
    rows = sizeOneSecData;
end

completeEpochsEDA = cat(2, threeSecEp(1:rows,:), oneSecEp(1:rows,:));
csvwrite(cat(2, name,'CompleteEpochs.csv'), completeEpochsEDA);

end