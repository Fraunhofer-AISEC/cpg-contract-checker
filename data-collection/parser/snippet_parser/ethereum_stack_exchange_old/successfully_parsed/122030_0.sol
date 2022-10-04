bytes32 internal constant MAKER_ORDER_HASH = 0x40261ade532fa1d2c7293df30aaadb9b3c616fae525a0b56d3d411c841a85028;
    struct MakerOrder {
        bool isOrderAsk; 
        address signer; 
        address collection; 
        uint256 price; 
        uint256 tokenId; 
        uint256 amount; 
        address strategy; 
        address currency; 
        uint256 nonce; 
        uint256 startTime; 
        uint256 endTime; 
        uint256 minPercentageToAsk; 
        bytes params; 
        uint8 v; 
        bytes32 r; 
        bytes32 s; 
    }
