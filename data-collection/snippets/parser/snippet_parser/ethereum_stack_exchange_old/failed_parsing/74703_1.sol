import "./A.sol";

Contract B is A{

  A Multisig;

  function verifySchedule(uint scheduleid)
        public
        view
        returns (uint)
        {
        uint amount = Multisig.validateSchedule(scheduleid);
        return amount;
         }
}
