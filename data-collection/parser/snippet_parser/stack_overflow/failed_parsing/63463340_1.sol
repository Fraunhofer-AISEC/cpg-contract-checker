pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;


mapping(address => string) UserAuth;


function setUser(address _userAddress, string memory _role) public {
    UserAuth[_userAddress] = _role;
}


modifier checkAuth(string memory _role){
    require(keccak256(abi.encode(UserAuth[msg.sender])) == keccak256(abi.encode(_role)));
    _;
}


function getUserAuth(address _userAddress) public view returns ( string memory){
    return UserAuth[_userAddress];
}
