contract Foo {

    
    struct Milestone {

        
        uint time;

        
        uint price;
    }

    Milestone[] milestones;

    function getMilestone(uint n) public constant returns (uint, uint ) {
        return (milestones[n].time, milestones[n].price);
    }    
}
