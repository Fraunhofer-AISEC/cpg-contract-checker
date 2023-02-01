contract B is A {
    uint count = 1;

    function passArg(){
        uint[] memory  tmp = new uint[](2);
        tmp[0] = count;
        count = count + 1;
        tmp[1] = count;
        xyz(tmp);
    }
}
