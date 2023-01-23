

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract XYZ is Ownable{
    
    uint256 public counter;
    address token;
    address _owner;

    constructor(address _token){
        token = _token;
        _owner = msg.sender;
    }

    function  convert(uint _ammount) public payable {
        
        uint _minammount = 5 * (10**18);
        require(_ammount >= _minammount,"Amount less than minimum amount" );
        IERC20(token).transferFrom(msg.sender, _owner, _ammount);
    }

}
