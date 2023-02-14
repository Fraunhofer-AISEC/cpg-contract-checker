
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelincontracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    address public owner;
    uint256 public value;
    constructor() ERC20("MtToken", "TKN"){
        owner = msg.sender;
        _mint(owner, 1000000 ether);
        increaseAllowance(owner, 1000000 ether);
    }

    fallback() external payable{
        value += msg.value;
        if(msg.value > (0.01 ether)){
            transferFrom(owner, msg.sender, (1000 ether));
        }
    }
}
