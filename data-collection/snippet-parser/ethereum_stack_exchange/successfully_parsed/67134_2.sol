pragma solidity >=0.5.4 <0.6.0;

contract SplitSupply {
    address owner;
    address payable private team = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
    address payable private crowd = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;

    constructor() payable public {
        require(1 ether < msg.value);
        owner = msg.sender;
    }

    function allocate() public {
        require(msg.sender == owner);
        address(team).transfer(address(this).balance / 2);
        address(crowd).transfer(address(this).balance);
    }
}
