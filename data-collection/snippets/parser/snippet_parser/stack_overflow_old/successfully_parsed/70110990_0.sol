pragma solidity 0.7.5;

import "./SafeERC20.sol";
import "./Ownable.sol";

contract BusdtoRahi is Ownable {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    IERC20 public BUSD; 
    IERC20 public RAHI;

    uint256 public price = 2 * 1e18; 

    bool public started; 

    bool public ended; 

    bool public contractPaused; 


    event Deposit(address indexed who, uint256 amount);
    event SaleStarted(uint256 block);
    event SaleEnded(uint256 block);
    event AdminWithdrawal(address token, uint256 amount);

    constructor(
        address _RAHI,
        address _BUSD
    ) {
        require( _RAHI != address(0) );
        RAHI = IERC20(_RAHI);
        require( _BUSD != address(0) );
        BUSD = IERC20(_BUSD);
    }
    modifier checkIfPaused() {
        require(contractPaused == false, "contract is paused");
        _;
    }

    function setPrice(uint256 _price) external onlyOwner {
        require(!started, "Sale has already started");
        price = _price * 1e18;
    }

    function start() external onlyOwner {
        require(!started, "Sale has already started");
        started = true;
        emit SaleStarted(block.number);
    }

    function end() external onlyOwner {
        require(started, "Sale has not started");
        require(!ended, "Sale has already ended");
        ended = true;
        emit SaleEnded(block.number);
    }

    function togglePause() external onlyOwner returns (bool){
        contractPaused = !contractPaused;
        return contractPaused;
    }

    function adminWithdraw(address _token, uint256 _amount) external onlyOwner {
        IERC20( _token ).safeTransfer( address(msg.sender), _amount );
        emit AdminWithdrawal(_token, _amount);
    }

    function deposit(uint256 _amount) external checkIfPaused {
        require(started, 'Sale has not started');
        require(!ended, 'Sale has ended');
   
        uint256 payout = _amount.mul(1e18).div(price).div(1e9); 

        BUSD.approve(address(this), _amount);
        BUSD.allowance(msg.sender, address(this));
        BUSD.safeTransferFrom(msg.sender, address(this), _amount);
        
        RAHI.approve(msg.sender, payout);
        RAHI.allowance(address(this), msg.sender);
        RAHI.safeTransferFrom(address(this),msg.sender, payout);

        emit Deposit(msg.sender, _amount);
    }
    



}
