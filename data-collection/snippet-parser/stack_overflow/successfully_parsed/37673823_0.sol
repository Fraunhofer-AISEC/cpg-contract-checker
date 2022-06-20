contract MVM {

  struct Bucket {
    bool exists;
    uint num; 
    mapping(uint => Record) records;
  }

  struct Record {
    bool exists;
    string info;
  }

  
  
  mapping(string => Bucket) data;

  function set(string key, string value) {
    if (data[key].exists) {
      data[key].records[data[key].num] = Record(true, value);  
    }
    else {
      data[key].exists = true;
      data[key].records[0] = Record(true, value);
    }
    data[key].num++;
  }

  function num_of(string key) returns (uint) {
    return data[key].num; 
  }

  function get(string key, uint index) returns (string) {
    if (!data[key].exists || !data[key].records[index].exists) {
      throw;
    }
    return data[key].records[index].info;
  }

}
