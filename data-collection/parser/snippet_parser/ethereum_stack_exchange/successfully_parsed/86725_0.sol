pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyFirstToken is ERC20, Ownable {
    uint256 rate;
    constructor() public ERC20("MyFirstToken",'MFT'){
        _mint(msg.sender, 1000000000000000000000000);
        rate = 1;
    }

    event TokensPurchased(
      address account,
      address token,
      uint amount,
      uint rate
    );

    event TokensSold(
        address account,
        address token,
        uint amount,
        uint rate
    );


    modifier contractHasEnoughBalance() {
        
        uint tokenAmount = msg.value * rate;
        
        require(balanceOf(this.owner()) >= tokenAmount,"Contract doesn't have enough balance");
        _;
    }

    function buyTokens() public payable contractHasEnoughBalance {
        
        uint tokenAmount = msg.value * rate;
        
        transferFrom(this.owner(), msg.sender, tokenAmount);
        
        
    }

    function sellTokens(uint _amount) public {
        
        require(balanceOf(msg.sender) >= _amount, "User doesn't have enough balance");
        
        uint etherAmount = _amount / rate;

        
        require(address(this).balance >= etherAmount);

        
        transferFrom(msg.sender, address(this), _amount);
        msg.sender.transfer(etherAmount);

        
        
    }

}
