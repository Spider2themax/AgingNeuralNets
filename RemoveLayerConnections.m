function [C] = RemoveLayerConnections(C, pos1, pos2)

L = 512; % length of box hard coded cause i am lazy for now

%% Remove connections using linear loss function.
c = 0.0625;
for i = 1:length(pos1),
    for j = 1:length(pos2),
        r_net = CalcPeriodicDist(pos1(i,1:3),pos1(i,4:6),L) + CalcPeriodicDist(pos2(j,1:3),pos2(j,4:6),L);
        p_loss = c*r_net; % probability syn is lost
        if rand(1,1) < p_loss,
            C(i,j) = 0;
        end
    end
end