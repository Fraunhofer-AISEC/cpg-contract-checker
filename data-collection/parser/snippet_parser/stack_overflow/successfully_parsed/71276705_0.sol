pragma solidity ^0.5.0;
interface IWETH {
    function deposit() external payable;
    function transfer(address to, uint value) external returns (bool);
    function withdraw(uint256 value) external payable;

}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract testwithdraw {
    uint256 public ETHAnt;
    address public WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;  

    function deposit() public payable{
        ETHAnt = msg.value;      
        IWETH(WETH).deposit.value(ETHAnt)();
    }

    function getContractBalance(address _to) public view returns(uint) {
       uint256 Balance = IERC20(WETH).balanceOf(_to);
       return Balance;
    }

    function withdraw(uint256 _value) public payable { 
        IWETH(WETH).withdraw.value(_value);
    }
}
