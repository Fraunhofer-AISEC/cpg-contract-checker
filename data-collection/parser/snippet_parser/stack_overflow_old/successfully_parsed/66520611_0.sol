
interface IERC20Token {
    function balanceOf(address owner) public returns (uint256);
    function transfer(address to, uint256 amount) public returns (bool);
    function decimals() public returns (uint256);
}

contract TokenSale {
    IERC20Token public tokenContract = '0x12740510086c7062d5131BFe7C680c8b5D728c7f' 
    uint256 public price = 1000000000000000;              
    address owner;

    uint256 public tokensSold;

    event Sold(address buyer, uint256 amount);

    function TokenSale(IERC20Token _tokenContract, uint256 _price) public {
        owner = msg.sender;
        tokenContract = _tokenContract;
        price = _price;
    }
}