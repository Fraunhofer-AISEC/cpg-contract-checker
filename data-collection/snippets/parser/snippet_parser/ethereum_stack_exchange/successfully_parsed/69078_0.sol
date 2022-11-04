contract Actual {
      function () external { }
}

interface Expected {
     function g() external returns (uint256);
}


contract MyContract {
    function g(address a) public returns (uint256 x) {
          
          x = Expected(a).g();
    }
 }
