1) Voting Unit Tests
       vote
         reverts when a voter already voted:
     Error: VM Exception while processing transaction: reverted with panic code 0x11 (Arithmetic operation underflowed or overflowed outside of an unchecked block)
    at Voting.vote (contracts/Voting.sol:100)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at runNextTicks (node:internal/process/task_queues:64:3)
    at listOnTimeout (node:internal/timers:533:9)
    at processTimers (node:internal/timers:507:7)
