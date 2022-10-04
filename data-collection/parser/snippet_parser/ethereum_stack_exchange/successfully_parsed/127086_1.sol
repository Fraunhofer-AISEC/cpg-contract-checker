
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract lock  {
    address public owner;
    
    struct Lock{
        address token;
        uint amount;
        uint endtime;
    }
    
    constructor() {
        owner= msg.sender;
    }

    mapping(address => Lock) public tokenLock;

    function locker(address _token, uint256 _amount, uint _time) public {    
        tokenLock[msg.sender]= Lock(_token, _amount, _time);
        IERC20(_token).transferFrom(msg.sender, address(this),_amount);
    }

    function getBalanceSmartContract(address _token) external view returns(uint) {
        return IERC20(_token).balanceOf(address(this));
    }
    
}
