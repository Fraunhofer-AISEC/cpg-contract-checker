

pragma solidity >=0.7.0 <0.9.0;


contract Storage {

    bytes32 value;

    
    function store(bytes32 val) public {
        value = val;
    }

    
    function retrieve() public view returns (bytes32){
        return value;
    }
}
