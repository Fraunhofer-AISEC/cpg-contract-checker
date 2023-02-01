pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;


mapping(address => string) UserAuth;

constructor() public{
    UserAuth[msg.sender] = "ADMIN";
}


modifier checkAuth(string memory _role){
    require(keccak256(abi.encode(UserAuth[msg.sender])) == keccak256(abi.encode(_role)));
    _;
}


function setUser(address _userAddress, string memory _role) public checkAuth("ADMIN"){
    UserAuth[_userAddress] = _role;
}
 

function getUserAuth(address _userAddress) public view checkAuth("ADMIN") returns ( string memory){
    return UserAuth[_userAddress];
}
