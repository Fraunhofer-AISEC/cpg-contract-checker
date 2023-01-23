modifier onlyOver1000(uint input) {
  require(input > 1000, "too small");
  _;
}

function doSomething(uint amount) public onlyOver1000(amount) ...
