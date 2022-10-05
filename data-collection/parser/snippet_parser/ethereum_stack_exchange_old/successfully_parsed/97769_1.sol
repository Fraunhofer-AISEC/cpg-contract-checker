pragma solidity >=0.4.22 <0.9.0;
import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../contracts/Forecast.sol";


contract testSuite {

    Forecast forecast;
    
    function beforeAll() public {
        forecast = new Forecast(42);
    }

    
    
    function testBet() public payable {
        Assert.equal(forecast.betValue(), 42, "Bet value should be 42");
        Assert.equal(forecast.accPot(), 0, "Accumulated pot should start at 0");
        Assert.equal(forecast.betCount(), 0, "Bet count should start at 0");
        Assert.equal(msg.value, 42, "Msg value should be 42");
        
        forecast.bet(42);
        
        Assert.equal(forecast.betCount(), 1, "Bet count should be 1");
        Assert.equal(forecast.accPot(), 42, "Accumulated pot should be 42");
    }
}
