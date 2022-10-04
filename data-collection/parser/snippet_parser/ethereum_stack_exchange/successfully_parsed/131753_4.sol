
pragma solidity ^0.8.0;

contract MyContract
{
    mapping(uint256 => People) dataList;
    uint256[] countArr;
    
    struct People{
        string name;
        uint256 favNum;
    }

    function setPerson(string memory _name,uint256 _id, uint256 _favNum) public {
        dataList[_id]= People(_name,_favNum);
        countArr.push(_id);
    }

    function getPerson(uint _id) public view returns(string memory,uint256){
        return (dataList[_id].name, dataList[_id].favNum);
    }

    function getAllData()public view returns(People[] memory){
        uint256 count = countArr.length;
        uint256 i = 0;
        People[] memory outputL = new People[](count);
        while(count > 0){
            (string memory nam,uint256 num) = getPerson(i);
            People memory temp = People(nam,num);
            outputL[i]=temp;
            count--;
            i++;
        }
        return outputL;
    }                
}
