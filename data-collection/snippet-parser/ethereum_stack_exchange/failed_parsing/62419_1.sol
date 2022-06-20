contract DappTokenSale {
    address admin;
    **DappToken public tokenContract;**
    uint256 public tokenPrice;
    uint256 public tokensSold;

function DappTokenSale(DappToken _tokenContract, uint256 _tokenPrice) public {
    admin = msg.sender;
    tokenContract = _tokenContract;
    tokenPrice = _tokenPrice;
}
}
