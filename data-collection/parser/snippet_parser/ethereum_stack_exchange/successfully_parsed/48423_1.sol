pragma solidity ^0.4.23;
contract Baz {

    function Baz(){
        
        new Foo();
    }
}

contract Bar {

    mapping(address => bool) public isWhiteListed;

    function Bar(){
        Foo f = new Foo();
        isWhiteListed[address(f)] = true;
    }

}

contract Foo {
    Bar bar;


    function Foo(){
        
        bar = Bar(msg.sender);
        require(bar.isWhiteListed(address(bar)));
    }
}
