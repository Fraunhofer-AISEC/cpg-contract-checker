

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Faucet {
    address payable owner;
    IERC20 private _token;
    uint256 public withdrawalAmount = 50 * (10 ** 18);

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    constructor (IERC20 token) {
        _token = token;
        owner = payable(msg.sender);
    }

    
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    
    function withdraw() public {
        
        require(
            withdrawalAmount <= 1000 * (10 ** 18),
            "Request exceeds maximum withdrawal amount of 1000 ICHC"
          );

        require(
            _token.balanceOf(address(this)) >= withdrawalAmount,
            "Insufficient balance in faucet for withdrawal request"
        );

        require(
            msg.sender != address(0),
            "Request must not originate from a zero account"
        );

        
        _token.transfer(msg.sender, withdrawalAmount);
    }

    
    function setWithdrawalAmount(uint256 amount) public onlyOwner {
        
        require(amount <= 10000 * (10 ** 18));
        withdrawalAmount = amount * (10 ** 18);
    }

    
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    
    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}
