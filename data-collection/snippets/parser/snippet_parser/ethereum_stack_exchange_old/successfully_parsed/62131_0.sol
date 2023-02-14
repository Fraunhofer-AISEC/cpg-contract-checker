contract AssetTracker {
    struct Asset {
        string name;
        string description;
        string manufacturer;
        uint price;
        uint id;
        address owner;
        bool initialized;
    }
    Asset[] public assets;
    mapping(address => mapping(uint => bool)) public walletStore;

    function createAsset(string _name, string _description, string _manufacture, uint _price, uint id) public {
        Asset memory newAsset = Asset(_name, _description, _manufacture, _price, id, msg.sender, true);
        assets.push(newAsset);
        walletStore[msg.sender][id] = true;
    }
}
