contract TestContract{   

    InterfaceTest _inter;
    InterfaceContract ts = new InterfaceContract();

    function test2(address _addr) public returns(uint) {
        _inter = InterfaceTest(_addr);
        return 2;
    }


    function test4()public view returns(uint)  {
        uint t = ts.testInterface();
        return t;

    }
}
