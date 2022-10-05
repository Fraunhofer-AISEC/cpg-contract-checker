pragma solidity >= 0.7.0 < 0.9.0;

library search {
function findIt(uint [] storage numb, uint value) public view returns(uint){
    for (uint i = 0; i < numb.length; i++) if (numb[1] == value) return i;
}  
  }

 contract test{
 uint [] data;
  constructor() {
    data.push(1);
    data.push(2);
    data.push(3);
    data.push(4);
    data.push(5);
}

function getVal(uint val) public view returns(uint){
    uint result = search.findIt(data,val);
    return result;
}
}