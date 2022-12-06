pragma solidity ^0.5.7;

contract UserContract {
    struct User {
        string Userid;
        uint age;
        string sex;
        string job;
        string mbti;
    }

    User[] public Users;
    

    function splice(uint256 k) public{
        for(; (k+1)<Users.length; k++){
            Users[k]=Users[k+1];
        }
        Users.pop();
    }


    function UserIdCheck(string memory _Userid) public view returns(bool){
        for(uint256 i=0; i<Users.length; i++){
            if(keccak256(abi.encodePacked(Users[i].Userid)) == keccak256(abi.encodePacked(_Userid))){
                return false;
            }
        }
        return true;
    }


    function addUser (string memory _Userid, uint _age, string memory _sex, string memory _job, string memory _mbti) public{
        Users.push(User(_Userid, _age, _sex, _job, _mbti));
    }


    function getUser(uint _idx) public view returns (string memory, uint, string memory, string memory, string memory) {
        return (Users[_idx].Userid, Users[_idx].age, Users[_idx].sex, Users[_idx].job, Users[_idx].mbti);
    }
    

    function getUserID(string memory _Userid) public view returns (string memory, uint, string memory, string memory, string memory) {
        for(uint256 i=0; i<Users.length; i++){
            if(keccak256(abi.encodePacked(Users[i].Userid)) == keccak256(abi.encodePacked(_Userid))){
                return (Users[i].Userid, Users[i].age, Users[i].sex, Users[i].job, Users[i].mbti);
            }
        }
    }
    

    function deleteUser(string memory _Userid) public returns (bool){
        for(uint256 i=0; i<Users.length; i++){
            if(keccak256(abi.encodePacked(Users[i].Userid)) == keccak256(abi.encodePacked(_Userid))){
                splice(i);
                return true;
            }
        }
        return false;
    }


    function getlen() public view returns (uint256) {
        return Users.length;
    }
    

    function clear() public returns(bool){
        delete Users;
    }
}
