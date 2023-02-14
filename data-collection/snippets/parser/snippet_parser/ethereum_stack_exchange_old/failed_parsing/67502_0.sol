modifier onlyIfAllowed() {
  require(isItOkay(args));
  _;
}

function isAllowed() public view returns(bool allowed) {
  allowed = ...
}

function safer() public onlyIfAllowed ... 
