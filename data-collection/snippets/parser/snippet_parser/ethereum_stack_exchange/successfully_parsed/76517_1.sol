pragma solidity ^0.4.24;

contract Set {
    bytes32[] public items;

    
    mapping(bytes32 => uint256) indexOf;

    function add(bytes32 value) public {
        if (indexOf[value] == 0) {
            items.push(value);
            indexOf[value] = items.length;
        }
    }

    function remove(bytes32 value) public {
        uint256 index = indexOf[value];

        require(index > 0);

        
        bytes32 lastValue = items[items.length - 1];
        items[index - 1] = lastValue;  
        indexOf[lastValue] = index;

        items.length -= 1;
        indexOf[value] = 0;
    }

    function contains(bytes32 value) public view returns (bool) {
        return indexOf[value] > 0;
    }

    function count() public view returns (uint256) {
        return items.length;
    }
}
