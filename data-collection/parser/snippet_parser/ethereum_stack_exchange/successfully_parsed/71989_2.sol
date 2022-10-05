pragma solidity 0.5.1;

contract Case1 {

    struct BB{
        mapping (uint => address) map_2;
    }

    mapping (uint => BB) map_1; 

    function getter(uint structId, uint mapId) public view returns(address) {
        return map_1[structId].map_2[mapId];
    }  
}
