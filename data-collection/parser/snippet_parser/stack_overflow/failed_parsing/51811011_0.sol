contract Person 
 {

 Record[] records
 strut Record{
   string name;
   uint time;
  }

  function updateRecords(string _name, uint _time){
     Record _record = Record({name:_name,time:_time});
     records.push(_record);
  }
}
