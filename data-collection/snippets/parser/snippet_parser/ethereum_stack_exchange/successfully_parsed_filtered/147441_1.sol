function equals(user_details memory _userA, user_details memory _userB) internal view returns (bool) {
        
        return(keccak256(abi.encodePacked(_userA._attributeA, _userA._attributeB)) == keccak256(abi.encodePacked(_userB._attributeA, _userB._attributeB)));
    }
