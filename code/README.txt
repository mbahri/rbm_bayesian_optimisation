File TrainAndTest.m trains an RBM with the parameters from S5 (see documentation) and output the prediction error on the test set (data val).

Files tenAveragedTestRBM.m and its noreg counterpart train and test ton RBMs for a given parameter set.

SMAC must be run as follows: ./smac --scenario-file FILE.
An optional parameter --seed allows to distinguish more easily between runs (used for naming the folders in smac-output).

The file rbm.mat contains a pre-trained RBM using the parameters from S5.

A few csv files are provided as evidence of the different experimentations.

Troubleshooting:

SMAC will fail to launch if the path to its script contains spaces.

The MATLAB functions called by the wrappers SMAC uses require Medal to be in the same folder as them.
