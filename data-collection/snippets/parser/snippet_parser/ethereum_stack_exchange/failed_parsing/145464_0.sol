 Raffle Unit tests
    constructor
      ✔ initializes the raffle correctly
    enterRaffle
      ✔ reverts if you don't pay enough (84ms)
      ✔ keeps record of entering players (43ms)
      1) emits event on enter
      ✔ doesn't allow entrance when raffle is calculating (129ms)


  4 passing (1s)
  1 failing

  1) Raffle Unit tests
       enterRaffle
         emits event on enter:

      AssertionError: Expected event "RaffleEnter" to be emitted, but it doesn't exist in the contract. Please make sure you've compiled its latest version before running the test.
      + expected - actual

      +RaffleEnter
