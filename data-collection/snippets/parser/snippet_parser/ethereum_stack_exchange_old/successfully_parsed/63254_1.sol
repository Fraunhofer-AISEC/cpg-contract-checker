contract getSchwifty {
  struct myData
  {
    string actualData;
    bool dataFlag;
  }

  mapping(string=>myData) records;

  function addData(string id, string hashData) public {
    if (records[id].dataFlag != true)
    {
        records[id].actualData = hashData;
        records[id].dataFlag = true;
    }
  }

  function getData(string id) external view returns (string) {
        if (records[id].dataFlag == true)
           return records[id].actualData;
        else
           return "NULL";
  }

}
