pragma solidity ^0.8.0;

contract MyContract {
    
}

contract AnotherContract {
    address public myContractInstance;

    function createMyContract() public {
        
    
        
        myContractInstance = address(new MyContract());
    }
}
