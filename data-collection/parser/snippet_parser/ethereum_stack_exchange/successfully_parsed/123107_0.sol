
pragma solidity ^0.8.0;

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

interface IWETH is IERC20 {
    function deposit() external payable;
    function withdraw(uint) external;
}

contract Scrath {

    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function sendEth() external payable {
        if(msg.value < 1000) {
            revert();
        }
    }

    function ethBalance() public view returns(uint256 _balance) {
        _balance =  address(this).balance;
        return _balance;
    }

    function convertToWeth() external payable {
        uint256 eth = ethBalance();
        IWETH(weth).deposit{value: eth}();
    }

    function wethBalance() external view returns(uint256 _balance) {
        _balance = IWETH(weth).balanceOf(address(this));
        return _balance;
    }

}
