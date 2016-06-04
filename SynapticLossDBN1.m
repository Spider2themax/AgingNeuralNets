function bbdbn = SynapticLossDBN1(bbdbn, current_dir)

%{
    This is a method to remove synapses (connections) from the DBN
    according to the rule:
    1.  Losses result probabilistically as a result of combined displacements of connected neurons 

    Max Henderson
    Last modified : 5/23/16
%}

%% Load example young and old positions file.
x = sprintf('%s/PosYoung1.txt', current_dir);
pos1 = load(x);
x = sprintf('%s/PosOld1.txt', current_dir);
pos2 = load(x);
order = randperm(length(pos1)); % Random order of neurons; taking samples from the displacement distribution
pos_layer1 = [pos1(order(1:784),:) pos2(order(1:784),:)];
pos_layer2 = [pos1(order(785:1584),:) pos2(order(785:1584),:)];
pos_layer3 = [pos1(order(1585:2384),:) pos2(order(1585:2384),:)];
pos_layer4 = [pos1(order(2385:2394),:) pos2(order(2385:2394),:)];

%% Apply to RBMs.
bbdbn.rbm{1}.W = RemovePerturbedConnections(bbdbn.rbm{1}.W, pos_layer1, pos_layer2);
bbdbn.rbm{2}.W = RemovePerturbedConnections(bbdbn.rbm{2}.W, pos_layer2, pos_layer3);
bbdbn.rbm{3}.W = RemovePerturbedConnections(bbdbn.rbm{3}.W, pos_layer3, pos_layer4);