contract Savings
{
    struct Deposit
    {
        string name;
        uint deposit;
    }

    uint        cEnd = now + 10 years;
    address[]   dAddresses;

    mapping(address => Deposit[]) deposits;

    function depositEther(string _name)
    {
        deposits[msg.sender].push(Deposit({
            name: _name,
            deposit: msg.value
        }));
        dAddresses.push(msg.sender);

        if(now >= cEnd){
            distribute(); 
        }
    }

    
    function distribute() internal {
    }   
}
