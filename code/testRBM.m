function [ error ] = testRBM(nHid, learning_rate, batch_size, nepochs, ...
    momentum, decay_weight)
 
    load('caltech101_silhouettes_28_split1');
    run('medal/startLearning.m');
    
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
            'verbose', 0, ...
            'momentum', momentum, ...
            'wPenalty', decay_weight};
    
    % INITIALIZE RBM
    r = rbm(arch);

    % TRAIN THE RBM
    r = r.train(train_data,single(train_labels));

    [~,error,~] = r.classify(test_data, single(test_labels));

    fprintf('Error: %f%%\n', 100*error);
    
    quit
end

