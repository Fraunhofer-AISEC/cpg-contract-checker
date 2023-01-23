modifier ownerOnly {
  if (msg.sender == owner) _;
}

function doSomething() ownerOnly {
  ...
}
