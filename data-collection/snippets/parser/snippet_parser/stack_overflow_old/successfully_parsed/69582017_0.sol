contract EventConfirmAccess{

struct eventStruct{
    string event_log_time;
    string event_name;
    string event_id;
    uint data_nik;
}
mapping(uint => eventStruct) public dictConfirmAccess;
uint[] public arrayOfData;

function loggingAccess(
    uint _nik, string memory _event_log_time,
    string memory _event_name, string memory _event_id,
    uint _data_nik
) public{
    dictConfirmAccess[_nik] = eventStruct(
      {
        event_log_time : _event_log_time,
        event_name : _event_name,
        event_id : _event_id,
        data_nik : _data_nik
      }
    );

    arrayOfData.push(_nik);
}
function checkData(uint _nik) view public returns(
        string memory ,string memory,
        string memory ,uint
    ){
        return (
            dictConfirmAccess[_nik].event_log_time,
            dictConfirmAccess[_nik].event_name,
            dictConfirmAccess[_nik].event_id,
            dictConfirmAccess[_nik].data_nik
        );
    }
 }
