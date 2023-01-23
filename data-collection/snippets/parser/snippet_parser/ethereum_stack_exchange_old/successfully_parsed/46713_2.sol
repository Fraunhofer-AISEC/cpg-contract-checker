constructor() public payable  {
    value = msg.value;
    owner = msg.sender;
    lockedUntil = now + 5 days;
}
