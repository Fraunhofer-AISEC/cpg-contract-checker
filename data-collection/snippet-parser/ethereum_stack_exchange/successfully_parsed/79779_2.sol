pragma solidity ^0.5.11;

contract Analytics {
    address lastAddress;
    uint timeStamp;
    string label;
    uint count;
    string id;
    string typeofEntry; 
    string channel;
    string createdAt;
    
    struct Field {
        string typeOfFunding; 
        uint amount;
        string cohort;
        string promotion;
    }
    struct Entry {
        string id;
        string typeofEntry; 
        string channel;
        string createdAt;
        uint totalAmount; 
        Field funding;
    }
    mapping(uint => Entry) entries;

    function updateEntry (
                    uint _index,
                    string memory _id,
                    string memory _typeOfEntry,
                    string memory _channel,
                    string memory _typeofFunding,
                    uint  _amount,
                    string memory _cohort,
                    string memory _promotion,
                    string memory _createdAt,
                    uint  _totalAmount) public returns 
                    (bool sucess)
    {
        entries[_index] = Entry(_id, _typeOfEntry, _channel, _createdAt, _totalAmount, Field(_typeofFunding, _amount, _cohort, _promotion));
        return true;
    }
}
