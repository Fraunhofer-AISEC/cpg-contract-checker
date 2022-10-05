contract Time {
  uint time;

  function giveTime() {
    time=now;
  }

  function Timestamp() constant returns (uint block_time) {
    block_time=time;
  }
}
