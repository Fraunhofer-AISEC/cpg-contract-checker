
pragma solidity >=0.4.22 <0.9.0;


import "remix_tests.sol"; 




import "remix_accounts.sol";
import "./Bet.sol";

contract testSuite is Bet{
    constructor() Bet(TestsAccounts.getAccount(0), TestsAccounts.getAccount(0), TestsAccounts.getAccount(0), TestsAccounts.getAccount(0), TestsAccounts.getAccount(0), TestsAccounts.getAccount(0)) payable {
        
    }


     
    
    function beforeAll() public { 
        Assert.equal(testSuite.totalSupply(), 250000000 * 10 ** 8, "Total supply should be 250 
           million");
    }
}
