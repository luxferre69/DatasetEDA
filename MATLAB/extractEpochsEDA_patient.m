%% heidy
[oneSecEp, oneSecEpTimes] = extractOneSecEpochs('heidyDataEDA_An.csv','heidyEDA');
[threeSecEp, threeSecEpTimes] = extractThreeSecEpochs('heidyDataEDA_An.csv','heidyEDA');
concatEpochsEDA(threeSecEp,oneSecEp,'heidyEDA');

extractOneSecEpochs('heidyTonicData_An.csv','heidySCL');
extractOneSecEpochs('heidyPhasicData_An.csv','heidySCR');
%% jhoan
[oneSecEp, oneSecEpTimes] = extractOneSecEpochs('jhoanDataEDA_An.csv','jhoanEDA');
[threeSecEp, threeSecEpTimes] = extractThreeSecEpochs('jhoanDataEDA_An.csv','jhoanEDA');
concatEpochsEDA(threeSecEp,oneSecEp,'jhoanEDA');

extractOneSecEpochs('jhoanTonicData_An.csv','jhoanSCL');
extractOneSecEpochs('jhoanPhasicData_An.csv','jhoanSCR');
%% laura
[oneSecEp, oneSecEpTimes] = extractOneSecEpochs('lauraDataEDA_An.csv','lauraEDA');
[threeSecEp, threeSecEpTimes] = extractThreeSecEpochs('lauraDataEDA_An.csv','lauraEDA');
concatEpochsEDA(threeSecEp,oneSecEp,'lauraEDA');

extractOneSecEpochs('lauraTonicData_An.csv','lauraSCL');
extractOneSecEpochs('lauraPhasicData_An.csv','lauraSCR');
%% marian
[oneSecEp, oneSecEpTimes] = extractOneSecEpochs('marianDataEDA_An.csv','marianEDA');
[threeSecEp, threeSecEpTimes] = extractThreeSecEpochs('marianDataEDA_An.csv','marianEDA');
concatEpochsEDA(threeSecEp,oneSecEp,'marianEDA');

extractOneSecEpochs('marianTonicData_An.csv','marianSCL');
extractOneSecEpochs('marianPhasicData_An.csv','marianSCR');