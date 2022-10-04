[...]
function createSomething(string memory _name, uint _userProvidedSeed) payable public {
        require(msg.value >= productCost);
        
        msg.sender.transfer(msg.value - productCost);
        
        getRandomNumber(_userProvidedSeed);
        _createProduct(_name, randomResult);
    }
[...]
