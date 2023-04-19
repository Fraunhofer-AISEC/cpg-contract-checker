
Order NULL_ORDER;

function _tryGetOrder(uint256 proposalId, uint256 tokenId) internal view returns (bool exists, Order storage order) {
    OrderManagement storage orderManager = _orderManagementMap[proposalId];
    uint256 orderIndex = orderManager.tokenIdToOrderIncrementedIndexMap[tokenId];
    if(0 == orderIndex) {
        
        return (false, NULL_ORDER);
    }
    
    exists = true; 
    order = orderManager.orders[orderIndex - 1];
}
