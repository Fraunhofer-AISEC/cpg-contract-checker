function deleteItem(uint index) public onlyOwner {
    require(index < foods.length);
    foods[index] = foods[foods.length-1];
    foods.length--;
    emit deletedItem(index, foods.length);
}
