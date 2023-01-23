struct ledger_t {
  uint8 WinningNum1;
  uint8 WinningNum2;
  uint8 WinningNum3;
  uint8 WinningNum4;
  bytes32 ClosingHash;
  bytes32 OpeningHash;
  mapping(address=>bet_t) bets;
  uint Guess4OutOf4;
  uint Guess3OutOf4;
  uint Guess2OutOf4;
  uint Guess1OutOf4;
  uint PriceOfTicket;
  uint ExpirationTime; 
}
ledger_t[] public ledger;


function TheEthereumLottery() {
  owner = msg.sender;
  ledger.length = 0;
  IndexOfCurrentDraw = 0;
  referral_fee = 90;
}
