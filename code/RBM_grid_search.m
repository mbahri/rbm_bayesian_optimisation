
% Find parameters using grid search on a small hyperparameter space

clear;

load('caltech101_silhouettes_28_split1');
run('medal/startLearning.m');

[~,nVis] = size(train_data);

for nHid=[100,100]
    for learning_rate=[0.01, 0.1]
        for batch_size=[100,250]
            for nepochs=[100,250]
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
                    'verbose', 1};

                % INITIALIZE RBM
                r = rbm(arch);

                % TRAIN THE RBM
                r = r.train(train_data,single(train_labels));

                [~,error,~] = r.classify(test_data, single(test_labels));

                disp([nHid, learning_rate, batch_size, nepochs]);
                fprintf('Error: %f%%\n\n', 100*error);
            end
        end
    end
end