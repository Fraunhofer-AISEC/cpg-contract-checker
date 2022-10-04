  contract A{

    struct struct1{
      
    }

    struct struct2{
      struct1 input1;
    }

    mapping (uint => struct1) mapToStruct;

    struct2[] allEntries;
      
    }

  contract B is A{

    function addToStruct2(uint _mappingNumber) returns(bool status){
      struct2 memory newMember;
      struct1 memory newEntry;
      newEntry = mapToStruct[_mappingNumber];
      newMember.input1 = newEntry;
      allEntries.push(newMember);
      return true;
    }
  }
