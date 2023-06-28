contract IdManager {
    uint256 public newId;

    function addId() public {
        newId++;
    }

    function getId() public view returns (uint256) {
        return newId;
    }
}
