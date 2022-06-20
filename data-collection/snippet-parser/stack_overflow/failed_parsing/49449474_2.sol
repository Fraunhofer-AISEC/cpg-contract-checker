contract A {
    uint public target;
    function setTarget(uint _target) public {
        target = _target;
    }
}

contract B {
    A a = Test(0x123abc...);  
    function editA() public {
        a.setTarget(1);
    }
}
