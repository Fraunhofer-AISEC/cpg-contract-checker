

pragma solidity 0.8.7;

contract TestFund {
    
    address public caller;

    constructor() payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function emptyFn(address dummy) public {}

    function setCaller(address _caller) public {
        caller = _caller;
    }

    function withdraw() external {
        caller = msg.sender;
        
        

        

        (bool success, bytes memory data) = payable(msg.sender).call{gas: 2300, value:1 wei}("");
        require(success);
    }

}

contract Attack {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function attack(address target) external {
        TestFund(target).withdraw();
    }

    receive() external payable {
        if (getBalance() == 1 wei) {
            TestFund(msg.sender).setCaller(msg.sender);
        }
    }
}
