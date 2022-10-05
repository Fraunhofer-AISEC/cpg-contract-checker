pragma solidity ^0.4.24;

contract Recipes {

    address owner;
    uint256 recipeCount = 0;

    struct Recipe {
        string name;
        string content;
        uint256 price;
        address recipeOwner;
    }

    Recipe[] public recipes;

    function () public {
        owner = msg.sender;
    }

    function kill() public {
        require (msg.sender == owner);
        selfdestruct(owner);
    }


    function addRecipe(uint256 _price, string _name, string _content) public {

        recipes[recipeCount].price = _price;
        recipes[recipeCount].name = _name;
        recipes[recipeCount].content = _content;
        recipes[recipeCount].recipeOwner = msg.sender;

        recipeCount++;
    }

    function showRecipes(uint256 _id) constant returns(string) {

        return recipes[_id].content;

    }

}
