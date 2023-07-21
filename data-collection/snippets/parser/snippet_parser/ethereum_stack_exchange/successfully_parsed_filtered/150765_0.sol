function fulfillOrder(
    Order calldata order,
    bytes32 fulfillerConduitKey
) external payable returns (bool fulfilled);

struct Order {
    OrderParameters parameters;
    bytes signature;
}

struct OrderParameters {
    address offerer; 
    address zone; 
    OfferItem[] offer; 
    ConsiderationItem[] consideration; 
    OrderType orderType; 
    uint256 startTime; 
    uint256 endTime; 
    bytes32 zoneHash; 
    uint256 salt; 
    bytes32 conduitKey; 
    uint256 totalOriginalConsiderationItems; 
    
}

struct OfferItem {
    ItemType itemType;
    address token;
    uint256 identifierOrCriteria;
    uint256 startAmount;
    uint256 endAmount;
}

struct ConsiderationItem {
    ItemType itemType;
    address token;
    uint256 identifierOrCriteria;
    uint256 startAmount;
    uint256 endAmount;
    address payable recipient;
}

enum OrderType {
    FULL_OPEN,
    PARTIAL_OPEN,
    FULL_RESTRICTED,
    PARTIAL_RESTRICTED,
    CONTRACT
}
