function datetimeobj = datetimeLast(varargin)
% datetime
%
% Purpose : given a datevector return the last possible datetime; eg
% datetimeLast(2016) should return datetimeobject (2016-12-31 23:59:59)
% which is in fact 2017-1ms; 1ms is default value, if last element in varargin is a
% duration object; this duration is subtracted
%
% Syntax :
%       datetimeobj = datetimeLast(yyyy, mm, ...,ms)
%       datetimeobj = datetimeLast([yyyy, mm, ...,ms])
%       datetimeobj = datetimeLast(yyyy, mm, ..., duration)
%       datetimeobj = datetimeLast([yyyy, mm, ...], duration)
%
% Input Parameters :
%       varargin: elements of the datevector; if last element is a
%       duration, the default subtraction value from 1ms is overwritten
%       with the given; the elements are in order year, month, day, hour,
%       minutes, seconds, ms
%
% Return Parameters :
%       datetimeojb = the datetimeobj representing the last possible time
%       for the given datevec
%
% Description :
%       the last given element of the given datevec is raised by one and
%       the given duration is subtracted (default 1ms);
%
% Author : 
%    Roland Ritt
%
% History :
% \change{1.0}{07-Jul-2017}{Original}
%
% --------------------------------------------------
% (c) 2017, Roland Ritt
% Chair of Automation, University of Leoben, Austria
% email: automation@unileoben.ac.at
% url: automation.unileoben.ac.at
% --------------------------------------------------
%
%%

%% Initialize values
defVec = zeros(1, 7); %for Year, Month, Day, Hour, Minutes, Seconds, Ms
defVec([2,3]) = 1; %day and month start with 1



defDuration = milliseconds(1);
if isvector(varargin{1}) && ~isequal(size(varargin{1}) ,[1,1])
    inputvec = varargin{1};
    if length(varargin) == 2
        if isa(varargin{end},'duration')
            defDuration = varargin{end};
        else
            error('second input argument is no duration');
        end
    elseif length(varargin)>2
        error('too much input arguments are given');
    end
else
    if isa(varargin{end},'duration')
        defDuration = varargin{end};
        inputvec =  [varargin{1:end-1}];
    else
        inputvec =  [varargin{1:end}];
    end
end

n = length(inputvec);
defVec(1:n) = inputvec;

defVec(n) = defVec(n) + 1;    

%% call datetime function and return difference
datetimeobj = datetime(defVec(1), defVec(2), defVec(3), ...
    defVec(4), defVec(5), defVec(6), defVec(7)) - defDuration;



