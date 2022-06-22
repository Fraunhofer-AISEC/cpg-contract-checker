event NumberIsIncreased(address indexed whoIncreased, uint256 indexed oldNumber, uint256 indexed newNumber);


function setMyNumber(uint256 myNewNumber) public {
        NumberIsIncreased(msg.sender, myNumber, myNewNumber);
        myNumber = myNewNumber;
    }
