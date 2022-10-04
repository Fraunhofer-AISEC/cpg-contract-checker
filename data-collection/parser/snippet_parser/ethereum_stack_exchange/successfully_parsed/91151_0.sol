pragma solidity >=0.4.0 <0.8.0;

library PizzaLib {

    struct Pizza {
       uint256 pieSize;
       string ingredients;
    }

    function mix(Pizza calldata pizza, uint256 pSize, string theIngredients) external pure returns (Pizza memory) {
        Pizza memory newPizza = pizza;
        newPizza.pieSize = pSize;
        newPizza.ingredients = theIngredients;

        return newPizza;
    }
}
