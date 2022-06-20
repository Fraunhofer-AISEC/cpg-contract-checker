pragma solidity ^0.8.14;

contract Lottery {
  address payable public burnAddress = payable(0x0000000000000000000000000000000000000000);
  uint256 public ticketsPerRound = 3;
  uint256 public ticketPrice = 0.001 * 10e8 * 10e8;
  address[] public participantAddresses;

  error WrongTicketPrice(uint256 expectedRole, uint256 actualRole);

  function buyTicket() external payable {
    if (msg.value != ticketPrice) {
      revert WrongTicketPrice(ticketPrice, msg.value);
    }

    participantAddresses.push(msg.sender);

    if (participantAddresses.length >= ticketsPerRound) {
      payWinner();
    }
  }

  function getBalance() external view returns (uint256) {
    return address(this).balance;
  }

  function getParticipantAddresses() external view returns (address[] memory) {
    return participantAddresses;
  }

  function getWinnableBalance() public view returns (uint256) {
    return address(this).balance / 2;
  }

  function getWinner() internal view returns (address payable winnerAddress) {
    uint256 unsafeRandomNumber = uint256(
      keccak256(abi.encodePacked(block.difficulty, block.timestamp, participantAddresses))
    );
    uint256 winnerIndex = unsafeRandomNumber % participantAddresses.length;
    winnerAddress = payable(participantAddresses[winnerIndex]);
  }

  function burnLeftBalance() internal {
    uint256 leftBalance = address(this).balance;

    burnAddress.transfer(leftBalance);

    reset();
  }

  function payWinner() internal {
    uint256 winnableBalance = getWinnableBalance();
    address payable winnerAddress = getWinner();

    winnerAddress.transfer(winnableBalance);

    burnLeftBalance();
  }

  function reset() internal {
    delete participantAddresses;
  }
}
