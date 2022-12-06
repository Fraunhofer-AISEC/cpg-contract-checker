pragma solidity ^0.4.23;
contract Baz {

    function Baz(){
        
        new Foo();
    }
}

contract Bar {

    function Bar(){
        new Foo();
    }

    function iAmBar() public pure returns(bool isIndeed) {
        return true;
    }
}

contract Foo {
    Bar bar;


    function Foo(){
        
        bar = Bar(msg.sender);
        require(bar.iAmBar());
    }
}
