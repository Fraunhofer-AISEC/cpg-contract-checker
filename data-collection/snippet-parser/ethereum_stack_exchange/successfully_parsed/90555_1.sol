contract TokenSale is Crowdsale{
  
event CrowdsaleFinalized();

constructor(   
ERC20Mintable token
)

public
Crowdsale(token)  
{ 
    require(address(token) != address(0),"Token is not an address");   
}   

}




contract Crowdsale is ReentrancyGuard {
using SafeMath for uint256;
using SafeERC20 for IERC20;


IERC20 private _token; 


uint256 private _releasedToken;

event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 amountOfTokens);

constructor (IERC20 token) public { 
    require(address(token) != address(0)); 
    _token = token;
}

function () external payable { 
}


function token() public view returns (IERC20) {
    return _token;
} 

function releasedToken() public view returns (uint256) {
    return _releasedToken;
}

function pushTokens(address payable beneficiary,uint256 rate,uint256 amountOfTokens) public nonReentrant payable  {
    _preValidatePurchase(beneficiary, rate, amountOfTokens);

    
    _releasedToken = _releasedToken.add(amountOfTokens);

    _processPurchase(beneficiary, amountOfTokens);
    emit TokensPurchased(msg.sender, beneficiary, amountOfTokens);

    _updatePurchasingState(beneficiary, amountOfTokens);

    _postValidatePurchase(beneficiary, amountOfTokens);
}


function _preValidatePurchase(address beneficiary, uint256 rate, uint256 amountOfTokens) internal view {
    require(beneficiary != address(0)); 
    require(rate > 0); 
    require(amountOfTokens > 0); 
}


function _postValidatePurchase(address beneficiary, uint256 amountOfTokens) internal view {
    
}

function _deliverTokens(address beneficiary, uint256 tokenAmount) internal {
    _token.safeTransfer(beneficiary, tokenAmount);  
}


function _processPurchase(address beneficiary, uint256 tokenAmount) internal {
    _deliverTokens(beneficiary, tokenAmount);
}


function _updatePurchasingState(address beneficiary, uint256 amountOfTokens) internal {
    
}

}






contract TokenSale is Crowdsale{
  
event CrowdsaleFinalized();

constructor(   
ERC20Mintable token
)

public
Crowdsale(token)  
{ 
    require(address(token) != address(0),"Token is not an address");   
}   
}