function syn_loss = CalculateSynapticLoss(bbdbn)

%{
    This function will return the percentage of synaptic loss for a
    particular DBN after the DBN has been put through an aging algorithm.

    Max Henderson
    Last modified : 6/5/16
%}

top = sum(sum(bbdbn.rbm{1}.W ~= 0)) + sum(sum(bbdbn.rbm{2}.W ~= 0)) + sum(sum(bbdbn.rbm{3}.W ~= 0));
bottom = 784*800 + 800*800 + 800*10;
syn_loss = top/bottom;
