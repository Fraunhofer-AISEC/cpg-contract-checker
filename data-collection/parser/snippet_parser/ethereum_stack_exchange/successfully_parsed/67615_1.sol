function submission(string memory Id, string memory vId, string memory entryType, string memory hashSig, uint256[] memory list) public returns(string memory, address) {

    return(submittedObjStructs[vId].vId, address(this))
}
