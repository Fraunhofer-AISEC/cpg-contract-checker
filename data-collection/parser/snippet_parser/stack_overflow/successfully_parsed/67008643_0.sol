contract LuggageStorage
{
    Luggage luggage;
    address owner;
    constructor(LuggageStorage _luggage) public 
    {
        luggage = _luggage;
        owner = msg.sender;
    }
    function storeLuggage (uint lAddress, uint time) public
    { 
        luggage.transferFrom(msg.sender, owner, lAddress); 
        
    }
    function retrieveLuggage(uint lAddress) public 
    {         
        luggage.transferFrom(owner, msg.sender, lAddress); 
    }
}  
