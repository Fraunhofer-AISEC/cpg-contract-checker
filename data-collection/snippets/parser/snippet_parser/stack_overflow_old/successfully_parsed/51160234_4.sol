function addRecipe(uint256 _price, string _name, string _content) public {
    Recipe memory r;
    r.price = _price;
    r.name = _name;
    r.content = _content;
    r.recipeOwner = msg.sender;

    recipes.push(r);

    recipeCount++;
}
