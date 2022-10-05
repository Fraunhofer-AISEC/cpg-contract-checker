contract Dummy{
    uint8[] public arr_1 = new uint8[](4);
    uint8[] public arr_2 = [0,0,0,0];
 
    function f() public pure {
        uint[3] memory arr_3;
        uint[] memory arr_4 = new uint[](3);
    }
}
