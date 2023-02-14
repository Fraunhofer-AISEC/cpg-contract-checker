modifier things {
  require(isThing());
  _;
}

modifier nothings {
  require(!isThing());
  _;
}

function isThing() ... returns(bool) {
  
}
