function get10Items(uint id) public view returns (uint[10]) {
    uint[10] memory array = [0,0,0,0,0,0,0,0,0,0];
    for (uint i=0; i<10; i++) {
        array[i] = foo[id][i].x;
    }
    return array;
}
