contract Example {

    uint256 num;
    address parent;

    function Example(uint256 _num, address _parent) {
        num = _num;
        parent = _parent;
    }

    function createChild() {
        uint256 childNum = num + 1;
        Example child = new Example(childNum, this);
    }

    function getNumber() constant returns (uint256) {
        return num;
    }

    function getParentNumber() constant returns (uint256) {
        Example e = Example(parent);
        return e.getNumber();
    }

}
