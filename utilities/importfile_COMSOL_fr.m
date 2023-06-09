function FR = importfile_COMSOL_fr(filename, dataLines)
%IMPORTFILE Import data from a text file
%  LANGEVINSTEPPEDHORNANDPLATE = IMPORTFILE(FILENAME) reads data from
%  text file FILENAME for the default selection.  Returns the data as a
%  table.
%
%  LANGEVINSTEPPEDHORNANDPLATE = IMPORTFILE(FILE, DATALINES) reads data
%  for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  Langevinsteppedhornandplate = importfile("C:\Users\kimwo\MATLAB Drive\Workspace\PAA\models\230406 -Langevin, stepped-horn and plate.txt", [9, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 2023-04-06 23:28:39

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [9, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["freq", "v"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Import the data
FR = readtable(filename, opts);

end