pragma solidity^0.4.11;

import "./AttributeStore.sol";

contract ProcessHistoryStore {
    AttributeStore.Data store;

    function getFromStore(bytes32 _UUID, string _attrName) public constant returns (uint) {
      return AttributeStore.getAttribute(store, _UUID, _attrName);
    }

    function setStore(bytes32 _UUID, string _attrName, uint _attrVal) public {
      AttributeStore.setAttribute(store, _UUID, _attrName, _attrVal);
    }

}
