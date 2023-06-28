contract SimpleLearn
{
    address public payer;
    address public thirdParty;
    address public receiver;
    uint public amt;
    uint senderBal;
    uint remamount;
constructor (address _payer, uint amount, address _receiver) 

{
payer = _payer;
receiver = _receiver;
amt = amount;
thirdParty = msg.sender;
remamount = amount;
}
mapping (address=>uint) public balances;
function deposit(uint transferm) public returns (uint)   
{
require (msg.sender == payer, "Sender must be payer");
require (transferm< remamount, "Amount to transfer should be lesser than remaining amount");
remamount = remamount - transferm;
balances[thirdParty] += transferm;
return remamount;

}
}
