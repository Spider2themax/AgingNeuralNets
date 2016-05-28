function [] = PlotFeatures(bbdbn)

a = zeros(1,800);
for x = 1 : 800,
    a(x) = 1;
    V1 = h2v( bbdbn.rbm{1},  a);
    createfigure(reshape(V1,28,28))
    drawnow
    pause(0.2)
    close
    a(x)=0;
end