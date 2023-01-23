
pragma solidity 0.8.13;

import "./Store.sol";

contract StoreFactory {
    uint256 id;
    mapping(uint256 => Store) storeMapping;
    
    function createStore() public {
        Store store = new Store();
        store.transferOwnership(msg.sender());
        storeMapping[id] = child;
        id++;
    }

    function depositEth(uint256 _id) public {
        storeMapping[_id].depositEth();
    }

    function withdrawEth(uint256 _id) public {
        storeMapping[_id].withdrawEth();
    }
}
