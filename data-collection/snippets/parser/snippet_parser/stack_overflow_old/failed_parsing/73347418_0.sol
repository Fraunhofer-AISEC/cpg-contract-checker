        struct Hotel{
            uint256 roomNo;
            string suiteLevel;
            bool isOccupied;    
        }

        enum Status{
            Vacant,
            Occupied
        }
        Hotel[] public hotelroomsarray; 

        function newhotel(uint256 _num, string calldata _str, bool _isoccupied) public {
            Hotel memory room = Hotel(_num, _str, _isoccupied);
            hotelroomsarray.push(room);
        }-------i pass in false into this function

        function bookroom1() public payable uptofee{
            Hotel memory booked = hotelroomsarray[0];                   
            require(booked.isOccupied == false, "This room is alraeady occupied");              
            payable(owner).transfer(msg.value); 
            booked.isOccupied = true;------------part that isn't working                            
            bookertoroom[msg.sender] = hotelroomsarray[0];
            bookers.push(msg.sender);       
            addrtoamntpaid[msg.sender] = msg.value; 
            count++;                
        }
