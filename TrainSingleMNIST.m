function bbdbn = TrainSingleMNIST(TrainImages, TrainLabels, bbdbn)

if isempty(bbdbn),
    nodes = [784 800 800 10]; % just example!
    bbdbn = randDBN( nodes, 'BBDBN' );
end
nrbm = numel(bbdbn.rbm);

opts.MaxIter = 10;
opts.BatchSize = 100;
opts.Verbose = true;
opts.StepRatio = 0.1;
opts.object = 'CrossEntropy';

opts.Layer = nrbm-1;
bbdbn = pretrainDBN(bbdbn, TrainImages, opts);
bbdbn= SetLinearMapping(bbdbn, TrainImages, TrainLabels);

opts.Layer = 0;
bbdbn = trainDBN(bbdbn, TrainImages, TrainLabels, opts);