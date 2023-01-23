import "./A.sol";

Contract B is A{

  function verifySchedule(uint scheduleid)
      public
      view
      returns (uint)
  {
      uint amount = validateSchedule(scheduleid);
      return amount;
  }
}
