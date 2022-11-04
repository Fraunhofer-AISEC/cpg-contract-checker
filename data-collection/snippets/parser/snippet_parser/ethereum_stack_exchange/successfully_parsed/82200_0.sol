contract OverloadedContract {
    function foo(uint x) external payable returns(uint) {
        
        return x;
    }

    function foo(int x) external payable returns(int) {
        
        return x;
    }
}

interface IOverloadedContract {
    function foo(uint x) external payable returns(uint);
    function foo(int x) external payable returns(int);
} 

contract CallingContract {
    IOverloadedContract Ioc;
    constructor(address payable _addr) public {
        Ioc = IOverloadedContract(_addr);
    }

    function callIoc(uint x) external payable {
        uint result = Ioc.foo{value:1000}(x);
    }
}
