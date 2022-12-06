function AddUser(string namestring,string linkstring,string docConventionstring) public{                
    bytes32 name=keccak256(abi.encodePacked(namestring));
    bytes32 link=keccak256(abi.encodePacked(linkstring));
    bytes32 docConvention=keccak256(abi.encodePacked(docConventionstring));
    uint32 existingTotalPoints=userTotalPoints(name);
    uint32 totalPoints=existingTotalPoints+firstTimeUserPoints;
    struUsers.push(struUser(name,link,docConvention, false,firstTimeUserPoints,totalPoints));
}
