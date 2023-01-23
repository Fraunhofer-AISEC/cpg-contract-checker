contract Test {

    struct SomeStruct {
        uint256 a;
        uint256 b;
        uint256 c;
    }

    SomeStruct[] public structs;

    function pushStruct() {
        SomeStruct memory s;
        structs.push(s);
   }

}
