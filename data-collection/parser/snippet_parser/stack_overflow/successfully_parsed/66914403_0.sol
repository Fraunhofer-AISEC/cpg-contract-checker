contract Amacoin is ERC777 {
  address public amaclicker;

  constructor(address[] memory defaultOperators) ERC777("Amacoin", "AMAC", defaultOperators) {
    amaclicker = defaultOperators[0];
  }
}

contract Amaclicker {
  Amacoin public amacoin;

  constructor() {
    address[] memory defaultOperators;
    defaultOperators[0] = address(this);
    amacoin = new Amacoin(defaultOperators);
  }
}
