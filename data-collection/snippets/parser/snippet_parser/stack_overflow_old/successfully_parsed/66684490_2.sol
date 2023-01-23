function returnPet(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);

    adopters[petId] = address(0);

    return petId;
}
