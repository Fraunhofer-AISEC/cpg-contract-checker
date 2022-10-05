pragma solidity ^0.8.10;
import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../contracts/Token.sol";

contract TokenTest is Token{

function beforeAll () public {
    
}



function purchaseToken () public payable {
    Assert.notEqual(msg.sender, TestsAccounts.getAccount(0), "Owner wallet cannot purchase");
    buyToken(msg.sender); 
    Assert.equal(balanceOf(msg.sender), 10000000000, "Incorrect amount");
}

}
