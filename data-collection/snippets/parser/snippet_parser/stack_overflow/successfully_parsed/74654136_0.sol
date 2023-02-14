address public owner;

struct FoodItem {
    address owner;
    string url;
    string name;
    string originCountry;
}

FoodItem[] public foodItems;

function addFoodItem(
    string memory url,
    string memory name,
    string memory originCountry
) public {
    foodItems.push(FoodItem(msg.sender, name, url, originCountry));
}

function getFoodItemsByOwner() public view returns (FoodItem[] memory) {
    uint256 itemCount = 0;

    for (uint256 i = 0; i < foodItems.length; i++) {
        if (foodItems[i].owner == msg.sender) {
            itemCount += 1;
        }
    }

    FoodItem[] memory myfoods = new FoodItem[](itemCount);
    for (uint256 i = 0; i < foodItems.length; i++) {
        if (foodItems[i].owner == msg.sender) {
            myfoods[i] = foodItems[i];
        }
    }

    return myfoods;
}
