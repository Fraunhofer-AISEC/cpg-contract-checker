function getOrgan(bytes32 _organHash) checkOrganExistence(_organHash) public view returns(address OriginOwner, address CurrentOwner, string OrganType, string OrganState) {
        
        return (
            organsList[_organHash].originOwner,
            organsList[_organHash].currentOwner,
            organsList[_organHash].organType,
            organsList[_organHash].organState
        );
    }
