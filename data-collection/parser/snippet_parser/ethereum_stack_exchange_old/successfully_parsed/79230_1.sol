pragma solidity >=0.4.0 <0.6.0;

contract test013 {

    
    
    
    address public owner = msg.sender;

    
    mapping (uint256 => string ) private storedData;

    modifier isOwner() {    
        require(owner == msg.sender);
        _;
    }

    modifier dataNotStored(uint256 _index) {
        require( keccak256(abi.encodePacked(storedData[_index])) == keccak256(abi.encodePacked('')) );
        _;
    }

    function set(uint _index, string calldata _data_to_store) external dataNotStored(_index) {
        storedData[_index] = _data_to_store;
    }

    function forceSet(uint _index, string calldata _data_to_store) isOwner external {
        storedData[_index] = _data_to_store;
    }

    function get(uint _index) public view returns (string memory) {
        return storedData[_index];
    }
}
