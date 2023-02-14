
pragma solidity 0.8.8; 

contract simplestorage{
    uint256 public favNum;
    people public father= people({favNum:2,name:"Faw"});
    people[] public family; 
    mapping(string => uint256) public name2FavNum;

    

    struct people{ 
    uint256 favNum;
    string name;
    }

    function retrieve() public view returns(uint){
        return favNum;
    }

    function store(uint256 _favNum) public {
        favNum=_favNum;


    }

    function addperson(uint256 _num, string memory _name) public{
        people memory newperson = people({favNum:_num,name:_name});
        family.push(newperson);
        name2FavNum [_name]=_num;

    }




}
