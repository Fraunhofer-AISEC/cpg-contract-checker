
pragma solidity 0.8.0;

contract RetrieveMappingValuesFromStructArray {
    struct somestruct {
        uint someuint;
        mapping(address=>uint) somemapping;
    }

    somestruct[] public _arrayofsomestruct;

    function setStruct(uint _firstValue, address _address,  uint _secondValue) public {
        somestruct storage someStruct = _arrayofsomestruct.push();
        someStruct.someuint = _firstValue;
        someStruct.somemapping[_address] = _secondValue;
    }

    function getStruct(uint index, address _address) external view returns(uint someuint, uint somemapping) {
        return (_arrayofsomestruct[index].someuint, _arrayofsomestruct[index].somemapping[_address]);
    }

}
