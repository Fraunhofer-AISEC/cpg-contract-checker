pragma solidity ^0.8.0;

contract Betting {
    uint256 public fee = 1000000000000000000 wei;

    address public owner;

    struct UserStruct {
        uint256 betAmount;
        uint256 potentialWinnings;
        string teamChosen;
    }

    mapping(address => UserStruct) public userStructs;
    address[] public userList;

    event LogUserBet(
        address user,
        uint256 userBetAmount,
        string userTeamChosen,
        uint256 userPotentialWinnings
    );

    function appendUserBet(string memory userTeamChosen) public payable {
        uint256 minimumFee = 1 * 10**17 wei;
        userList.push(payable(msg.sender));
        require(msg.value >= minimumFee);
        fee = msg.value;
        userStructs[msg.sender].betAmount += msg.value;
        userStructs[msg.sender].teamChosen = userTeamChosen;
    }
}