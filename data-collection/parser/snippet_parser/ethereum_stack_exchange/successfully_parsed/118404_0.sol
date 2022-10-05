
pragma solidity >=0.4.22 <0.7.0;


interface IaToken {
    function balanceOf(address _user) external view returns (uint256);
    function redeem(uint256 _amount) external;
}

interface IERC20 {
    function totalSupply() external view returns(uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns(uint256);
    function transfer(address recipient, uint256 amount) external view returns(bool);
    function approve(address spender, uint256 amount) external view returns(bool);
    function transferFrom(address sender, address recipient, uint256 amount) external view returns(bool);
}

interface IAaveLendingPool {
    function deposit(address _reserve, uint256 _amount, uint16 _referralCode) external;
}

contract AaveExample {
    IERC20 public dai = IERC20(0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD);
    IaToken public aToken = IaToken(0x58AD4cB396411B691A9AAb6F74545b2C5217FE6a);
    IAaveLendingPool public aaveLendingPool = IAaveLendingPool(0x580D4Fdc4BF8f9b5ae2fb9225D584fED4AD5375c);
    
    mapping(address => uint256) public userDepositedDai;
    
    constructor() public {
        dai.approve(address(0xB4bE310666D2f909789Fb1a2FD09a9bEB0Edd99D), type(uint256).max);
    }
    
    function userDepositDai(uint256 _amountInDai) external {
        userDepositedDai[msg.sender] = _amountInDai;
        require(dai.transferFrom(msg.sender, address(this), _amountInDai), "DAI Transfer failed!");
        aaveLendingPool.deposit(address(dai), _amountInDai, 0);
    }
    
    function userWithdrawDai(uint256 _amountInDai) external {
        require(userDepositedDai[msg.sender] >= _amountInDai, "You cannot withdraw more than deposited!");

        aToken.redeem(_amountInDai);
        require(dai.transferFrom(address(this), msg.sender, _amountInDai), "DAI Transfer failed!");
        
        userDepositedDai[msg.sender] = userDepositedDai[msg.sender] - _amountInDai;
    }
}
