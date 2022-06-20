contract Mappulator {
    mapping(address => int256) public BigMap;
    struct mapper { mapping (address => int256) map;}

    function MappingCombiner(mapper map1, mapper map2){ 
        BigMap = map1.map + map2.map;
    }
} 
