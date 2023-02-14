function createUser(address _address, string _name) onlyOwner public {
         User memory newUser;
         newUser.id=_address;
         newUser.name=_name;

         
         users[newUser.id]=newUser;
         _totalUser++;

         
         balances[_address] = balances[_address].add(NEW_ACCOUNT_TOKEN);
         _totalSupply=_totalSupply.add(NEW_ACCOUNT_TOKEN);

         emit Transfer(owner,_address , _totalSupply);
    }
