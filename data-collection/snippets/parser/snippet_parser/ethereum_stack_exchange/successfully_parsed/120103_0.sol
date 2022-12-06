    
    
    pragma solidity >=0.7.0 <0.9.0;
    
    contract SimpleStorage {
        address Address;
        string name;
    }
    
    struct People {
        string Name;
        address Address;
    
    }
    
    People[]  people;
    
         

 mapping(string => address)  NametoAddress;

          
    
    function addPerson(string memory _Name, address memory _address)  {
        people.push(People(_Name, _address));
        NametoAddress [_Name] = _address;
       

}
