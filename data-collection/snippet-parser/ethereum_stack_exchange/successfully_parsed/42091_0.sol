contract storagetest8 {

    mapping(uint256 => uint256) inventories;

    function setCharacter(address other_address, uint256 index1) 
        external 
    {
        uint256 _id = uint256(msg.sender);
        _id |= uint96(other_address)<<160;
        inventories[index1] = _id;        
    }


    function getCharacter(uint256 index1) 
        external view
    returns(address owner_address, uint256 secondpart) {
        uint256 _id = inventories[index1];
        owner_address = address(_id);
        secondpart = uint256(uint96(_id>>160));
    }

}
