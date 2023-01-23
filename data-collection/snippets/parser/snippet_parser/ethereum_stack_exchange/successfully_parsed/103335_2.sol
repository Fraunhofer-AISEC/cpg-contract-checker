pragma solidity >=0.7.0 <0.9.0;

contract Test {
    struct studuim  {
        string name;
        uint256 id;
    }
    
    studuim [] public studuims;
    
    function addStudium(string memory _name, uint256 _id) public {
        studuims.push(studuim(_name, _id));
    }
    
    function returnStadium(uint256 _index) public view returns(string memory, uint256) {
        return (studuims[_index].name, studuims[_index].id);
    }
}
