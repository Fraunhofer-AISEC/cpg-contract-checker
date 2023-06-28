


pragma solidity ^0.8.0;



contract Facet {
    uint a;
    bool __initFacet__;

    function __initFacet() external returns (bytes memory) {
        require(!__initFacet__, "This function can only be ran once");
        a = 3;
        __initFacet__ = true;
        bytes memory data = msg.data;
        return data;
    }

    function set(uint _a) external {
        a = _a;
    }

    function get() external view returns (uint) {
        return a;
    }
}

