pragma solidity ^0.4.18;

contract Test {

    address owner;
    uint256 val = 256;
    address otherContract;

    function Test(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyOtherContract() {
        require(msg.sender == otherContract);
        _;
    }

    function setOtherContract(address _otherContract) onlyOwner {
        otherContract = _otherContract;
    }

    function getVal() onlyOtherContract returns (uint) {
        return val;
    }
}


contract Other {

    Test testContract;

    function setAddress(address _address) {
        testContract = Test(_address);            
    }    

    function getVal() constant public returns (uint256) {
        return testContract.getVal();
    }
}
