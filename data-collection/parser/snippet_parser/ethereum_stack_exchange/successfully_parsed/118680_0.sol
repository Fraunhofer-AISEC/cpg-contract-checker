
pragma solidity ^ 0.8.10;

contract VendingMachine {

    address payable internal vendingAdmin;

    struct item {
        string itemName;
        uint8 itemPrice;
        uint8 inventory;
        bool inStock;
    }
    
    item[] public Items;

    constructor() {
        payable(msg.sender) == vendingAdmin;
        Items.push(item("Dr. Pepper", 5, 1, true));
        Items.push(item("Pepsi", 5, 1, true));
        Items.push(item("Fiji Water", 10, 1, true));
    }

    receive() external payable {}

    function seeAvailableItems(uint8 index) public view returns (string memory, uint8, uint8, bool) {
        require(index < 3 , "There are only 3 items in this vending machine. Please enter an index between 0 and 2, inclusive.");
        item storage vendingItemInfo = Items[index];
        return (vendingItemInfo.itemName, vendingItemInfo.itemPrice, vendingItemInfo.inventory, vendingItemInfo.inStock);
    }

    function buyDrPepper() public payable {
        require(Items[0].inStock == true);
        require(msg.value == Items[0].itemPrice , "You have not paid enough for this item!");
        vendingAdmin.transfer(msg.value);
        
        Items[0].inventory--;
        if (Items[0].inventory == 0) {
            Items[0].inStock == false;
        } 
    }

    function buyPepsi() public payable {
        require(Items[1].inStock == true);
        require(msg.value == Items[0].itemPrice , "You have not paid enough for this item!");
        vendingAdmin.transfer(msg.value);
        
        Items[1].inventory--;
        if (Items[1].inventory == 0) {
            Items[1].inStock == false;
        } 
    }

    function buyFijiWater() public payable {
        require(Items[2].inStock == true);
        require(msg.value == Items[0].itemPrice , "You have not paid enough for this item!");
        vendingAdmin.transfer(msg.value);
        
        Items[2].inventory--;
        if (Items[2].inventory == 0) {
            Items[2].inStock == false;
        } 
    }

}
