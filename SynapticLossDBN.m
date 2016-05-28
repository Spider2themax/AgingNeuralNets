function bbdbn = SynapticLossDBN(bbdbn, loss)

%% Calculate synaptic losses.
loss1 = (rand(784, 800) > (loss/100));
loss2 = (rand(800, 800) > (loss/100));
loss3 = (rand(800, 10) > (loss/100));

%% Apply to RBMs.
bbdbn.rbm{1}.W = bbdbn.rbm{1}.W .* loss1;
bbdbn.rbm{2}.W = bbdbn.rbm{2}.W .* loss2;
bbdbn.rbm{3}.W = bbdbn.rbm{3}.W .* loss3;