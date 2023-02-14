contract Time is owned {

    uint today;

    constructor() public {
       today = block.timestamp;
    } 
}