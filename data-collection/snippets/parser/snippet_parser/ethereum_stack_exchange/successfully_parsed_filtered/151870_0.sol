
pragma solidity ^0.8.19;

import 'forge-std/Test.sol';
import '../src/A.sol';
import '../src/B.sol';
import '../src/C.sol';
import 'openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol';

contract ProxyTest is Test {
  address me;

  ERC1967Proxy proxy;
  A firstImpl;
  A _proxy;
  B proxy2;

  function setUp() public {
    firstImpl = new A();
    proxy = new ERC1967Proxy(address(firstImpl), '');
    _proxy = A(address(proxy));  
    B b = new B();
    _proxy.upgradeTo(address(b));

    C c = new C();
    _proxy.upgradeTo(address(c));
    vm.deal(address(me), 5 ether);
    vm.startPrank(address(me));
  }

  function testVersion() public {
    assertEq(_proxy.returnVersion(), 2);  
  }

    function testNumber() public {
        assertEq(_proxy.returnNumber(), 1);
    }
}
