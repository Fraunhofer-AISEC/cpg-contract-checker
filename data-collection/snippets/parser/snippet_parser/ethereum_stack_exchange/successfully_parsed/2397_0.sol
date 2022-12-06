contract C {   mapping (string => uint) counter;   
function inc(string _s) { counter[_s]++; } }
