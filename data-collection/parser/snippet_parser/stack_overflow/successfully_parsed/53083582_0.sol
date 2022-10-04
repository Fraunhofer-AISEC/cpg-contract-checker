contract Test {
  address[] mAddrs;
  event Deployed(address indexed theaddr);

  constructor(address[] addrs) public {
    mAddrs = addrs;

    for (uint8 i = 0; i < mAddrs.length; i++)
      emit Deployed(mAddrs[i]);
  }
}
