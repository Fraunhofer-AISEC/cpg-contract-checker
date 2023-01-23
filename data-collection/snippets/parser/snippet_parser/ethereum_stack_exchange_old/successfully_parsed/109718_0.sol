function addFood(string memory _name, uint _price, bool _available) public onlyOwner {
    foods[numberOfFoods].name = _name;
    foods[numberOfFoods].price = _price;
    foods[numberOfFoods].available = _available;
    emit addedFood(numberOfFoods, _name);
    numberOfFoods++;
}
