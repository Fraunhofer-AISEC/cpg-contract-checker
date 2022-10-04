contract Contract {
    uint[] public large_array;

    function read(uint cursor, uint length) public view returns (uint[] memory) {
        uint[] memory array = new uint[](length);
        for (uint i = cursor; i < cursor+length; i++) {
            array[i] = large_array[i];
        }
        return array;
    }
}
