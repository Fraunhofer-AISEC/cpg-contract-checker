pragma solidity 0.4.24;

contract KeccakCompare {
    struct Example {
        uint256 age;
        bytes32 name;
    }

    Example[] public examples;

    function pushExample(uint256 _age, bytes32 _name) external {
        examples.push(Example({
            age: _age,
            name: _name
        }));
    }

    function equals(uint256 _firstIndex, uint256 _secondIndex) external view returns (bool) {
        return equals(examples[_firstIndex], examples[_secondIndex]);
    }

    function equals(Example storage _first, Example storage _second) internal view returns (bool) {
        
        return(keccak256(abi.encodePacked(_first.age, _first.name)) == keccak256(abi.encodePacked(_second.age, _second.name)));
    }
}
