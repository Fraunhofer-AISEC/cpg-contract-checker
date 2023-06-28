pragma solidity 0.5.12;

    contract ArrayMapping {

    struct MyStruct {
        uint part1;
        bool part2;
    }

    struct MapStruct {
        mapping(uint => MyStruct) myStructs;   
    }

    MapStruct map;

    function get(uint index) public view returns(uint, bool) {
        return fetch(map, index);
    }

    function fetch(MapStruct storage m, uint index) internal view returns(uint, bool) {
        return (m.myStructs[index].part1, m.myStructs[index].part2);
    }
}
