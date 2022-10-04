
pragma solidity ^0.8.4;

interface IFoo {
    struct Point {
        uint x;
        uint y;
    }

    
    function foo (address) external view returns(uint, uint);

    
    function bar (address) external view returns (Point memory);

}

contract Foo is IFoo{

    
    mapping (address => IFoo.Point) public override foo;

    
    mapping (address => IFoo.Point) _bar;

    
    function bar(address key) public view override returns (Point memory) {
        return _bar[key];
    }
}
