pragma solidity ^0.4.23;

import "./ERC20.sol";
import "./SafeMath.sol";
import "./MintableToken.sol";



contract Crowdsale {
  using SafeMath for uint256;

 
    MintableToken public token;

    
    uint256 public ICOStartTime;
    uint256 public ICOEndTime;

    
    address internal wallet;

    
    uint256 public weiRaised; 

    
    uint256 public publicSupply;

    
    event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    
    constructor(MintableToken _token, uint256 _publicSupply, uint256 _startTime, uint256 _endTime, address _wallet) public {
        require(_endTime >= _startTime);
        require(_wallet != 0x0);

        
        token = _token;

        
        publicSupply = _publicSupply;

        
        ICOStartTime = _startTime;

        
        ICOEndTime = _endTime;

        
        wallet = _wallet;

    }

    
    function() public payable {
        buyTokens(msg.sender);
    }

    
    function buyTokens(address beneficiary) public payable {
        require(beneficiary != 0x0);
        require(validPurchase());

        
        uint256 lowerPurchaseLimit = 0.05 ether;
        require(msg.value >= lowerPurchaseLimit);

        assert(_tokenPurchased(msg.sender, beneficiary, msg.value));

        
        weiRaised = weiRaised.add(msg.value);

        forwardFunds();
    }

    function _tokenPurchased(address , address , uint256 ) internal returns (bool) {
        
        return true;
    }

    
    
    function forwardFunds() internal {
        wallet.transfer(msg.value);
    }

    
    function validPurchase() internal constant returns (bool) {
        bool withinPeriod = ICOStartTime <= now && now <= ICOEndTime;
        bool nonZeroPurchase = msg.value != 0;

        return withinPeriod && nonZeroPurchase;
    }

    
    function hasEnded() public constant returns (bool) {
        return now > ICOEndTime;
    }
bool public checkBurnTokens = false;

    function burnTokens() onlyOwner public returns (bool) {
        require(hasEnded());
        require(!checkBurnTokens);

        token.mint(0x0, publicSupply);
        token.burnTokens(publicSupply);
        publicSupply = 0;
        checkBurnTokens = true;

        return true;
    }

    function getTokenAddress() onlyOwner public view returns (address) {
        return address(token);
}
}
