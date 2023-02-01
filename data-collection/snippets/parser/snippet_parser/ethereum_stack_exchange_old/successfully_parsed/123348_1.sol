contract A {
event E(string msg);

function e() public {
    require(false, "BUM!");
    emit E("hello");
}
}

contract Test {
  A a = new A();

  event E(bytes data);

  function test() public {
    (bool res, bytes memory returnData) = address(a).call(abi.encode(A.e.selector));
    try A.e.selector
    {
        
    }
    catch (bytes memory reason) {
        emit E(reason);
    }
  }
}
