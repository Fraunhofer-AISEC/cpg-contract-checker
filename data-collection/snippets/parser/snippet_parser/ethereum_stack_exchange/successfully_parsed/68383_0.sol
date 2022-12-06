pragma solidity 0.5.6;

interface DeployInterface {
    function foo() external returns (uint256);
}

contract DeploySecond is DeployInterface {
    function foo() external returns (uint256) {
        return 2;
    }
}

contract DeployThird is DeployInterface {
    function foo() external returns (uint256) {
        return 3;
    }
}


contract deployFirst {
    DeployInterface contractInstance;

    function setContractInstance(address _contractInstance) public {
        contractInstance = DeployInterface(_contractInstance);
    }

    function execDoThing() public returns (uint256) {
        return contractInstance.foo();
    }
}
