function [loss] = GetLossConstants(p, lossdata)

%{
    This is a method to remove synapses (connections) from the DBN
    according to the rule:
    2.  Losses result probabilistically as a result of synaptic strength (weaker connections more likely to be lost)
    
    To ensure that on average we only have a certain percent p of synapses
    from each layer of the DBN, we have to figure out the loss constant from each
    individual layer.

    Max Henderson
    Last modified : 5/28/16
%}

loss = zeros(3,1);
for i = 1 : length(lossdata),
    if lossdata(i,2) < p && loss(1) == 0,
        loss(1) = lossdata(i,1);
    end
    if lossdata(i,3) < p && loss(2) == 0,
        loss(2) = lossdata(i,1);
    end
    if lossdata(i,4) < p && loss(3) == 0,
        loss(3) = lossdata(i,1);
    end
end