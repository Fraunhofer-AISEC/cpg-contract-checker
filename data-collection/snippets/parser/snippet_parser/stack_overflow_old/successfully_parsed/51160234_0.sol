function addRecipe(uint256 _price, string _name, string _content) public {

    recipes[recipeCount].price = _price;
    recipes[recipeCount].name = _name;
    recipes[recipeCount].content = _content;
    recipes[recipeCount].recipeOwner = msg.sender;

    recipeCount++;
}
