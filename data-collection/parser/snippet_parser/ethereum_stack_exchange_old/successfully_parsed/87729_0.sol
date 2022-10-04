pragma solidity >=0.4.22 <0.7.0;
import "remix_tests.sol"; 
import "remix_accounts.sol";

import "../TeamAtCompany.sol";


contract testSuite {
    TeamAtCompany teamContract;
    
    
    function beforeAll() public {
        
        
        Assert.equal(uint(1), uint(1), "1 should be equal to 1");
    }

    
    function checkSender() public {
        Assert.equal(msg.sender, TestAccounts.getAccount(9),"This is not valid msg.sender");
    }

}
