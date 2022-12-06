
import "node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Something{

    using SafeERC20 for IERC20;

    address owner;

    constructor(){
        owner = msg.sender;
    }

    function withdraw(address _token) public {

        uint amount = IERC20(_token).balanceOf(address(this));
    
        IERC20(_token).safeTransfer(owner, amount);
    }
}

