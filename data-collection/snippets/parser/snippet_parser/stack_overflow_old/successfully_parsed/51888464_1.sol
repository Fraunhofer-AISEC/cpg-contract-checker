pragma solidity 0.4.24;

contract database{

    struct Table{
        uint value1;
        uint value2;
    }

    mapping(bytes32 => Table) public tables; 

    function addData(bytes32 _index, uint _value1, uint _value2) public {
        tables[_index].value1 = _value1;
        tables[_index].value2 = _value2;
    }
}  
