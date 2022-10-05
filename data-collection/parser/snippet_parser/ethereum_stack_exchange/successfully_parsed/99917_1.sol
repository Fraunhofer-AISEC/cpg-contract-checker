contract A {
    function buyItem(bytes32 itemId) external payable {
        doBuyItem(itemId, msg.value);
    }
 
   function buyItems(bytes32[] memory items, uint256[] memory prices) external payable {
        for (uint256 i=0; i<items.length; i += 1) {
            doBuyItem(items[i], prices[i]);
        }
    }

    function doBuyItem(bytes32 itemId, uint256 price) internal {
         
    }
}
