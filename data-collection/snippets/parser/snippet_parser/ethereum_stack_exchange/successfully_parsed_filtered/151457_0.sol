import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Test is ERC20, Ownable {

    uint256 private constant INITIAL_SUPPLY = 1000000000 * 10**18;

    constructor() ERC20("Test", "TEST") {
        _mint(address(this), INITIAL_SUPPLY);
    }
  
    function transferTest(address _to, uint256 _amount) public onlyOwner {
        _transfer(address(this), _to, _amount);
    }
}
