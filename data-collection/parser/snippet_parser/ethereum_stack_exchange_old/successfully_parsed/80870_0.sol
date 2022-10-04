pragma solidity ^0.6.4;

contract TestModifier {

    mapping (address => bool) public authorities;
    mapping (address => address) public authorized;

    modifier onlyAuthorized(address _user) {
        require(authorities[authorized[_user]], "Requires authorization");
        _;
    }

    
    function getStatus1(address _user) external view returns (bool) {
        return authorities[authorized[_user]];
    }

    
    function getStatus2(address _user) external view onlyAuthorized(_user) returns (bool) {
        return authorities[authorized[_user]];
    }

    
    function getStatus3(address _user) external view onlyAuthorized(_user) returns (bool) {
        return true;
    }
}
