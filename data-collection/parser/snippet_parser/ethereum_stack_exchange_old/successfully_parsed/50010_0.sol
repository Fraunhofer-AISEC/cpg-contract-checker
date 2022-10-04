function fillOrder(
    Order memory order,
    uint256 takerAssetFillAmount,
    bytes memory signature
)
    public
    returns (LibFillResults.FillResults memory fillResults);

struct Order {
    address makerAddress;           
    address takerAddress;           
    address feeRecipientAddress;    
    address senderAddress;          
    uint256 makerAssetAmount;       
    uint256 takerAssetAmount;       
    uint256 makerFee;               
    uint256 takerFee;               
    uint256 expirationTimeSeconds;  
    uint256 salt;                   
    bytes makerAssetData;           
    bytes takerAssetData;           
}
