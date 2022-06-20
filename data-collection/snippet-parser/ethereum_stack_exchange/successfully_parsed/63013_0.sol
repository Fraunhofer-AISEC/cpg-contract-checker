pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract AccessControlListContract {
    mapping(address => mapping(string=> mapping(address => string[]))) _userAccessGrants;
    mapping(address => mapping(address => mapping(string => string[]))) _targetAccessGrants;

    
    function grantAccess(address userAddress, string documentHash, address targetUserAddress, string permission) public {
        _userAccessGrants[userAddress][documentHash][targetUserAddress].push(permission); 
        _targetAccessGrants[targetUserAddress][userAddress][documentHash].push(permission);       
    }

    function checkAccess(address requestorAddress, address userAddress, string documentHash) public view returns (string[]) {
        return _targetAccessGrants[requestorAddress][userAddress][documentHash];
    }
}
