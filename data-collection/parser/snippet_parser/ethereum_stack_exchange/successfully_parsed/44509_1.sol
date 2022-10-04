pragma solidity ^0.4.2;

contract Game {
    address public owner;

    
    mapping(uint256 => Recipe) private recipeInfo;

    struct Recipe {
        uint256 recipeId;
        uint256[] ingredientId;
        uint256[] ingredientAmount;
        uint256 ethCost;
    }

    
    function Game() public {
        owner = msg.sender;
        recipeInfo[1] = Recipe(1, [1, 5], [100, 100], 50000000);
        recipeInfo[2] = Recipe(2, [2, 3, 4], [100, 200, 300], 100000000);
    }
}
