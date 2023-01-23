pragma solidity 0.6.12;


import "remix_tests.sol"; 

import "remix_accounts.sol";
import "./LottoMock.sol";

... other test cases

contract lottoMultipleEntranceTest {

LottoMock lotto;



function beforeEach() public payable {
    lotto = new LottoMock();
    
    Assert.equal(lotto.getQuantityOfEntrants(), uint256(0), "expecting 0 entrants before entering");
    Assert.equal(lotto.getLotteryBalance(), uint256(0), "expecting 0 lottery balance before entering");
    Assert.equal(msg.sender, TestsAccounts.getAccount(0), "Invalid sender");

    
    lotto.enter{value:500000000000000}();
    
    Assert.equal(lotto.getLotteryBalance(), uint256(500000000000000), "expecting lottery balance equal to entrance fee after entering");
    Assert.equal(lotto.getQuantityOfEntrants(), uint256(1), "user should have successfully entered the lottery");
}





function enterSuccessfullyMultipleEntrants() public payable {
    Assert.equal(lotto.getLotteryBalance(), uint256(500000000000000), "One user has already entered.");
    Assert.equal(lotto.getQuantityOfEntrants(), uint256(1), "Expecting an existing entry.");
    Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");

    
    try lotto.enterDebug1{value:500000000000000}() {
        Assert.ok(false, 'succeed unexpected');
    } catch Error(string memory reason) {
        Assert.equal(reason, "debug", "debug.");
    } catch (bytes memory ) {
        Assert.ok(false, 'failed unexpected');
    }
    
    Assert.equal(lotto.getLotteryBalance(), uint256(1000000000000000), "expecting lottery balance equal to entrance fee for two users after entering");
    Assert.equal(lotto.getQuantityOfEntrants(), uint256(2), "second user should have successfully entered the lottery");
}
}
