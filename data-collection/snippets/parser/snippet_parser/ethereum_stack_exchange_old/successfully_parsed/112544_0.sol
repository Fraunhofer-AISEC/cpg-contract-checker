

pragma solidity ^0.8.0;

import "../collection/Collection.sol";
import "./ICollectionManager.sol";

contract CollectionManager is ICollectionManager {
    address[] private collections;

    
    mapping(address => address[]) private collectionsOf;

    function createCollection(
        string memory _uri,
        string memory _name,
        string memory _symbol,
        uint256 _startingAt,
        address[] memory _payees,
        uint256[] memory _shares
    ) public {
        Collection collection = new Collection(
            _uri,
            _name,
            _symbol,
            _startingAt,
            _payees,
            _shares
        );

        collections.push(address(collection));
        collectionsOf[msg.sender].push(address(collection));

        emit CollectionCreated(msg.sender, address(collection));
    }

    function create(
        address payable _collectionAddress,
        string calldata _cid,
        uint256 _maxSupply
    ) external {
        Collection(_collectionAddress).create(_cid, _maxSupply);
    }

    function mint(
        address payable _collectionAddress,
        address _account,
        uint256 _id
    ) external {
        Collection(_collectionAddress).mint(_account, _id);
    }

    function getCollections() external view returns (address[] memory) {
        return collections;
    }

    function getCollectionForArtist(address _artist)
        external
        view
        returns (address[] memory)
    {
        return collectionsOf[_artist];
    }
}

