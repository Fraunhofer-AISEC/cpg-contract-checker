pragma solidity ^0.5.4;
import "./AddBalanceToContract.sol";
import "./SafeMath.sol";


contract test1
{
    
    
    uint256[] public BOX_PERIOD = [50 days, 28 days, 20 days];
    uint256 constant public MIN_DEPOSIT = 5000000;
    uint256 constant public TEAM_PERCENT = 100;    
    uint256 constant public PERCENT_DIVIDER = 1000; 
    address payable constant public TEAM_WALLET = address(0x41e0e105b876f7d109468e76b92385f6cc2d9b057f);
    
    function deposit() public
    {
        uint256 amount = msg.value;
        require(amount >= MIN_DEPOSIT, "Your investment amount is less than the minimum amount!");
        

        uint256 adminFee = amount.mul(TEAM_PERCENT).div(PERCENT_DIVIDER);
        TEAM_WALLET.transfer(adminFee);
    }
    
    
  
    function getEthBalance(address _addr) public view returns(uint) {
        return _addr.balance;
    }
    
    
}
