contract MultiAsset {
    address public creator;
    mapping(string => address) assetOwner;

    event NewAsset(string  indexed assetName, address indexed to);
    event AssetTransferred(string indexed assetName, address indexed from, address indexed to);

    function MultiAsset() {
        creator = msg.sender;
    }

    function assignOwner(string assetName, address to) {
        if (msg.sender == creator) {
            
            if (assetOwner[assetName] != 0x0) {
                throw;
            } else {
                assetOwner[assetName] = to;
                NewAsset(assetName, to);
            }
        } else {
            throw;
        }
    }

    function getAssetOwner(string assetName) constant returns (address owner){
        owner = assetOwner[assetName];
        return owner;
    }


    function transfer(string assetName, address to) {
        
        if (msg.sender == assetOwner[assetName]) {
            assetOwner[assetName] = to;
            AssetTransferred(assetName, msg.sender, to);
        } else {
            throw;
        }
    }}
