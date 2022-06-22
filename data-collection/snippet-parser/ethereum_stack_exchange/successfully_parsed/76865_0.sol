pragma solidity 0.5.8;

contract TestLogicInterface {
    function getX() public view returns (uint);
    function setX(uint _newX) public;
    function owner() public view returns(address);
    function setOwner(address _owner) public;
    function testMessageSender() public view returns(address, address);
}

contract TestState {
    uint x = 12;

    function getX() public view returns (uint) {
        return x;
    }

    function setX(uint _newX) public {
        x = _newX;
    }
}

contract TestLogic {

    TestState public _dataLayer;

    address public owner;

    constructor(address _dl, address _owner) public {
        _dataLayer = TestState(_dl);
        owner = _owner;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner is allowed");
        _;
    }

    function setOwner(address _owner) public {
        owner = _owner;
    }

    function setX(uint _newX) public onlyOwner {
        _dataLayer.setX(_newX);
    }

    function getX() public view returns (uint) {
        return _dataLayer.getX();
    }

    function testMessageSender() public view returns(address, address){
        return (msg.sender, owner);
    }
}

contract TestProxy {
    address public targetAddress;

    constructor(address _lc) public {
        setTargetAddress(_lc);
    }

    function setTargetAddress(address _address) public {
        require(_address != address(0));
        targetAddress = _address;
    }

    function () external {
        address contractAddr = targetAddress;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, contractAddr, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }

    }
}
