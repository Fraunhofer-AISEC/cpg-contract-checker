contract A {
    uint num;
    function setNum(uint target) public onlyB {
        num=target;
    }
}

contract B{...}
