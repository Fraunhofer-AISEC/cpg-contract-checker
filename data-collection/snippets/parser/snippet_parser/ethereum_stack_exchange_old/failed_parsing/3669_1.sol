modifier onlyAfter(uint _time) { if (now <= _time) throw; _ }

function getValue() onlyAfter(validity) returns (uint){
