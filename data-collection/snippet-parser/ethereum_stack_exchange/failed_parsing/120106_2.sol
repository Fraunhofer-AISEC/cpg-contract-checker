
function populateAll(uint8[] races, uint8[] strengths, uint8[] agilities, uint8[] hps,  ) external onlyOwner {
    require(!isPopulated, "Already Populated");
    for (uint256 i = 0; i < type.length; i++) {
        characters[i] = Character(races[i], strengths[i], agilities[i], hps[i], 0,  );
    }
    isPopulated = true;
}

