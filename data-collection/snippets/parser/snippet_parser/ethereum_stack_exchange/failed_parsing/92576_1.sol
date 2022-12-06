contract Attack {
  function exploit(address vulnerableAddress) {
    call.transferOut(<attacker address>) {
      <somehow send 0 ETH, but set the recieving ETH in memory to 100 ETH>   
    }
  }
}
