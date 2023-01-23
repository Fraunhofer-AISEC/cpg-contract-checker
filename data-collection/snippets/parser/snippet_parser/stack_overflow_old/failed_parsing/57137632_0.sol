Token contract {   

address public ownerAddress;
uint256 public initialSupply = 100000000000;

constructor(string memory _name, string memory _symbol, uint8 _decimals) 
ERC20Detailed(_name, _symbol, _decimals)
public {
    ownerAddress = msg.sender;
    _mint(msg.sender, initialSupply);
} 



function createTokenSale(uint256 rate,uint256 cap) public verifyOwner() returns(address) {

    TokenSale newTokenSale = new TokenSale(rate, msg.sender, this, cap );
    address tokenSaleAddress = address(newTokenSale);

    emit LogSaleAndOwnerAddress(tokenSaleAddress, ownerAddress); 

    this.transferFrom(ownerAddress, tokenSaleAddress, initialSupply); 

    return tokenSaleAddress;
}
}
