pragma solidity ^0.5.1;

import "https://github.com/rob-Hitchens/UnorderedKeySet/blob/master/contracts/HitchensUnorderedKeySet.sol";

contract Filter {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;
    HitchensUnorderedKeySetLib.Set filterSet;

    struct FilterStruct {
        string name;
        string tag;
    }


    mapping(bytes32 => FilterStruct) public filters;

    event LogNewFilter(address sender, bytes32 key, string Filternamename);

    function newFilter(bytes32 key, string memory name) public {
        filterSet.insert(key);
        FilterStruct storage f = filters[key];
        f.name = name;


        emit LogNewFilter(msg.sender, key, name);
    }

}
