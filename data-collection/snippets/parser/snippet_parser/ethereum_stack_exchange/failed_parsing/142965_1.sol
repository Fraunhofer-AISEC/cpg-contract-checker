
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
contract Forwarder {
    address owner;
    address USDTContract =....; 
    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        (bool s,) = payable(owner).call{value: msg.value}(new bytes(0));
        require(s);
    }
    
    function transferUsdtToOwner(uint amount) external {
        IERC20(USDTAddress).transferFrom(msg.sender, owner, amount);
    }
}
