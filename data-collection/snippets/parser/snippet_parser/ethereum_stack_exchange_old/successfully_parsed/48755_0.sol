function AddUser(string namestring,string linkstring,string docConventionstring) public{                          
    bytes32 name=keccak256(abi.encodePacked(namestring));
    bytes32 link=keccak256(abi.encodePacked(linkstring));
    bytes32 docConvention=keccak256(abi.encodePacked(docConventionstring));
    uint32 existingTotalPoints=userTotalPoints(name);
     var user=bytesMappingToken[name];
    user.orginalName=name;
    user.originalKshoplink=link;
    user.validated=false;
    user.Points=firstTimeUserPoints;
    user.totalPoints=existingTotalPoints+firstTimeUserPoints;
    updateUserTotalPoints(name,user.totalPoints);
    user.orginalDocumentConvention=docConvention;
    struUsers.push(user);             
}
