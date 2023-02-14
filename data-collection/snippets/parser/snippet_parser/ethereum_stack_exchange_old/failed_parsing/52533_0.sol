struct Person
    {
        address userAddress;
        string userName;
        uint userTarget;
    }
     mapping (uint => person) Persons;
     uint[] public personAccounts;
     uint incr = 0;

     function setDetailse(string  data, uint target) public
    {
        uint icr = incr++;
        address _address = msg.sender;
        var person = persons[icr];

        person .userAddress = _address;
        person .userName= _vote;
        person .userTarget = target;
        person Accounts.push(icr) -1;
    }

   function getPerson() view public returns(uint[])
   {
       uint256[] memory data =  new uint256[](11);
       for(uint i = 1; i<=10 ;i++)
        {
           data[i]=personAccounts[i];
        }
       return data;
   }
