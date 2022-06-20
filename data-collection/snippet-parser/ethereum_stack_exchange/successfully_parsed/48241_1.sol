pragma solidity 0.4.23;

contract CountryStore {
    bool public finishedCreating = false;

    mapping(bytes2 => Country) public createCountries;

    struct Country {
      string name;
      uint level;
      uint attackPower;
      uint defensePower;
      uint price;
      bool created;
    }

    Country[] public countries;

    function createCountries(string names) public onlyWhileCreating {
       for(uint256 i = 0; i < bytes(names).length; i+=2){
           
           bytes memory name = new bytes(2);
           name[0] = bytes(names)[i];
           name[1] = bytes(names)[i+1];

           if(!createCountries(bytes2(name)).created)
               countries.push(Country({
                   name: string(name),
                   level: 1,
                   attackPower: 100,
                   defensePower: 100,
                   price: 1,
                   created: true
               }));
       }
    }

    function finishCreating() public {
        finishedCreating = true;
    }

    modifier onlyWhileCreating(){
       require(!finishedCreating, "This method can only be called when creating countries");
       _;
    }
}
