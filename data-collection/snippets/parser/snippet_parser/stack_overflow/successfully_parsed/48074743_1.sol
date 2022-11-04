contract HotelReservation{

    
    address owner;

    
    address raspberryAccount = XXXXXXXXX;

    uint constant roomsNumber = 5;

    
    mapping (uint => address) reservations;

    
    mapping (address => uint)  deposits;

    
    mapping (address => uint)  checkins;

    uint depositFee = 1 ether;
    uint costPerSeconds = 0.0000115 ether;

    event doorStatus (bool status, uint roomNr);

    function HotelReservation (){
        owner = msg.sender;

        
        for (uint i=1; i <= roomsNumber; i++)
        {
            reservations[i] == 0;
        }
    }

    modifier canReserveRoom(uint roomNr) {

        bool canReserve = true;

        if(roomNr <= 0 || roomNr > 5)
            canReserve = false;

        
        for (uint i=1; i<= roomsNumber ; i++)
        {
            if (reservations[i] == msg.sender){
                canReserve = false;

            }
        }

        
        if(reservations[roomNr] != 0)
        {
            canReserve = false;
        }

        
        if(msg.value < depositFee)
        {
            canReserve = false;
        }

        require(canReserve);
        _;
    }



   function unlockDoor(uint roomNr) canReserveRoom(roomNr) public payable returns (bool){

        deposits[msg.sender] = depositFee;
        reservations[roomNr] = msg.sender;
        checkins[msg.sender] = block.timestamp;

        doorStatus(true, roomNr);
        return true;
    }

    modifier canLeaveRoom(uint roomNr) {

        bool canLeave = true;

        
        if (reservations[roomNr] != msg.sender){
            canLeave = false;
        }

        require(canLeave);
        _;
    }


    modifier isTheOwner(){

        bool forceRoomLock = true;
        if(msg.sender != raspberryAccount)
          forceRoomLock = false;

        require(forceRoomLock); 
        _;
    }

    function forceLockDoor(uint roomNr) isTheOwner public returns (bool){

        address tenantAddress = reservations[roomNr];

        
        owner.transfer(deposits[tenantAddress]);

        reservations[roomNr] = 0;
        deposits[tenantAddress] = 0;
        checkins[tenantAddress] = 0;


        doorStatus(false, roomNr);
        return true;

    } 

    function lockDoor(uint roomNr) canLeaveRoom(roomNr) public payable returns (bool){

        
        uint checkinTimestamp = checkins[msg.sender];
        uint datetimeNow = block.timestamp;
        uint usage = datetimeNow - checkinTimestamp;
        uint usageInSeconds = uint8(usage % 60);

        uint totalCost = usageInSeconds * costPerSeconds;
        uint refound = deposits[msg.sender] - totalCost;

        
        msg.sender.transfer(refound);

        
        owner.transfer(totalCost);

        
        reservations[roomNr] = 0;
        deposits[msg.sender] = 0;
        checkins[msg.sender] = 0;

        doorStatus(false, roomNr);
        return true;

    }
}
