
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Registration {
    struct Child {
        uint256 id;
        string name;
        string sex;
        uint256 weight;
        string condition;
        uint256 day;
        uint256 month; 
        uint256 year;
        string placeOfBirth;
        string birthOccurence;
        string motherFullname;
        string motherNrc;
        
        string pAddress;
    }

    Child[] public child;
    uint256 nextId = 1;
  

    function find(uint256 _id) public view returns (uint256) {
        for (uint256 i; i < child.length; i++) {
            if (child[i].id == _id){ return i;
            }
        }
        revert("Record does not exist.");
    }


     function insertRecord(
        string memory _name,
        string memory _sex,
        uint256 _weight,
        string memory _condition,
        
        
        uint256 _day,
        uint256 _month,
        uint256 _year,
        string memory _placeOfBirth,
        string memory _birthOccurence,
        string memory _motherFullname,
        string memory _motherNrc,
        
        string memory _pAddress
    ) public {
        if(
            _month == 2 && _day >= 30 || 
        _month == 4 && _day >= 31 ||
        _month == 6 && _day >= 31 ||
          _month == 9 && _day >= 31 ||
            _month == 11 && _day >= 31
            ){
            revert("check the date");
        } else{
        child.push(Child(nextId, _name, _sex, _weight, 
        _condition,
        
        
        _day, _month, _year,
         _placeOfBirth, _birthOccurence, _motherFullname, _motherNrc,
        
          _pAddress));
        nextId++;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




      function readRecordByDate( 
    uint256 _year)
        public
        view
        returns (Child[] memory)
    {
            for (uint256 i; i < child.length; i++) {
            if (
             child[i].year == _year
            ){
        return (
            child
        );
            }
         }
         revert("Record does not exist.");
    }
}