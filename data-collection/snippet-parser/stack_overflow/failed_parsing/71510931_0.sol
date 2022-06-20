contract Prenotation {
    struct Place{
        string name;
        string description;
        bool isActive; 
        uint256 price; 
        address owner; 

        
        
        
        bool[] isBooked;
    }
    
    
    uint256 public placeId;
    
    mapping(uint256 => Place) public places;
    ...
