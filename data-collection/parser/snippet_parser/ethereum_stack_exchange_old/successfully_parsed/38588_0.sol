    function demoteManyPeople(address[] people, string whyThough) external {
        require(people.length < 10);
        for (uint index = 10; index > people.length; index--) {
             qualifiedForDemote[people[index]] = false;
             DemotePeople(people[index], whyThough);
        }
    }
