struct UserStruct {
    uint256 betAmount;
    uint256 matchId;}

mapping(address => UserStruct[]) public userStructs;

function appendUserBet( uint256 eventNumber) public payable{
    UserStruct memory userStruct = UserStruct(msg.value, eventNumber);
    userStructs[msg.sender].push(userStruct);}

function userStructLookUp(uint eventNumber, address userId) public view returns (UserStruct memory){   
        uint index = userStructs[userId].length;
        for (uint i = 0; i < index; i++) {
            if (userStructs[userId][i].matchId == eventNumber) {
                return userStructs[userId][i];}}}
