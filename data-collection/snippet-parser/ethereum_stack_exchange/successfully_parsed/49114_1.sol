import "./ERC20Token.sol";

contract MyContract {
    ERC20Token public Coin;

    constructor (address coin) {
        Coin = ERC20Token(coin);
    }

    function Test(address from, address to, uint amount) public {
        
        Coin.contractTransfer(from, to, amount);
    }
}
