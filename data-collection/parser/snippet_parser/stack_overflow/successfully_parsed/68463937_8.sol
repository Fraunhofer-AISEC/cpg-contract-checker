
pragma solidity ^0.8.3;


import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Box is Initializable{
    uint256 private _value;

    function initialize() public initializer {
        _value = 0;
    }

    
    event ValueChanged(uint256 value);

    
    function store(uint256 value) public {
        _value = value;
        emit ValueChanged(value);
    }

    
    function retrieve() public view returns (uint256) {
        return _value;
    }
}
