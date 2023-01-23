    

pragma solidity >=0.7.0 <0.9.0;


interface IERC721 {
    function transferFrom(address from, address to, uint256 tokenId)external;
}

contract BulkTransferer {
    IERC721 collection;
    address owner;

    constructor() {
        owner = msg.sender;
    }

modifier isOwner {
    require(msg.sender == owner);
    _;
}

function bulkTransfer(address _from, address _to, uint256[] memory _tokenIds, address[] memory contracts) external {
    for (uint256 i = 0; i < _tokenIds.length; i++) {
        collection = IERC721(contracts[i]);
        collection.transferFrom(_from, _to, _tokenIds[i]);
    }
}

function destroySmartContract(address payable _to) public isOwner {
    selfdestruct(_to);
}
}