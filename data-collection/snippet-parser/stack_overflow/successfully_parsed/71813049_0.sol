    mapping(address => uint256[]) public owns;

function checkInventory() public view returns (uint256[] memory) {
        require(owns[msg.sender].length != 0, "Inventory is empty");
        uint256[] memory inventory;
        for (uint256 i = 0; i < owns[msg.sender].length; i++) {
            inventory[i] = owns[msg.sender][i];
        }
        return (inventory);
    }
