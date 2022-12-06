function createHorse(string memory _name, uint8 _level, uint256 _price) public onlyOwner {
        if(horses.length > 0) {
            require(keccak256(bytes(horses[horses.length - 1].name)) != keccak256(bytes(_name)), "Another horse with this name already exists");
        }
        s_horseId = s_horseId + 1;
        horses.push(Horse(s_horseId, _price, _level, _name));

        emit HorseCreated(s_horseId, _price, _level, _name);
    }
