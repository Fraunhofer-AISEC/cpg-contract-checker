pragma solidity ^0.5.0;

import "./Context.sol";
import "./IERC20.sol";
import "./StableCoin.sol";
import "./SafeMath.sol";
import "./SafeERC20.sol";
import "./ReentrancyGuard.sol";




contract Crowdsale is Context, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    
    IERC20 private _token;
    STABLE private _stableCoin = _stableCoin;

    
    address payable private _wallet;

    
    address _owner;
    
    
    
    
    uint256 private _rate;

    
    uint256 private _usdcRaised;

    
    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    
    constructor (uint256 rate, address payable wallet, IERC20 token, address stableCoin) public {
        require(rate > 0, "Crowdsale: rate is 0");
        require(wallet != address(0), "Crowdsale: wallet is the zero address");
        require(address(token) != address(0), "Crowdsale: token is the zero address");
        require(address(stableCoin) != address(0), "Crowdsale: stable is the zero address");

        _owner = _msgSender();
        _rate = rate;
        _wallet = wallet;
        _token = token;
        _stableCoin = STABLE(stableCoin);
    }

    modifier onlyOwner() {
        require(_msgSender() == _owner, "OwnerRole: Only owner can make this change");
        _;
    }

    
    function token() public view returns (IERC20) {
        return _token;
    }

    
    function stable() public view returns (STABLE) {
        return _stableCoin;
    }

    
    function wallet() public view returns (address payable) {
        return _wallet;
    }

    
    function rate() public view returns (uint256) {
        return _rate;
    }

    
    function usdcRaised() public view returns (uint256) {
        return _usdcRaised;
    }

    

     function changeRate(uint256 newRate) public onlyOwner returns (bool) {
        _rate = newRate;
        return true;
     }

    
    function buyTokens(address beneficiary, uint256 tokenAmount) public nonReentrant payable {
        
        

        uint256 tokens = _getTokenAmount(tokenAmount);

        _preValidatePurchase(beneficiary, tokens);
        
        _usdcRaised = _usdcRaised.add(tokenAmount);

        bool stableStatus = _stableCoin.transferFrom(beneficiary, address(this), tokenAmount);
        require(stableStatus, "Crowdsale: Stable token transfer failed");
        
        _processPurchase(beneficiary, tokens);
        emit TokensPurchased(_msgSender(), beneficiary, tokenAmount, tokens);

        _updatePurchasingState(beneficiary, tokenAmount);

        _forwardFunds(tokenAmount);
        _postValidatePurchase(beneficiary, tokenAmount);
    }
    
    function _preValidatePurchase(address beneficiary, uint256 tokenAmount) internal view {
        require(beneficiary != address(0), "Crowdsale: beneficiary is the zero address");
        require(tokenAmount != 0, "Crowdsale: tokenAmount is 0");
        require(!(_stableCoin.balanceOf(beneficiary) < tokenAmount), "Crowdsale: Not enough balance");
        this; 
    }

    
    function _postValidatePurchase(address beneficiary, uint256 weiAmount) internal view {
        
    }

    
    function _deliverTokens(address beneficiary, uint256 tokenAmount) internal {
        _token.safeTransfer(beneficiary, tokenAmount);
    }

    
    function _processPurchase(address beneficiary, uint256 tokenAmount) internal {
        _deliverTokens(beneficiary, tokenAmount);
    }

    
    function _updatePurchasingState(address beneficiary, uint256 weiAmount) internal {
        
    }

    
    function _getTokenAmount(uint256 stableCoinAmount) internal view returns (uint256) {
        return stableCoinAmount.div(_rate);
    }

    
    function _forwardFunds(uint256 tokenAmount) internal returns (bool){
        require(_stableCoin.transfer(_wallet, tokenAmount), "Crowdsale: Stable token transfer failed");
        return true;
    }

}
