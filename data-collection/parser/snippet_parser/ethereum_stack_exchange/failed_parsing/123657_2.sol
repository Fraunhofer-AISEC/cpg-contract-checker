  Reentrance
{ chainId: 31337, name: 'unknown' }
    ✔ raises the balance of the reentrancy contract
    ✔ shows the expected balances in the Reentrance contract
Sending 11 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc
    1) withdraws the bounty to the robber


  16 passing (2s)
  1 failing

  1) Reentrance
       withdraws the bounty to the robber:

      AssertionError: Expected "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC" to change balance by 10 wei, but it has changed by -1 wei
