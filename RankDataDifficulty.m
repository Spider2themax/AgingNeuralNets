function [RMSE] = RankDataDifficulty()

[TrainImages, TrainLabels] = mnistread();
RMSE = zeros(60000, 10);
for i = 1 : 10,
    i
    x = sprintf('DBN%d.mat',i);
    load(x)
    RMSE(:,i) = GetIndividualRMSE(bbdbn, TrainImages, TrainLabels);
    
end