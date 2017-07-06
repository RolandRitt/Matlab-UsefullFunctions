function KeyVals = LineSpec2KeyVal(linespec, addDefault)
% linespec, KeyVal,
%
% Purpose : extract the LineColor, LineStyle and Marker from a given
% linespec string; if linestyle or Marker not given --> default None
%
% Syntax :
%       KeyVals = LineSpec2KeyVal(linespec)
%       KeyVals = LineSpec2KeyVal(linespec, addDefault)
%
% Input Parameters :
%       linespec := string which defines a linespec
%       addDefault := boolean if default values should be added (default ==
%       true)
%
% Return Parameters :
%       KeyVals := a cell array containing Key and value for the extracted
%       properties; in other functions use e.g plot(..., ..., KeyVals{:});
%
% Description :
%       Uses the linespec definitions from matlab
%          b     blue          .     point              -     solid
%          g     green         o     circle             :     dotted
%          r     red           x     x-mark             -.    dashdot
%          c     cyan          +     plus               --    dashed
%          m     magenta       *     star             (none)  no line
%          y     yellow        s     square
%          k     black         d     diamond
%          w     white         v     triangle (down)
%                              ^     triangle (up)
%                              <     triangle (left)
%                              >     triangle (right)
%                              p     pentagram
%                              h     hexagram
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

%% check input arguments
if nargin<2
    addDefault = true;
end

%% define possible options
colors = {'b', 'g', 'r', 'c', 'm', 'y', 'k', 'w'};
markers = {'.', 'o', 'x', '+', '*', 's', 'd', 'v', '^', '<', '>', 'p', 'h' };
lineStyles = {'--', ':', '-.', '-'};

%% initialize output
KeyVals = {};
colsSpec= [];
LineStyleSpec = [];
MarkerSpec= [];

% check colors
for col=colors
    colInd = strfind(linespec, col{1});
    
    
    if colInd
        if ~isequal(size(colInd),[1,1])
            error(['Wrong Linespec. Color ', col{1}, ' multible given']);
        end
        if isempty(colsSpec)
            colsSpec=linespec(colInd:colInd+length(col{1})-1);
            linespec(colInd:colInd+length(col{1})-1) = '';
        else
            error('multiple color specs given')
        end
    end
end

if ~isempty(colsSpec)
    KeyVals{end+1} = 'Color';
    KeyVals{end+1} = colsSpec;
end


% check LineStyle
for col=lineStyles
    colInd = strfind(linespec, col{1});
    
    if colInd
        if ~isequal(size(colInd),[1,1])
            error(['Wrong Linespec. LineStyle ', col{1}, ' multible given']);
        end
        if isempty(LineStyleSpec)
            LineStyleSpec=linespec(colInd:colInd+length(col{1})-1);
            linespec(colInd:colInd+length(col{1})-1) = '';
            
        else
            error('multiple LineStyle specs given')
        end
    end
end

if ~isempty(LineStyleSpec)
    KeyVals{end+1} = 'LineStyle';
    KeyVals{end+1} = LineStyleSpec;
else
    if addDefault
        KeyVals{end+1} = 'LineStyle';
        KeyVals{end+1} = 'none';
    end
end



% check markers
for col=markers
    colInd = strfind(linespec, col{1});
    
    if colInd
        if ~isequal(size(colInd),[1,1])
            error(['Wrong Linespec. Marker ', col{1}, ' multible given']);
        end
        if isempty(MarkerSpec)
            MarkerSpec=linespec(colInd:colInd+length(col{1})-1);
            linespec(colInd:colInd+length(col{1})-1) = '';
        else
            error('multiple Markers specs given')
        end
    end
end

if ~isempty(MarkerSpec)
    KeyVals{end+1} = 'Marker';
    KeyVals{end+1} = MarkerSpec;
else
    if addDefault
        KeyVals{end+1} = 'Marker';
        KeyVals{end+1} = 'none';
    end
end



if ~isempty(linespec)
    error('Invalid LineSpec given');
end
