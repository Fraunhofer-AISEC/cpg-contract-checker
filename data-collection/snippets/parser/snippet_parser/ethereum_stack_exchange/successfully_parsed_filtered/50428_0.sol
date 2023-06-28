struct StateStruct {
                    mapping(bytes32 => bytes32) subState;
                }

                struct AssetStruct {
                    StateStruct state;
                    address owner; 
                    bool isAsset;
                    bytes32 review;
                    bytes32 action;
                    bytes32 player;
                    bytes32 actionState;
                    bytes32 assetSite;
                    bool isOwner;
                }

            mapping(uint256 => AssetStruct) assetStructs;
                uint256[] public assetList;

                uint256 public _public_id = 0;


       event LogNewAssetOneAction(uint256 indexed _id, bytes32 _action, bytes32 _player, bytes32 _actionState,  address _owner);

            function newAssetOneActionManualID(uint256 _id, bytes32 _action, bytes32 _player, bytes32 _actionState,  address _owner, bytes32 _assetSite) public returns(bool success) {
            require(!isAsset(_id));

            assetStructs[_id].owner = _owner;
            assetStructs[_id].isAsset = true;
            assetStructs[_id].assetSite = _assetSite;

            assetStructs[_id].action = _action;
            assetStructs[_id].player = _player;
            assetStructs[_id].actionState = _actionState;

            assetList.push(_id);

            emit LogNewAssetOneAction(uint256(_id), bytes32(_action), bytes32(_player), bytes32(_actionState), address(_owner));

            return true;
        }
