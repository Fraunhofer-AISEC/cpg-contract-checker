contract PatCord {
string  name;
uint  age;
string  bGroup;
bytes32  id;
mapping(address => string) hosp;
address recc;

constructor(string _name, uint _age, string _bGroup, bytes32 _id) public {
    name = _name;
    age = _age;
    bGroup = _bGroup;
    id = _id;
    hosp[msg.sender]= "ABC Hospital";
}



struct Record {
    string disease;
    string value;
}

struct Hospital {
    string name;
    Record[] records;
}

mapping(uint256 => Hospital) hos;
Hospital[] hospital;


function addRecord(uint _id, string _disease, string _value) public {
    hos[_id].records.push(Record(_disease, _value));
}

function returnRecord(uint _id) public view returns(string ,  string[] memory, string[] memory) {
    string memory name = "ABC Hospital";
    uint256 length = hos[_id].records.length;
    string[] memory disease = new string[](length);
    string[] memory value = new string[](length);
    for (uint i = 0; i < length; i+=1) {
        disease[i] = hos[_id].records[i].disease;
        value[i] = hos[_id].records[i].value;
    }
    return (name , disease, value);
}

function allRecords() view returns (Hospital[]) {
    return hospital;
}
}