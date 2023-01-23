pragma solidity 0.6.2;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IDTToken.sol";

contract Stacking is Ownable{

    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    IDTToken stk = new IDTToken();
    mapping(uint256 => mapping(address => uint256)) public stackers;
    mapping(address => uint256) public poolBalance; 

    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);

    struct PoolInfo {
        IERC20 tokenStack;           
        uint256 allocPoint;       
        uint256 lastRewardBlock; 
        uint256 accIDTPerShare; 
        }

    function deposit(uint256 _amount, uint256 _id) public payable {
        PoolInfo storage pool = poolInfo[_id];
        updatePool(_id);
        stackers[_id][msg.sender] = stackers[_id][msg.sender].add(_amount); 
        pool.tokenStack.safeTransferFrom(address(msg.sender), address(this), _amount);
        emit Deposit(msg.sender, _id, _amount);
         }

    function getERCapprove(IERC20 _token, address _spender, uint256 _value) public returns (bool){
        
        return _token.approve(_spender, _value);
        }
}
