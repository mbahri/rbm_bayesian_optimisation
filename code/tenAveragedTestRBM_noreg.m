function [ errors, mean_error ] = tenAveragedTestRBM(nHid, learning_rate, batch_size, nepochs)

    N = 10;

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
            'verbose', 0};
        
    errors = zeros(1,N);
    
    logfile = fopen(sprintf('logfile_%i_%f_%i_%i_noreg.txt', nHid,...
        learning_rate, batch_size, nepochs), 'w');
    fprintf(logfile, '%i; %f; %i; %i; NOREG\n', nHid,...
        learning_rate, batch_size, nepochs);
    for k=1:N
        disp(k);
    
        % INITIALIZE RBM
        r = rbm(arch);

        % TRAIN THE RBM
        r = r.train(train_data,single(train_labels));

        [~,errors(k),~] = r.classify(val_data, single(val_labels));
        fprintf(logfile, '%f;\n', 100*errors(k));
    end
    fclose(logfile);
    
    mean_error = mean(errors);
    fprintf('Mean error: %f%%\n', mean_error)
end

