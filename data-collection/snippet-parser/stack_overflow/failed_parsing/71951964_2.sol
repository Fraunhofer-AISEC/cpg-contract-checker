Compiling your contracts...
===========================
> Compiling ./contracts/Migrations.sol
> Compiling ./contracts/Wallet.sol
> Artifacts written to /var/folders/kx/64r1zrfn28g8v6_sy50p98480000gn/T/test--50180-yxWHgIg50Wuu
> Compiled successfully using:
   - solc: 0.6.0+commit.26b70077.Emscripten.clang


  Contract: Wallet
    ✔ should heve correct approvers and quorum (64ms)
    1) should create transfers
    > No events were emitted


  1 passing (6s)
  1 failing

  1) Contract: Wallet
       should create transfers:
     Transaction: 0xd41ddeb4f3801cd59e065679a8a26180d92aa31778704e16ccfde77e01b9d830 exited with an error (status 0) after consuming all gas.
     Please check that the transaction:
     - satisfies all conditions set by Solidity `assert` statements.
     - has enough gas to execute the full transaction.
     - does not trigger an invalid opcode by other means (ex: accessing an array out of bounds).
  StatusError: Transaction: 0xd41ddeb4f3801cd59e065679a8a26180d92aa31778704e16ccfde77e01b9d830 exited with an error (status 0) after consuming all gas.
      at Context.<anonymous> (test/Wallet.js:21:17)
      at processTicksAndRejections (node:internal/process/task_queues:96:5)
