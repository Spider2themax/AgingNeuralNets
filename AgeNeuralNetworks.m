function [ERRORS_1, ERRORS_2, ERRORS_3] = AgeNeuralNetworks(num)

%{
    This function will take in a num (between 1 and 10) and load a trained
    deep belief network (DBN).  This DBN will then be aged according to
    three different methods:

    1.  Losses result probabilistically as a result of combined displacements of connected neurons 
    2.  Losses result probabilistically as a result of synaptic strength (weaker connections more likely to be lost)
    3.  Losses result from random choices

    Max Henderson
    Last modified : 5/23/16
%}

%% Load data.
[TrainImages, TrainLabels, TestImages, TestLabels] = mnistread();
x = sprintf('DBN%d', num);
load(x)
saved_bbdbn = bbdbn;

%% Age network according to method 1.
ERRORS_1 = zeros(9,3);
basedir = '/data2/L/Brain/max/Paper3Data/Data/';
dirs = {'k_xy0.005k_z0.005', 'k_xy0.015k_z0.015',  'k_xy0.01k_z0.01', ...
    'k_xy0.02k_z0.02', 'k_xy0.03k_z0.03', 'k_xy0.05k_z0.05', ...
    'k_xy0.1k_z0.1', 'k_xy0.2k_z0.2', 'k_xy0.5k_z0.5'};
for i = 1:length(dirs),
    current_dir = strcat(basedir,dirs{i});
    bbdbn = SynapticLossDBN1(saved_bbdbn, current_dir);
    ERRORS_1(i,1) = CalcErrorRate(bbdbn, TrainImages, TrainLabels);
    ERRORS_1(i,2) = CalcErrorRate(bbdbn, TestImages, TestLabels);
    ERRORS_1(i,3) = CalculateSynapticLoss(bbdbn);
end
% Save results.
if num == 1,
    x = sprintf('ERRORS_1_1');
else
    x = sprintf('ERRORS_1_%d', num);
end
save(x, 'ERRORS_1')

%% Age network according to method 2.
ERRORS_2 = zeros(101,2);
load lossdata
lossdata = data;
for i = 0 : 101,
    i
    bbdbn = SynapticLossDBN2(saved_bbdbn, i, lossdata);
    ERRORS_2(i+1,1) = CalcErrorRate(bbdbn, TrainImages, TrainLabels);
    ERRORS_2(i+1,2) = CalcErrorRate(bbdbn, TestImages, TestLabels);
    ERRORS_2(i+1,3) = CalculateSynapticLoss(bbdbn);
end
% Save results.
if num == 1,
    x = sprintf('ERRORS_2_1');
else
    x = sprintf('ERRORS_2_%d', num);
end
save(x, 'ERRORS_2')

%% Age network according to method 3.
ERRORS_3 = zeros(101,2);
for i = 0 : 101,
    i
    bbdbn = SynapticLossDBN3(saved_bbdbn, i);
    ERRORS_3(i+1,1) = CalcErrorRate(bbdbn, TrainImages, TrainLabels);
    ERRORS_3(i+1,2) = CalcErrorRate(bbdbn, TestImages, TestLabels);
    ERRORS_1(i+1,3) = CalculateSynapticLoss(bbdbn);
end
% Save results.
if num == 1,
    x = sprintf('ERRORS_3_1');
else
    x = sprintf('ERRORS_3_%d', num);
end
save(x, 'ERRORS_3')