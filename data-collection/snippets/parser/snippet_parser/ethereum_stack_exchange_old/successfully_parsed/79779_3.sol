Entry[] entries;

function updateEntry (string memory _id,
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
    entries.push(Entry(_id, _typeOfEntry, _channel, _createdAt, _totalAmount, Field(_typeofFunding, _amount, _cohort, _promotion)));
    return true;
}
