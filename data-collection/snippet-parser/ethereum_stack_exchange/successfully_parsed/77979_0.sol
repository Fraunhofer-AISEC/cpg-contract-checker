
contract richkid{

function buy_ceo_place() public payable returns (bool)

{

if(msg.sender.send(this.balance))

{

return false;

}
sorry-failed() 
return true;

}

}
