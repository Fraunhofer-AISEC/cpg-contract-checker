pragma solidity 0.8.7;

contract Test {

    struct UserStruct {
        uint256 betAmount;
        uint256[] potentialWinnings;
        string teamChosen;}

    mapping(address => UserStruct[]) public userStructs;

    function appendUserBet(string memory userTeamChosen,uint256 eventNumber) public payable {
        UserStruct memory userStruct = UserStruct(msg.value,new uint256[](0),userTeamChosen);
        userStructs[msg.sender].push(userStruct);}

    function updatePotentialWinnings(uint256 eventNumber,address userId,uint256[] memory potentialWinnings) public {
        userStructs[userId][eventNumber].potentialWinnings = potentialWinnings;}}
