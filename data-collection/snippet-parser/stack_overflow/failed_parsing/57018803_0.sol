function getpatientbyrecordid(uint256 id) view public returns (bytes32 ,bytes32 ,  bytes32, int ) {

    return (patients[id].name,
            patients[id].regNo, 
    patients[id].address, 
            patients[id].contactno,);
}
