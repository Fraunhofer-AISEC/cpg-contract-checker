contract Crowdsale is Owned{
    using SafeMath for uint256;

    
    IERC20 _token;

    
    
    
    
    
    uint256 rate;

    
    uint256 _weiRaised;
    bool status;  
    address payable wallet;

    
    event TokensPurchased(address purchaser, address beneficiary, uint256 value, uint256 amount);

    
    constructor (IERC20 token) public {
        rate = 100;
        _token = token;
    
        wallet = 0x64eCe92B79b096c2771131870C6b7EBAE8C2bd7E;
        status = true;
    }
}