
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract lock  {
    address public owner;
    
    struct Lock {
        address token;
        uint amount;
        uint endtime;
    }

    constructor() {
        owner = msg.sender;
    }

    mapping(address => Lock) public tokenLock;

    function locker( address _token, uint256 _amount, uint _time) public{
        
        tokenLock[msg.sender] = Lock(_token, _amount, block.timestamp + _time);
        IERC20(_token).transferFrom(msg.sender, address(this),_amount);
    }
    
    function chkBalance(address _token) public view returns (uint){
        return IERC20(_token).balanceOf(address(this));
    }

    function claim(address _token) public { 
        
        uint time = tokenLock[msg.sender].endtime;
        require(block.timestamp > time, "You must to attend your locktime!");
        address _to = msg.sender;
        uint amountTokenInSmartContract = IERC20(_token).balanceOf(address(this));
        
        IERC20(_token).transfer(_to, amountTokenInSmartContract);
    }

}
