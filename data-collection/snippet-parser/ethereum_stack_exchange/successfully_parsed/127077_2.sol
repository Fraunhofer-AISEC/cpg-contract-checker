
pragma solidity ^0.8.10;

contract Test {

     struct SomeStruct {
        uint someUint;
        uint someUint2;
        mapping(address => uint) someMapping;
    }
    
    mapping(address=>SomeStruct) mapStruct;

    function addElement(uint _someUint, uint _someUint2, address _address, uint _valueAddress) public {
        mapStruct[_address].someUint = _someUint;
        mapStruct[_address].someUint2 = _someUint2;
        mapStruct[_address].someMapping[_address] = _valueAddress;
    }

    function getElement(address _address) external view returns(uint _someUint, uint _someUint2) {
        return (mapStruct[_address].someUint, mapStruct[_address].someUint2);
    }
}
