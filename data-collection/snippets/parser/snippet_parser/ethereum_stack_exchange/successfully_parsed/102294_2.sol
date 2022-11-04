contract B is A {
    uint count = 1;
    uint[]  tmp;

    function passArg(){
        tmp.push(count);
        count = count + 1;
        tmp.push(count);
        xyz(tmp);
    }
}
