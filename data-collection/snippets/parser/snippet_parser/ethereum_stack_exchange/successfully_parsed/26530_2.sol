contract Foo is FooInterface {   
    function a(uint _amount) public pure returns(uint amount) {
        return _amount;
    }
}
