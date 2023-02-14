function addKhatianFromOld(uint64 _khatianiId, bytes32 _plotHash, uint16 _percentOwn, bytes32 _buyFrom, uint[] _user, uint16[] _percentage) public{
        require(msg.sender == contarctOwner, "Sender is not authorized");
        require(plotMapping[_plotHash].isExist == true, "Plot doesn't exist");
        
        bytes32 khatianHash = keccak256(abi.encodePacked(_khatianiId, _plotHash));
        
        require(khatianMapping[khatianHash].isExist != true, "Khatian already exists");
        require(khatianMapping[_buyFrom].isExist, "previous Khatian doesn't exist");
        require(khatianMapping[_buyFrom].percentOwn >= _percentOwn, "Not enough land to sell");
        for(uint j = 0; j< _user.length; j++){
             require(userMapping[_user[j]].isExist == true, "User's NID doesn't exist");
        }
