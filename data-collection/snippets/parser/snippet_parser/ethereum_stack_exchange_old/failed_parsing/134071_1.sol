contract Marketplace {
    Control internal control;
    
    function getItem(uint256 itemId) internal view returns (Item) {
        require(
            control.hasRole(control.LISTER_ROLE(), msg.sender),
            "Caller is not allowed"
        );
        return items[itemId];
    }
    ...
