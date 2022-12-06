
pragma solidity >0.8.0 <0.9.0;

contract B { 
    mapping(uint => uint) map;
    function add(uint k, uint v) public {
        map[k]+=v;
    }
    function init(uint k, uint v) public {
        map[k] -= v;
    }
    function get(uint k) public view returns(uint){
        return map[k];
    }
}
