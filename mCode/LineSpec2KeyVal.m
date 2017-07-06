function KeyVals = LineSpec2KeyVal(linespec)
% linespec, KeyVal, 
%
% Purpose : extract the LineColor, LineStyle and Marker from a given
% linespec string
%
% Syntax :
%       KeyVals = LineSpec2KeyVal(linespec)
%
% Input Parameters :
%       linespec := string which defines a linespec
%
% Return Parameters :
%       KeyVals := a cell array containing Key and value for the extracted
%       properties; in other functions use e.g plot(..., ..., KeyVals{:});
%
% Description :
%       Uses the linespec definitions from matlab
%
% Author : 
%    Roland Ritt
%
% History :
% \change{1.0}{06-Jul-2017}{Original}
%
% --------------------------------------------------
% (c) 2017, Roland Ritt
% Chair of Automation, University of Leoben, Austria
% email: automation@unileoben.ac.at
% url: automation.unileoben.ac.at
% --------------------------------------------------
%
%%

