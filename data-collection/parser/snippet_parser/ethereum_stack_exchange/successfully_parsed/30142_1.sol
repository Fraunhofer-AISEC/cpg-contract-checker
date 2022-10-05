    function createMagic(string name) public returns(bytes32 magicId) {

        
        Magic memory magic = Magic({
            id: keccak256(msg.sender, name, _nonce++),
            name: name,
            watchers: new address[](_numWatchersMax)
        });

        
        require(registerMagicWatcher(magic, msg.sender));

        
        allMagic[magic.id] = magic;             

        
        return magic.id;
    }
