function newStartup (string memory _title, string memory _startupDescription, uint _goal, uint _duration, Pledge[] calldata _pledges) external {
    Startup memory newStartup = Startup({
        founder: payable(msg.sender),
        title: _title,
        startupDescription: _startupDescription,
        goal: _goal,
        startAt: block.timestamp,
        endsAt: block.timestamp + duration,
        status: true,
        pledges: _pledges,  
    });

    
}
