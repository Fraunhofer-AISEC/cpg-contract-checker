pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract MockERC20 is ERC20 {
    constructor() ERC20('test', 'test'){
        _mint(msg.sender, 100 ether);
    }
}

contract Tickets {
    using SafeERC20 for MockERC20;

    uint public ticketPrice = 1 ether;
    address[] public tickets;

    function BuyTickets(MockERC20 token, uint ticketAmount) public returns(bool) {

    uint amount = ticketAmount * ticketPrice;

    require(token.allowance(msg.sender, address(this)) >= amount, "Please approve tokens before transferring");

    require(ticketAmount <= RemainingTickets(),"Not enough tickets available.");

    for (uint256 i = 0; i < ticketAmount; i++) {
        tickets.push(msg.sender);
    }

    token.safeTransferFrom(msg.sender, address(this), amount);

    return true;
 }
 function RemainingTickets() public returns(uint) {
     return 10000000;
 }
}
