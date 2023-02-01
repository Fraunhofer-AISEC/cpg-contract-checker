 function makeClaim(string _name, string _ipfs) payable public {
        
        countevents[_name] += 1;
        database[_name][countevents[_name]] = _ipfs;
        victimDatabase[msg.sender][_name].person = msg.sender;
        victimDatabase[msg.sender][_name].stake = msg.value;
        victimDatabase[msg.sender][_name].time = block.timestamp;
    }
