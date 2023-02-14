    
pragma solidity >=0.7.0 <0.9.0;

contract Users {

    struct User {
        string username;
        uint grade;
    }

    mapping(string => User) userMap;

    event userDetailsChanged(
        string username,
        uint grade
    );

    function setUserDetails(string memory _username, uint _grade) external {

        userMap[_username].username = _username;
        userMap[_username].grade = _grade;

        emit userDetailsChanged(_username, _grade);
    }

    function getUserGrades(string memory _username) external view returns(uint _grade) {
        return (
            userMap[_username].grade
        );
    }
}
