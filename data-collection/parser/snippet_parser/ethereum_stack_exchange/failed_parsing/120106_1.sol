function populateOne(uint8 race, uint8 strength, uint8 agility, uint8 hp,  ) external onlyOwner {
    require(!isPopulated, "Already Populated");
    characters[characters.length] = Character(race, strength, agility, hp, 0,  );
}
function setPopulated() external onlyOwner { 
    isPopulated = true;
}
