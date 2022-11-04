pragma solidity 0.4.21;

contract UserReg {

    mapping(address => bool) public isUser;

    function add(address userAddress) public {
        require(userAddress != 0x0 && !isUser[userAddress]);             
        isUser[userAddress] = true;    
    }

    function pass(address passAddress) public view returns(bool) {   
        return isUser[passAddress];
    }

    

    function isUserReg() public pure returns(bool isIndeed) {
        return true;
    }
}

contract SaveData {

    address[] public addrs;

    UserReg userReg;

    function instantiateXyz(address userRegAddr) public returns(bool success) {
        userReg = UserReg(userRegAddr);     
        require(userReg.isUserReg());       
        return true;
    }

    function saveAddress(address pubAddress) public returns(bool success) {
        require(userReg.pass(pubAddress)==true);
        addrs.push(pubAddress);    
        return true;
    }

}
