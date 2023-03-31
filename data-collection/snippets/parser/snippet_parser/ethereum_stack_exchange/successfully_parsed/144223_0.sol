contract HungerGames {
uint public peopleCount = 0;
uint public peopleAfterCount = 0;

mapping(uint => Person) public people;
struct Person {
    uint _id;
    uint _weight; 
    address payable _competitor;       
}

mapping(uint => PersonWeighed) public peopleWeighted;
struct PersonWeighed {
    uint _idAfter;
    uint _weightAfter;
    address payable _competitorAfter;
}

function addPerson(uint _weight) public payable {
    require(msg.value == 1000000000000000000); 
    uint _id = peopleCount + 1;
    address payable _competitor = payable(msg.sender);
    people[peopleCount] = Person(_id, _weight, _competitor);
    incrementCount();
}

function theWeighing(uint _weightAfter) public {
    uint _idAfter = peopleAfterCount + 1;
    address payable _competitorAfter = payable(msg.sender);
    peopleWeighted[peopleAfterCount] = PersonWeighed(
        _idAfter,
        _weightAfter,
        _competitorAfter
    );
    incrementAfterCount();
}

function incrementCount() internal {
    peopleCount += 1;
}
function incrementAfterCount() internal {
    peopleAfterCount += 1;
}



function getContestantweightLoss() public view returns(uint){}


  
}
