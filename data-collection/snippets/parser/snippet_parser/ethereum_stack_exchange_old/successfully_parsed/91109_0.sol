pragma solidity >=0.4.23 <0.6.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract SmartMatrix is IERC20 {
    IERC20 private _token;
    constructor(IERC20 token) public {
        _token = token;
    }
    function sendERC20TokeToDnividends(address sender, address recipient, uint256 amount) public returns (bool) {    
        _token.transferFrom(sender, recipient, amount);
        return true;
    }
}
