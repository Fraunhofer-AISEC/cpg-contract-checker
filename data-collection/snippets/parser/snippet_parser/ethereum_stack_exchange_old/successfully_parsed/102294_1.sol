contract B is A {
    uint count = 1;

    function passArg(){
        uint[] memory  tmp;
        tmp.push(count);
        count = count + 1;
        tmp.push(count);
        xyz(amounts);
    }
}
