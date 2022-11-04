   function RecordHealth(address rfid, string _bodyCond, string _healthStat, string _med) Owner public
    {
       cattle[rfid].HealthRecord.push(now, _bodyCond, _healthStat, _med)-1;
    }
