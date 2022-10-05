
uint256 uniqueId;


struct AccDetails {
    string accNickName;
    uint256 creationTimeStamp;
}
mapping(address => AccDetails) public accDetails;

mapping(address => uint256) public balanceOf;
mapping(address => uint256) addrTouniqueIdentifier;
mapping(uint256 => address) uniqueIdentifierToAddr;


constructor() {
    uniqueId = 1;
}


function createAccount(string memory _accNickName) public {
    if(accDetails[msg.sender].creationTimeStamp == 0) {
        accDetails[msg.sender] = AccDetails(_accNickName, block.timestamp);
        addrTouniqueIdentifier[msg.sender] = uniqueId;
        uniqueIdentifierToAddr[uniqueId] = msg.sender;

        emit accountCreated(msg.sender,_accNickName, block.timestamp);

        uniqueId = uniqueId.add(1);
    }else {
        revert("You already have an account created.");
    }
}
