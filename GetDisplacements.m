function [r_net] = GetDisplacements(C, pos1, pos2)

%% Calculate RMS displacements for all neurons in network.
L = 512; % length of box hard coded cause i am lazy for now
r_net = zeros(length(pos1),1);
count = 1;
for i = 1:length(C),
    for j = 1:length(C),
            r_net(count) = CalcPeriodicDist(pos1(i,:),pos2(i,:),L) + CalcPeriodicDist(pos1(j,:),pos2(j,:),L);
            count = count + 1;
        end
    end
end