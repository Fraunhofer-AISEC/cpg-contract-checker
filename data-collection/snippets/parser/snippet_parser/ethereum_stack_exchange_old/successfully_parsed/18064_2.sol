pragma solidity 0.4.17;

contract Test {

    enum assetState{something}

    mapping(uint256 => asst) assetsById;

    struct asst {
        uint256 assetId;
        uint256 next;
        uint256 prev;
        uint256 timestampCreation;
        address assetOwner;
        address issuer;
        string content;
        uint256 sellPrice;
        assetState state;
    }

    function getAssetStructById(uint256 assetId) public view returns (asst _asset) {
        return (assetsById[assetId]);
    }

    function tryIt(uint id) public view returns(bool success) {
        asst memory a = getAssetStructById(id); 
        return true;
    }
}
