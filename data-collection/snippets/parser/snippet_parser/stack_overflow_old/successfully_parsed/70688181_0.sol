

pragma solidity >=0.6.0 <0.9.0;         

contract SimpleStorage {

    struct People{
        uint256 favNum;
        string Name;
    }

    People public person = People({favNum : 2, Name : "Patrick"});
    
    People[] public peoplearr; 

    mapping(string => uint256) public nameTofavNum; 

    
    uint256 favNum;
    
    function store(uint256 _favNum) public{ 
        favNum = _favNum;
    }

    function retrieve() public view returns(uint256){
        return favNum;
    }

    function addPerson(string memory _Name, uint256 _favNum) public{
        peoplearr.push(People({favNum : _favNum, Name : _Name})); 
        nameTofavNum[_Name] = _favNum;                            
    }  
}
