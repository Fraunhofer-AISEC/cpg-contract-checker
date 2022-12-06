pragma solidity ^0.4.17;

contract test {
    struct Record {
        string name;
        string homeAddress;
    }

    Record[] public records;

    function AddRecord(string Address , string Name) public {
        Record memory newRec = Record({
            name : Name,
            homeAddress : Address
        });

        records.push(newRec);
    }

    function recordsArrayLength() public view returns(uint256){
        return records.length;
    }

}
