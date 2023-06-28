contract AddressBook {

    struct ownerInfo{
        string ownerAlias;
    }

    string[] Alias;

    mapping(address => ownerInfo) public ownerToAlias;

    function createBook(string memory _ownerAlias) public{
        for(uint i = 0; i <= Alias.length; i++) {
            require(keccak256(abi.encodePacked(_ownerAlias)) != keccak256(abi.encodePacked(Alias[i])));
            ownerToAlias[msg.sender] = ownerInfo(_ownerAlias);
            Alias.push(_ownerAlias);
        }
        
    }

}
