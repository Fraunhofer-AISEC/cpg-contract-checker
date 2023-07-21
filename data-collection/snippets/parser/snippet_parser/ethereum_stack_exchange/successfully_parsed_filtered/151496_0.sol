pragma solidity ^0.8.19;

contract Count {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Not owner");
        _;
    }
    uint256 public counted = 0;

    function countPrivate() private onlyOwner{
        counted += 1;
    }
    function countInternal() internal onlyOwner{
        counted += 1;
    }
    function countPublic() public onlyOwner{
        counted += 1;
    }
}
