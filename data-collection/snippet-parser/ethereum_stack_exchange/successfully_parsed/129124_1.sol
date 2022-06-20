pragma solidity >=0.4.22 <0.9.0;


import "remix_tests.sol"; 




import "remix_accounts.sol";
import "../contracts/MyContract.sol";

contract MyContractTest is MyContract {
    address acc0;

    function beforeAll() public {
        
        acc0 = TestsAccounts.getAccount(0); 
    }

    
    
    function testMyPublicFunction() public {
        Assert.ok(MyPublicFunction(), "Should be true");
    }

    
    
    function testMyExternalFunction() {
        Assert.ok(this.MyExternalFunction(), "Should be true");
    }
}

