    array - Hotel[] public hotelroomsarray;
    struct - struct Hotel{
                uint256 roomNo;
                string suiteLevel;      
            }   
            
        function bookroom(uint256 _index) public payable uptofee{
            payable(owner).transfer(msg.value);
            roomstatus = Status.Occupied;
            bookertoroom[msg.sender] = hotelroomsarray[_index];         
        }
