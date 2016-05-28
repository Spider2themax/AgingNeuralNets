function [TRAIN, TEST] = PlotError()

TRAIN = zeros(101,10);
TEST = zeros(101,10);
for i = 1:10,
    
    x = sprintf('ERRORS%d',i);
    load(x);
    TRAIN(:,i) = ERRORS(:,1);
    TEST(:,i) = ERRORS(:,2);
end
hold on
x = linspace(0,100,101);
errorbar(x, mean(TRAIN'), std(TRAIN'),'b')
errorbar(x, mean(TEST'), std(TEST'),'r')
