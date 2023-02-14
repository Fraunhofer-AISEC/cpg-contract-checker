

pragma solidity 0.8.7;

contract implementationProxy {
    uint public a;
    uint public b;

    address owner;
    address implementation;

    constructor() {
        owner = msg.sender;
    }

    function implementationAdd(address _add) external {
        require(msg.sender == owner, "Not allowed");

        implementation = _add;
    }

    fallback() payable external {
        implementation.delegatecall(msg.data);
    }
}

contract Implementation {
    uint public a;
    uint public b;

    function setVar(uint _a, uint _b) external {
        a= _a;
        b= _b;
    } 

    function add() external view returns (uint) {
        return a+b;
    }
}

contract User {

    function varChange(address _add, uint _a, uint _b) external {
        _add.call(
      abi.encodeWithSelector(
        bytes4(keccak256("setVar(uint256, uint256)")), _a, _b
      )
    );
        
    }
}
