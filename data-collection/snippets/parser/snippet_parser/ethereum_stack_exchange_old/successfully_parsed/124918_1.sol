
pragma solidity 0.8.0;

contract Test1 {
    Menu userMenu;

    enum Menu {
        Burger,
        Pizza,
        Fries
    }

    uint price; 

    function setUseMenu(Menu _enumIndex) external {
        userMenu = _enumIndex;
    }

    function setPrice() public {
        
        if (userMenu == Menu.Burger) {
            price = 2;
        } else if (userMenu == Menu.Pizza){
            price = 4;
        } else if (userMenu == Menu.Fries) {
            price = 1;
        }
    }

    function getPrice() external view returns(uint) {
        return price;
    }
}
