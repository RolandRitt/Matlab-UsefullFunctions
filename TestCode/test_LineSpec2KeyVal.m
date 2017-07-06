%% TestCases for LineSpec2KeyVal function
% 
% Description : 
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


%% Test 1: only one Color

sol = LineSpec2KeyVal('g');
assert(strcmp(sol{1}, 'LineColor'), 'wrong key for Line Color returned');

assert(strcmp(sol{2}, 'g'), 'wrong color returned');


%% Test 3: multible colors given

try
sol = LineSpec2KeyVal('gb');
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'multiple color specs given'), 'wrong error message thrown');

%% Test 4: multible ame colors given

try
sol = LineSpec2KeyVal('g.g');
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'Wrong Linespec. Color g multible given'), 'wrong error message thrown');



%% Test 5: only one Marker

sol = LineSpec2KeyVal('o');
assert(strcmp(sol{3}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{4}, 'o'), 'wrong Marker returned');

%% Test 6: no Marker given

try
sol = LineSpec2KeyVal('t"');
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'Invalid LineSpec given'), 'wrong error message thrown');


%% Test 7: multible Marker given

try
sol = LineSpec2KeyVal('o.');
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'multiple Markers specs given'), 'wrong error message thrown');

%% Test 8: multible same Markers given

try
sol = LineSpec2KeyVal(':g:');
% error('no error thrown');
catch ME
    errormsg = ME(1).message;
end
assert(strcmp(errormsg, 'Wrong Linespec. LineStyle : multible given'), 'wrong error message thrown');


%% Test 9: test -- LineStyle

sol = LineSpec2KeyVal('--');
assert(strcmp(sol{1}, 'LineStyle'), 'wrong key for Marker returned');

assert(strcmp(sol{2}, '--'), 'wrong Marker returned');

%% Test 10: test -. LineStyle

sol = LineSpec2KeyVal('-.');
assert(strcmp(sol{1}, 'LineStyle'), 'wrong key for Marker returned');

assert(strcmp(sol{2}, '-.'), 'wrong Marker returned');

%% Test 11: test - LineStyle

sol = LineSpec2KeyVal('-');
assert(strcmp(sol{1}, 'LineStyle'), 'wrong key for Marker returned');
assert(strcmp(sol{2}, '-'), 'wrong Marker returned');
assert(strcmp(sol{3}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{4}, 'none'), 'wrong Marker returned');


%% Test 12: test . marker

sol = LineSpec2KeyVal('.');
assert(strcmp(sol{3}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{4}, '.'), 'wrong Marker returned');
assert(strcmp(sol{1}, 'LineStyle'), 'wrong key for LineStyle returned');
assert(strcmp(sol{2}, 'none'), 'wrong LineStyle returned');


%% Test 13: test linespecs

sol = LineSpec2KeyVal('.-.');
assert(strcmp(sol{1}, 'LineStyle'), 'wrong key for LineStyle returned');
assert(strcmp(sol{2}, '-.'), 'wrong Marker returned');
assert(strcmp(sol{3}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{4}, '.'), 'wrong Marker returned');

%% Test 14: test linespecs

sol = LineSpec2KeyVal('.-.g');
assert(strcmp(sol{1}, 'LineColor'), 'wrong key for LineColor returned');
assert(strcmp(sol{2}, 'g'), 'wrong Color returned');
assert(strcmp(sol{3}, 'LineStyle'), 'wrong key for LineStyle returned');
assert(strcmp(sol{4}, '-.'), 'wrong LineStyle returned');
assert(strcmp(sol{5}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{6}, '.'), 'wrong Marker returned');

%% Test 15: test linespecs

sol = LineSpec2KeyVal('-..g');
assert(strcmp(sol{1}, 'LineColor'), 'wrong key for LineColor returned');
assert(strcmp(sol{2}, 'g'), 'wrong Color returned');
assert(strcmp(sol{3}, 'LineStyle'), 'wrong key for LineStyle returned');
assert(strcmp(sol{4}, '-.'), 'wrong LineStyle returned');
assert(strcmp(sol{5}, 'Marker'), 'wrong key for Marker returned');
assert(strcmp(sol{6}, '.'), 'wrong Marker returned');


