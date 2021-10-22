function [t, toy, p, Ws1, Wd1, T1, Ws2, Wd2, T2, Ws3, Wd3, T3] = importfile1(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  [T, TOY, P, WS1, WD1, T1, WS2, WD2, T2, WS3, WD3, T3] =
%  IMPORTFILE1(FILENAME) reads data from text file FILENAME for the
%  default selection.  Returns the data as column vectors.
%
%  [T, TOY, P, WS1, WD1, T1, WS2, WD2, T2, WS3, WD3, T3] =
%  IMPORTFILE1(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  [t, toy, p, Ws1, Wd1, T1, Ws2, Wd2, T2, Ws3, Wd3, T3] = importfile1("C:\Users\33637\Documents\12. Advanced time series\11. Exercises\2. Computer exercise 4\1. Analyse\cex4WindDataInterpolated.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Oct-2021 19:58:55

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 12);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["t", "toy", "p", "Ws1", "Wd1", "T1", "Ws2", "Wd2", "T2", "Ws3", "Wd3", "T3"];
opts.VariableTypes = ["datetime", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "t", "InputFormat", "yyyy-MM-dd HH:mm:ss");

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
t = tbl.t;
toy = tbl.toy;
p = tbl.p;
Ws1 = tbl.Ws1;
Wd1 = tbl.Wd1;
T1 = tbl.T1;
Ws2 = tbl.Ws2;
Wd2 = tbl.Wd2;
T2 = tbl.T2;
Ws3 = tbl.Ws3;
Wd3 = tbl.Wd3;
T3 = tbl.T3;
end