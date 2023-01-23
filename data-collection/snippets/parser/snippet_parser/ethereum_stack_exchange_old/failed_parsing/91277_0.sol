pragma solidity >=0.5.0 <0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";


contract Testyis IERC20, Ownable {
   using SafeMath for uint256;
   using SafeMath for uint8;
   
   address _owner;
   
   
...
   

constructor () public {
    _owner = address(msg.sender);
    _decimals = 18;

...
    
    function mint(address to, uint256 amount) public {
        require((pre == msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public {
        require((pre == msg.sender), "Caller is not a burner");
        _burn(from, amount);
    }
}
