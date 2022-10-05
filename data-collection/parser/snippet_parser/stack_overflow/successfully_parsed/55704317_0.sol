contract RBACFactory{
    address[] public deployedEntities;

    function createEntity(string memory name, string memory mission, string memory tokenName, 
                          string memory tokenSymbol, uint rate) public {
        address newEntity = address(new Entity(name, mission, msg.sender, tokenName, tokenSymbol, rate));
        deployedEntities.push(address(newEntity));
      
    }
    function getDeployedEntities() public view returns(address[] memory) {
        return deployedEntities;
    }
}
