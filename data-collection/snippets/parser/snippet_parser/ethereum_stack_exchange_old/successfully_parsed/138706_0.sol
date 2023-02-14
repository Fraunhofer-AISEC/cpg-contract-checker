
pragma solidity 0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract Orders is Ownable {
uint256 public counter;
address token;
constructor(address _token) {
    token = _token;
}
function deposit(uint _amount) public payable {
    IERC20(token).approve(address(this), _amount);
    IERC20(token).allowance(msg.sender, address(this));
    IERC20(token).transferFrom(msg.sender, address(this), _amount);
    counter = counter + 1;
}

function getContractBalance() public onlyOwner view returns(uint){
return IERC20(token).balanceOf(address(this));
}
}
