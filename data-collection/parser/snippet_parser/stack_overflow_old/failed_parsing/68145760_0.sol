import "./BooStruct.sol";
import "./BarContract.sol";

contract FooContract {
  
  BarContract bar;
  
  
  BooStruct boo;
  constructor(BarContract _bar, string memory _name) {
    bar = _bar;
    boo = BooStruct(_name);
  }

  function foo() public {
    bar. 
    string memory name = boo. 
  }
}
