%=============================================================*
%                                                             
% This is a driver file that will run the systemic fluids model from c++ and
% fortran by passing parameter values needed by the model.
%
% Authors: A LaPole, MJ Colebank, MS Olufsen
%=============================================================*

%%
clear; clc; close all;
%% Ensure the make file is compiled
%%!make clean
%%!make
% make the file executable
%%! chmod +x sor06

%% Define the connectivity matrix

% Converging full network
writeconn  	 = [0 1 2 0
                1 3 4 0
                2 0 0 0
                3 5 6 0
                4 0 0 0
                5 7 8 0
                6 0 0 0 
                7 0 0 0
                8 0 0 0];
            
terminal 	 = [2 4 6 7 8];

% Write all this information to file.
dlmwrite('connectivity.txt',writeconn,'\t');
dlmwrite('terminal_vessels.txt',terminal,'\t');

% YOU NEED TO CHANGE THIS LINE TO YOUR CODE REPOSITORY
T = readtable("/Users/vv267/Desktop/SECRETGlasgow/Code/design_sim.csv");
%N = size(T);

% YOU NEED TO CHANGE THIS LINE TO CORRESPOND TO YOUR SIMULATION RUNS ID
for i=1200:1250
    f2   = T.f2(i);
    f3   = T.f3(i);
    fs2  = T.fs2(i);
    fs3  = T.fs3(i);
    alpha = T.alpha(i);
    % File ID (useful for running the C++/Fortran code in parallel)
    ID = T.ID(i);
    %% Put the parameters into a vector and run the model
    par_nom = [f2,f3,fs2,fs3,alpha,ID];
    param_str = mat2str(par_nom);

    % Run the model
    % NOTE: Windows users need 'sor06.exe', Mac/Linux users need ./sor06

    out = unix(sprintf('./sor06 %s',param_str(2:end-1)));

    if out == 1
        disp 'there is a model output'
    else
        disp 'there is no model output'
    end
end