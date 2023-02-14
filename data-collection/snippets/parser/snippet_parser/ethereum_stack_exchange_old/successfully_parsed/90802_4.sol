pragma solidity >=0.4.0 <0.8.0;
pragma experimental ABIEncoderV2;

library PizzaLib {
    struct Pizza {
        uint256 ingredients;
    }

    function mix(Pizza calldata pizza, uint256 ingredients) external pure returns (Pizza memory) {
        Pizza memory p = pizza;
        p.ingredients = ingredients;
        return p;
    }
}

contract PizzaShop {
    using PizzaLib for PizzaLib.Pizza;
    
    function foo() public pure returns (PizzaLib.Pizza memory) {
        PizzaLib.Pizza memory pizza;
        pizza = pizza.mix(23);
        return pizza;
    }
}

