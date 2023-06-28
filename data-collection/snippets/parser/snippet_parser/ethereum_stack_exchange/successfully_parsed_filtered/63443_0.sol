contract parentContract {

    uint num = 1;

    function setNum(uint _n) public returns(uint) {
        num = _n;
        return num;
    }
    function getNum() public view returns(uint) {
        return num;
    }
}
