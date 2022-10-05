contract T {
   string log;
   function getLastLog() constant returns (string lastLog) { return log; }

   function T() { log = "[call end]: T()\n"; }

   struct TData {
      uint somedata;
      uint amount;
   }

   mapping (address => uint) balance;
   mapping (address => TData) mystructmap;

   function setBalance(address _user, uint _balance) {
       log = "[call start]: setBalance()\n";

       balance[_user] = _balance;
       mystructmap[_user] = TData({somedata: 11, amount: 42});

       log = "[call end]: setBalance()\n";
   }

   function getBalance(address _user) external constant returns (uint _balance) {
      return balance[_user];
   }
   function get42(address _user) external constant returns (uint _fourtytwo) {
      return mystructmap[_user].amount;
   }
}
