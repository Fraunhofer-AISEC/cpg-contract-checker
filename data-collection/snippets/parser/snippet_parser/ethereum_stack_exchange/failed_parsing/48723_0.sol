This is the event declaration right above the contract constructor

event Accessed(string _msg,address _add, uint _time);


function transfer(bytes32 _ID) public returns (address)
{
    
    if (ID == _ID)
        {    
                owner = msg.sender;
                taddr.push(msg.sender); 
                                        
                ttime.push(now);        
                Accessed("someone executed the transfer function",owner,now);
                return(owner); 
        } 
}
 function getOwners() view public returns (address[],uint[]) 
{

     return (taddr,ttime);

}
