function createNewPot(string memory _name, string memory _description) public {
        uint newPotIndex = lastPotIndex++;
        potList[newPotIndex] = new Pot(this, newPotIndex, _name, _description, msg.sender);
}
