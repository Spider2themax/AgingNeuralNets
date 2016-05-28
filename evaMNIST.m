function [] = evaMNIST(num)

addpath('..');

mnistfiles = 0;
if( exist('t10k-images-idx3-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('t10k-labels-idx1-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('train-images-idx3-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('train-labels-idx1-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end

if( mnistfiles < 4 )
    warning('Can not find mnist data files. Please download four data files from http://yann.lecun.com/exdb/mnist/ . Unzip and copy them to same folder as testMNIST.m');
    return;
end

[TrainImages TrainLabels TestImages TestLabels] = mnistread();

x = sprintf('DBN%d', num);
load(x)
saved_bbdbn = bbdbn;

ERRORS = zeros(101,2);
for i = 0 : 101,
    i
    bbdbn = SynapticLossDBN(saved_bbdbn, i);
    rmse= CalcRmse(bbdbn, TrainImages, TrainLabels);
    ERRORS(i+1,1) = CalcErrorRate(bbdbn, TrainImages, TrainLabels);
    rmse= CalcRmse(bbdbn, TestImages, TestLabels);
    ERRORS(i+1,1) = CalcErrorRate(bbdbn, TestImages, TestLabels);
end

%% Save results.
x = sprintf('ERRORS%d', num);
save(x, 'ERRORS')