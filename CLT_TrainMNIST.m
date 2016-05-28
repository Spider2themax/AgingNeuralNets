function [control, clt] = CLT_TrainMNIST()

% Load data and related RMSE values.
[TrainImages, TrainLabels, TestImages, TestLabels] = mnistread();
load('RMSE');
b = ReorderRMSE(RMSE);

% Train normal network.
control = struct;
Control_DBN = TrainSingleMNIST(TrainImages(1:20000,:), TrainLabels(1:20000,:),[]);
rmse= CalcRmse(Control_DBN, TestImages, TestLabels);
control.stage1 = Control_DBN;
control.acc1 = rmse
Control_DBN = TrainSingleMNIST(TrainImages(1:40000,:), TrainLabels(1:40000,:),Control_DBN);
rmse= CalcRmse(Control_DBN, TestImages, TestLabels);
control.stage2 = Control_DBN;
control.acc2 = rmse
Control_DBN = TrainSingleMNIST(TrainImages(1:60000,:), TrainLabels(1:60000,:),Control_DBN);
rmse= CalcRmse(Control_DBN, TestImages, TestLabels);
control.stage3 = Control_DBN;
control.acc3 = rmse

% Train CLT network.
clt = struct;
CLT_DBN = TrainSingleMNIST(TrainImages(b(1:20000,1),:), TrainLabels(b(1:20000,1),:),[]);
rmse= CalcRmse(CLT_DBN, TestImages, TestLabels);
clt.stage1 = CLT_DBN;
clt.acc1 = rmse
CLT_DBN = TrainSingleMNIST(TrainImages(b(1:40000,1),:), TrainLabels(b(1:40000,1),:),CLT_DBN);
rmse= CalcRmse(CLT_DBN, TestImages, TestLabels);
clt.stage2 = CLT_DBN;
clt.acc2 = rmse
CLT_DBN = TrainSingleMNIST(TrainImages(b(1:60000,1),:), TrainLabels(b(1:60000,1),:),CLT_DBN);
rmse= CalcRmse(CLT_DBN, TestImages, TestLabels);
clt.stage3 = CLT_DBN;
clt.acc3 = rmse