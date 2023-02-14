
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Raffle is Initializable {
    uint256 public ticketPrice;
    address public raffleAdmin;
    address public raffleOwner;

    function initialize(uint256 _ticketPrice, address _raffleOwner) public payable initializer {
        ticketPrice = _ticketPrice;
        raffleAdmin = msg.sender;
        raffleOwner = _raffleOwner;
    }
}
