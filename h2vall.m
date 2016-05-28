% h2v: to transform from hidden (output) variables to visible (input) variables
%
% V = h2v(dnn, H)
%
%
%Output parameters:
% V: visible (input) variables, where # of row is number of data and # of col is # of visible (input) nodes
%
%
%Input parameters:
% dnn: the Deep Neural Network model (dbn, rbm)
% H: hidden (output) variables, where # of row is number of data and # of col is # of hidden (output) nodes
%
%
%Example:
% datanum = 1024;
% outputnum = 16;
% inputnum = 4;
%
% outputdata = rand(datanum, outputnum);
%
% dnn = randRBM( inputnum, outputnum );
% inputdata = h2v( dnn, outputdata );
%
%
%Version: 20130727

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Vall = h2vall(dnn, H)

if( isequal(dnn.type, 'BBRBM') )
  Vall = sigmoid( bsxfun(@plus, H * dnn.W', dnn.c ) );

elseif( isequal(dnn.type, 'GBRBM') )
    h = bsxfun(@times, H * dnn.W', dnn.sig);
    Vall = bsxfun(@plus, h, dnn.c );

elseif( isequal(dnn.type(3:5), 'DBN') )
    nrbm = numel( dnn.rbm );
    Vall = cell(nrbm,1);
    V0 = H;
    for i=nrbm:-1:1
        i
        V1 = h2v( dnn.rbm{i}, V0 );
        size(V1)
        V0 = V1;
        Vall{i} = V1;
    end
    
end
