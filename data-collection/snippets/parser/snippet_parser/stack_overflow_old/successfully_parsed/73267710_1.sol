interface IOwnable {
  function owner() external view returns(address)
}

IOwnable(__collection).owner()
