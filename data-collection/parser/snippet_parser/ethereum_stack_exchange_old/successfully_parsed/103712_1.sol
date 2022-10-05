
pragma solidity >0.8.5;
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract SomeCoin is ERC20 {
    constructor() ERC20("SC", "Some Coin") {
        _mint(msg.sender, 1000000000);
    }
}
contract Example {
    
    
    
    IERC20 public erc20coin;
    constructor(address erc20Address_){
        erc20coin = IERC20(erc20Address_);
    }
    function deposit(uint amount_)external{
        erc20coin.transferFrom(msg.sender, address(this), amount_);
    }
    function withdrawInto(address to_, uint amount_, address contractAddress_)external{
        IERC20 erc20 = IERC20(contractAddress_);
        erc20.transfer(to_, amount_);
    }
    function withdrawInto(address to_, uint amount_)external{
        erc20coin.transfer(to_, amount_);
    }
}
