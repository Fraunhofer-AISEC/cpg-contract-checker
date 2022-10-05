 contract Foo {
     address constant FACTORY_ADDRESS = [known address]
     address private _owner;
     address private _parent;
     string private _color;
     
     constructor(string memory color_, address owner_) {
          require(msg.sender == FACTORY_ADDRESS, "not authorized");     
          _parent = msg.sender;
          _owner = owner_;
          _color = color_;
     }
     function getColor() public view returns(string memory) {
          return _color;
      } 
     function owner() public view returns(address) {
        return _owner;
     }
     function parent() public view returns(address) {
        return _parent;
     }
    
}

contract FooFactory {
    function makeFoo() public {
         color = [some randomizer function that picks colors]
         Foo newFoo = new Foo(color, msg.sender);
    }
}

contract PayWinner {

     address private factoryAddress = [known factory address]
     mapping(address=>bool) private paidWinners;
    
     function checkFoo(address fooAddress) {
        require(Foo(fooAddress).parent()==factoryAddress, "fake foo!")  <---
        if (Foo(fooAddress.color().equals("yellow") {
           
           payWinner(Foo(fooAddress).owner());
        }
     }
     function payWinner(address winner) internal {
       [...]
     }
  }
     
