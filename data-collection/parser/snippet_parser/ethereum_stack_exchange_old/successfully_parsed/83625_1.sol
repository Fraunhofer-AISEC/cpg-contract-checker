
pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2; 

contract VenueRegistry{
    struct Queue{
        uint head;
        uint tail;
        mapping(uint => address) queue;
    }

    struct Venue{
        uint id;
        Queue queue;
    }

    mapping (uint => Venue) venues;

    function getVenue(uint _index) public view returns(Venue memory){
        return venues[_index];
    }
}
