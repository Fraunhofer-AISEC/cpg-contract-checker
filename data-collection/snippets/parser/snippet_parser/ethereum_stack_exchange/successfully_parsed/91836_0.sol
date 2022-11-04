interface IERC20 {
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

interface V2 {
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

pragma solidity ^0.5.17;
contract tokenSales {
    
    
    
    
    address token = 0x87e9D87f85e80D79A77067A090F0748241892F74;
    address rgp = 0x153Eef8365e8F4ae62aC99b6C84520f81F572827;
    address owner;
    uint public price;
    
    uint256 public tokensSold;
    uint256 public decimals;
    
    event sold(address account, uint price, address token);
    
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "RGP Token: Caller is not the Owner"
        );
        _;
    }

    constructor(uint _price) public payable{
        owner ==  msg.sender;
        price = _price;
 
        
    }
    
    function() external payable{
        buyTokens();
        msg.value;
    }

    
    function mul(uint x, uint y) public pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
        
        
        
        
    
    function setBUSDCPrice(uint _price) public onlyOwner {
        price = _price;
    }
    
    function sendCollectedBUSDC (address payable _recipient)
        external
        onlyOwner
    {
        if (address(this).balance > 0) {
            _recipient.transfer(address(this).balance);
        }
    }

    function buyTokens() public payable {
        
        require(msg.value > 0, "RGP: INSUFFICIENT INPUT BALLANCE, YOU NEED TO SEND SOME BUSDT");
        
        
        uint256 tokensToBuy = mul(msg.value, uint256(10) ** IERC20(token).decimals()) / mul(price, uint256(10) ** V2(rgp).decimals());
        
        
        V2(rgp).allowance(msg.sender, address(this));
        IERC20(token).allowance(address(this), msg.sender);
        
        
        tokensToBuy <= V2(rgp).allowance(address(this), msg.sender); 
        msg.value <= IERC20(token).allowance(msg.sender, address(this)); 
        
        
        V2(rgp).approve(msg.sender, tokensToBuy);
        IERC20(token).approve(address(this), msg.value);
        
        
        IERC20(token).transferFrom(msg.sender, address(this), msg.value);
        
        
        uint256 rgpBalance = V2(rgp).balanceOf(address(this));
        
        
        require(rgpBalance >= tokensToBuy, "RGP: NOT ENOUGH TOKEN IN THE RESERVE");
        
        
        V2(rgp).transferFrom(address(this), msg.sender, tokensToBuy);
        
        
        IERC20(token).allowance(msg.sender, address(this)) + msg.value;
        V2(rgp).allowance(address(this), msg.sender) + tokensToBuy;
        
        
        IERC20(token).allowance(msg.sender, address(this)) + msg.value;
        V2(rgp).allowance(address(this), msg.sender) + tokensToBuy;
       
        
        tokensSold += msg.value; 
        emit sold(msg.sender, msg.value * price, address(token));
        
    }

    function endSale() public onlyOwner{
            
        require(V2(rgp).transfer(owner, address(this).balance), "RGP: Sales ended.");
        require(IERC20(token).transfer(owner, address(this).balance), "RGP: Sales ended.");
    
        msg.sender.transfer(address(this).balance);
    }
}
