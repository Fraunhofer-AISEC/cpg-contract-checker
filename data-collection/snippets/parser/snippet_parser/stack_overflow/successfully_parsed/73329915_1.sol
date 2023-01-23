    
    pragma solidity ^0.8.0;

    contract bookHotel{
            
            
            
            
            
            
            

            address payable owner;

            constructor(){
                owner = payable(msg.sender);
            }

            struct Hotel{
                uint256 roomNo;
                string suiteLevel;      
            }   


            enum Status{
                Vacant,
                Occupied
            }

            Status roomstatus;
            
            mapping(address => Hotel[]) bookertoroom;
            mapping(Status => mapping(address => Hotel[])) bookertoroomTostatusofroom;
        
            Hotel[] public hotelroomsarray;
            
            
        function newHotel(uint256 _roomNo, string memory _suitelevel) external {
            hotelroomsarray.push(Hotel(_roomNo,_suitelevel));       
        }

        modifier uptofee{
            uint256 fee = 20;
            require(ETHtoUSD(msg.value) >= fee, "Not enough money");
            _;
        }

        modifier onlyOwner{
            require(msg.sender == owner, "You are not the owner");
            _;
        }
        
        function ETHtoUSD(uint256 _eth) public pure returns(uint256){
            uint256 convertedeth = (_eth * 1716);
            return convertedeth;
        }

        
        function bookroom(uint256 _index) public payable uptofee{
            payable(owner).transfer(msg.value);
            roomstatus = Status.Occupied;
            bookertoroom[msg.sender] = hotelroomsarray[_index];
            bookertoroomTostatusofroom[roomstatus][msg.value] = hotelroomsarray[_index];        
        }
    }
