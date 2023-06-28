pragma solidity ^0.5.0;

import "./domain/User.sol";
import "./common/Ownable.sol";


contract DApp is Ownable {
    address [] private _userList;

    constructor () public Ownable(msg.sender) {

    }

    function createUser(string memory name, string memory publicKey) public {
        User user = new User(name, publicKey);
        address userAddr = address(user);
        _userList.push(userAddr);
    }

    function getUserList() public view returns(address[] memory) {
        return _userList;
    }

}
