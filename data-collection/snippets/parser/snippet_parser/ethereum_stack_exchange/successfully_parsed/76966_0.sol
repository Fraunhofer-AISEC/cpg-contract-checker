mapping(bytes32 => Contract) public contracts;
bytes32[] public idList;
struct Contract {
        uint data;
        uint vintage;
}
