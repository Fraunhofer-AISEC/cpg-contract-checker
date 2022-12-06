struct AssetStruct {
        address owner;
        bool isOwner;
    }

    mapping(uint256 => AssetStruct) assetStructs;
    uint256[] public assetList;   
    mapping(address => uint) public balance;
    mapping(uint256 => mapping (address => mapping(address => bool))) public isPaymentDoneMutual;

function playerPaymentMutual(uint256 _id, address _player, uint256 _token)  payable public  returns(bool isIndeed) {

                address _owner;

                _owner = assetStructs[_id].owner;

                balance[_owner] = balance[_owner] + _token;

                balance[_player] = balance[_player] - _token;

                isPaymentDoneMutual[_id][_player][_owner] = true;

                        return true;
}
