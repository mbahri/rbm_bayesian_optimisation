load('caltech101_silhouettes_28_split1');
run('medal/startLearning.m');

% The parameters are from S5

nHid = 983
learning_rate = 0.09867863720310953
nepochs = 188
batch_size = 87
momentum = 0.3595338313047923
decay_weight = 0.0032118183957211485

[~,nVis] = size(train_data);

% DEFINE A MODEL ARCHITECTURE
arch = struct('size', [nVis,nHid], 'classifier',true, 'inputType','binary');

% GLOBAL OPTIONS
arch.opts = {'verbose', 1, ...
     'lRate', learning_rate, ...
    'nEpoch', nepochs, ...
    'batchSz', batch_size, ...
    'beginAnneal', 10, ...
    'nGibbs', 1, ...
    'varyEta',7, ...
    'displayEvery', 20, ...
    'verbose', 1, ...
    'momentum', momentum, ...
    'wPenalty', decay_weight};

% INITIALIZE RBM
r = rbm(arch);

% TRAIN THE RBM
r = r.train(train_data,single(train_labels));

% IMPORTANT: The parameters were found by using the data labeled
% "test_data" as the validation set. The actual training set is "val_data".
[~,error,~] = r.classify(val_data, single(val_labels));

fprintf('Error: %f%%\n', 100*error);