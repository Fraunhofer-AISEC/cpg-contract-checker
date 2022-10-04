function getOrgan(bytes32 _organHash) public view returns(address OriginOwner, address CurrentOwner, string OrganType, string OrganState) {
        
        require(bytes(organsList[_organHash].organState).length != 0, "Organ with given id doesn't exist!");
        return (
            organsList[_organHash].originOwner,
            organsList[_organHash].currentOwner,
            organsList[_organHash].organType,
            organsList[_organHash].organState
        );
    }
