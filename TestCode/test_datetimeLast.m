%% Test script for datetimeLast function
% 
% Description : 
%
% Author : 
%    Roland Ritt
%
% History :
% \change{1.0}{17-Jul-2017}{Original}
%
% --------------------------------------------------
% (c) 2017, Roland Ritt
% Chair of Automation, University of Leoben, Austria
% email: automation@unileoben.ac.at
% url: automation.unileoben.ac.at
% --------------------------------------------------
%
%%

%% Test 1: February
d1 = datetimeLast([2016,2]);
assert(isequal(d1, datetime(2016,2,29,23,59,59,999)), '29 February test went wrong');

d2 = datetimeLast([2015,2]);
assert(isequal(d2, datetime(2015,2,28,23,59,59,999)), '28 February test went wrong');

d3 = datetimeLast([2016]);
assert(isequal(d3, datetime(2016,12,31,23,59,59,999)), 'last day 2016');

%% Test 2: Syntax

d1 = datetimeLast([2015]);
assert(isequal(d1, datetime(2015,12,31,23,59,59,999)), 'last day 2015');

d2 = datetimeLast([2015,1]);
assert(isequal(d2, datetime(2015,1,31,23,59,59,999)), 'last day 2015 1');

d3 = datetimeLast([2015,4]);
assert(isequal(d3, datetime(2015,4,30,23,59,59,999)), 'last day 2015 4');

d4 = datetimeLast([2015,1,12]);
assert(isequal(d4, datetime(2015,1,12,23,59,59,999)), 'last day 2015 1 12');

d5 = datetimeLast([2015,1,12, 3]);
assert(isequal(d5, datetime(2015,1,12,3,59,59,999)), 'last day 2015 1 12 3');

d6 = datetimeLast([2015,1,12, 3, 23]);
assert(isequal(d6, datetime(2015,1,12,3,23,59,999)), 'last day 2015 1 12 3 23');

d7 = datetimeLast([2015,1,12, 3, 23, 45]);
assert(isequal(d7, datetime(2015,1,12,3,23,45,999)), 'last day 2015 1 12 3 23');

%% Test 3: Syntax 2

d1 = datetimeLast(2015);
assert(isequal(d1, datetime(2015,12,31,23,59,59,999)), 'last day 2015');

d2 = datetimeLast(2015,1);
assert(isequal(d2, datetime(2015,1,31,23,59,59,999)), 'last day 2015 1');

d3 = datetimeLast(2015,4);
assert(isequal(d3, datetime(2015,4,30,23,59,59,999)), 'last day 2015 4');

d4 = datetimeLast(2015,1,12);
assert(isequal(d4, datetime(2015,1,12,23,59,59,999)), 'last day 2015 1 12');

d5 = datetimeLast(2015,1,12, 3);
assert(isequal(d5, datetime(2015,1,12,3,59,59,999)), 'last day 2015 1 12 3');

d6 = datetimeLast(2015,1,12, 3, 23);
assert(isequal(d6, datetime(2015,1,12,3,23,59,999)), 'last day 2015 1 12 3 23');

d7 = datetimeLast(2015,1,12, 3, 23, 45);
assert(isequal(d7, datetime(2015,1,12,3,23,45,999)), 'last day 2015 1 12 3 23');

%% Test 4: Syntax 3

d = milliseconds(4);

d1 = datetimeLast(2015, d);
assert(isequal(d1, datetime(2015,12,31,23,59,59,996)), 'last day 2015');

d2 = datetimeLast(2015,1, d);
assert(isequal(d2, datetime(2015,1,31,23,59,59,996)), 'last day 2015 1');

d3 = datetimeLast(2015,4, d);
assert(isequal(d3, datetime(2015,4,30,23,59,59,996)), 'last day 2015 4');

d4 = datetimeLast(2015,1,12, d);
assert(isequal(d4, datetime(2015,1,12,23,59,59,996)), 'last day 2015 1 12');

d5 = datetimeLast(2015,1,12, 3, d);
assert(isequal(d5, datetime(2015,1,12,3,59,59,996)), 'last day 2015 1 12 3');

d6 = datetimeLast(2015,1,12, 3, 23, d);
assert(isequal(d6, datetime(2015,1,12,3,23,59,996)), 'last day 2015 1 12 3 23');

d7 = datetimeLast(2015,1,12, 3, 23, 45, d);
assert(isequal(d7, datetime(2015,1,12,3,23,45,996)), 'last day 2015 1 12 3 23');

%% Test 5: Syntax 4

d = seconds(4);

d1 = datetimeLast(2015, d);
assert(isequal(d1, datetime(2015,12,31,23,59,56)), 'last day 2015');

d2 = datetimeLast(2015,1, d);
assert(isequal(d2, datetime(2015,1,31,23,59,56)), 'last day 2015 1');

d3 = datetimeLast(2015,4, d);
assert(isequal(d3, datetime(2015,4,30,23,59,56)), 'last day 2015 4');

d4 = datetimeLast(2015,1,12, d);
assert(isequal(d4, datetime(2015,1,12,23,59,56)), 'last day 2015 1 12');

d5 = datetimeLast(2015,1,12, 3, d);
assert(isequal(d5, datetime(2015,1,12,3,59,56)), 'last day 2015 1 12 3');

d6 = datetimeLast(2015,1,12, 3, 23, d);
assert(isequal(d6, datetime(2015,1,12,3,23,56)), 'last day 2015 1 12 3 23');

d7 = datetimeLast(2015,1,12, 3, 23, 45, d);
assert(isequal(d7, datetime(2015,1,12,3,23,42)), 'last day 2015 1 12 3 23');

%% Test 6: wrong syntax

try
sol = datetimeLast([2015, 1], 6);
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'second input argument is no duration'), 'wrong error message thrown');

try
sol = datetimeLast([2015, 1], 6,7);
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'too much input arguments are given'), 'wrong error message thrown');