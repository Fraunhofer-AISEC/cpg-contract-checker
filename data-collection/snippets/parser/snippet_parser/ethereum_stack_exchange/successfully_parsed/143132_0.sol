    mapping(uint256 => uint256) public numberOfOwners;
    mapping(uint256 => mapping(uint256 => address)) public listOwners;

    
    function getOwners(uint256 _id) public view returns (address[] memory) {
        address[] memory owners = new address[](numberOfOwners[_id]);
        for (uint256 i = 0; i < numberOfOwners[_id]; i++) {
            owners[i] = listOwners[_id][i];
        }
        return owners;
    }
