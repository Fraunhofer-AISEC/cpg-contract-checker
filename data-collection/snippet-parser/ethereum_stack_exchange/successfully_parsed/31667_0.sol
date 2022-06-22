pragma solidity ^0.4.18;

import "./IterableMapping.sol";

contract User
{
    event ItemInserted(bool replaced);
    event ItemRemoved(bool success);

    
    IterableMapping.itmap data;
    
    function insert(uint k, uint v) public returns (uint size)
    {
        
        bool replaced = IterableMapping.insert(data, k, v);

        ItemInserted(replaced);

        
        return data.size;
    }

    function remove(uint k) public returns (bool success)
    {
        success = IterableMapping.remove(data, k);

        ItemRemoved(success);
    }

    
    function sum() public view returns (uint s)
    {
        for (var i = IterableMapping.iterate_start(data); IterableMapping.iterate_valid(data, i); i = IterableMapping.iterate_next(data, i))
        {
            var (, value) = IterableMapping.iterate_get(data, i);
            s += value;
        }
    }
}
