 function newToken(string _name, string _symbol, uint _decimals) public returns(address objAddress){


        newContract = new WILDToken(_name,_symbol,_decimals);

        contracts.push(newContract);

        return newContract;
    }
