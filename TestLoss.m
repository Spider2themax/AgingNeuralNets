function [data] = TestLoss(bbdbn)

N = 2000;
x = linspace(0,2,N);
data = zeros(N,3);
for i = 1 : N,
    i
    result = SynapticLossDBN2(bbdbn, x(i));
    data(i,1) = x(i);
    data(i,2) = sum(sum(abs(result.rbm{1}.W)>0))/(784*800);
    data(i,3) = sum(sum(abs(result.rbm{2}.W)>0))/(800*800);
    data(i,4) = sum(sum(abs(result.rbm{3}.W)>0))/(800*10);
end