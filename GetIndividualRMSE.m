function RMSE = GetIndividualRMSE(bbdbn, TrainImages, TrainLabels)

RMSE = zeros(60000,1);
for i = 1 : 60000,
    
    out = v2h( bbdbn, TrainImages(i,:) );
    err = power( TrainLabels(i,:) - out, 2 );
    rmse = sqrt( sum(err(:)) / numel(err) );
    RMSE(i) = rmse;
    
end