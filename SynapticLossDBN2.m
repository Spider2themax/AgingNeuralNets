function bbdbn = SynapticLossDBN2(bbdbn, p, lossdata)

%{
    This is a method to remove synapses (connections) from the DBN
    according to the rule:
    2.  Losses result probabilistically as a result of synaptic strength (weaker connections more likely to be lost)

    Max Henderson
    Last modified : 5/23/16
%}

%% Determine parameters to ensure a uniform loss across each layer of DBN.
p = 1 - p/100;
[loss] = GetLossConstants(p, lossdata);

%% Calculate synaptic losses.
loss1 = (loss(1)*rand(784, 800) < abs(bbdbn.rbm{1}.W));
loss2 = (loss(2)*rand(800, 800) < abs(bbdbn.rbm{2}.W));
loss3 = (loss(3)*rand(800,  10) < abs(bbdbn.rbm{3}.W));

%% Apply to RBMs.
bbdbn.rbm{1}.W = bbdbn.rbm{1}.W .* loss1;
bbdbn.rbm{2}.W = bbdbn.rbm{2}.W .* loss2;
bbdbn.rbm{3}.W = bbdbn.rbm{3}.W .* loss3;