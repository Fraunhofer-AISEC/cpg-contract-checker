pragma solidity 0.8.4;

contract Owned {
    address public owner;

    constructor(address _owner) public {
        owner = _owner;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract Router is Owned {
    struct OpenSeaBuy {
        address a;
    }

    address public openSeaMarketV2 = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    constructor() Owned(msg.sender) public {
    }

    function buyAsset(OpenSeaBuy memory openSeaBuys, bool revertIfTrxFails) public payable {

        (bool success, bytes memory result)=openSeaMarketV2.delegatecall(abi.encodeWithSignature("buyAssetsForEth((address),bool)",openSeaBuys,revertIfTrxFails));
        require(success, 'Delegate Call failed');

    }

    receive() payable external {}

    function contractAddress()
    external view
    returns (address)
    {
        return address(this);
    }

}
