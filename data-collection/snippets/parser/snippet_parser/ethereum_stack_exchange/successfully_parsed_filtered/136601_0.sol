

pragma solidity 0.8.16;



interface IMyContract {

    struct Foo {
        uint x;
        address[] instances;
    }

    function doSomething(uint a) external;
}







contract MyContract is IMyContract {

    Foo foo; 

    
    function doSomething(uint a) external {
        
    }
}
