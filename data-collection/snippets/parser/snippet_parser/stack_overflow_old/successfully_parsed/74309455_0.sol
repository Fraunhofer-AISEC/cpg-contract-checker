enum animals {CAT, DOG}
mapping(animals => int8) maps;

constructor() {
        maps[animals.CAT] = 10;
}

function decrementAnimal(string memory _animal) public {
        maps[animals._animal] -= 1;
}
