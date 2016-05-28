function bbdbn = SynapticLossDBN2_old(bbdbn, c)

%{
    This is a method to remove synapses (connections) from the DBN
    according to the rule:
    2.  Losses result probabilistically as a result of synaptic strength (weaker connections more likely to be lost)

    Max Henderson
    Last modified : 5/23/16
%}

%% Calculate synaptic losses.
% First RBM...
a  = abs(reshape(bbdbn.rbm{1}.W, 784*800,1));
% Method 2...
loss1 = (c*rand(784, 800) < abs(bbdbn.rbm{1}.W));
sum(sum(loss1))/length(a)

[N,M] = size(bbdbn.rbm{1}.W); 
for i = 1 : N,
    for j = 1 : M,
        if ~(abs(bbdbn.rbm{1}.W(i,j)) > rand(1,1)*c),
            bbdbn.rbm{1}.W(i,j) = 0;
        end
    end
end
sum(sum(bbdbn.rbm{1}.W~=0))/length(a)

% Method 2...
loss1 = (c*rand(784, 800) < abs(bbdbn.rbm{1}.W));
sum(sum(loss1))/length(a)