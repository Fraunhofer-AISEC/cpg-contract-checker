pragma solidity 0.4.19;

contract SimpleOwned {

    address public owner;
    bool public isRunning;

    function SimpleOwned() public {
        owner = msg.sender;
        isRunning == true;
    }

    modifier onlyIfRunning {
        require(isRunning);
        _;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address newOwner) public onlyOwner returns(bool success) {
        owner = newOwner;
        return true;
    }

    function stopContract() public onlyOwner onlyIfRunning returns(bool success) {
        isRunning = false;
        return true;
    }

    function doSomething() public onlyIfRunning returns(bool success) {
        
        
        return true;
    }
}
