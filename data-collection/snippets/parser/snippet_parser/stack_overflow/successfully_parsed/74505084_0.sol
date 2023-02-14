
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract TestContractV1 is ERC721, Ownable{
    uint256 public mintPrice = 0.00000000000000001 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    bool public isMintEnabled;
    uint start;
    uint end;
    mapping(address => uint256) public mintedWalletes;
    mapping(address => bool) public whitelist;
    mapping(address => bool) public monthlyVIP;
    address [] public  vip;
    constructor() payable ERC721('Test V1', 'TV1'){
        maxSupply = 2;
    }

    modifier timeIsOver{
            require(block.timestamp>=end,"Time is up");
            callThisWhenTimeIsUp();
            _;
        } 

    function toggleIsMintEnabled() external onlyOwner{
        isMintEnabled = !isMintEnabled;
        whitelist[msg.sender] = true;
        startTimer();
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner{
        maxSupply = maxSupply_;
    }

      function addToWhitelist(address[] calldata toAddAddresses) external onlyOwner
    {
        for (uint i = 0; i < toAddAddresses.length; i++) {
            whitelist[toAddAddresses[i]] = true;
        }
    }

    function addToVIP(address[] calldata toAddAddresses) external onlyOwner
    {
        for (uint i = 0; i < toAddAddresses.length; i++) {
            monthlyVIP[toAddAddresses[i]] = true;
            
        }
    }


    function removeFromWhitelist(address[] calldata toRemoveAddresses) external onlyOwner
    {
        for (uint i = 0; i < toRemoveAddresses.length; i++) {
            delete whitelist[toRemoveAddresses[i]];
        }
    }

    function resetVIPs() public {
        for (uint i=0; i< vip.length ; i++) {
            monthlyVIP[vip[i]] = false;
        }
    }

    function whitelistFunc() public view 
    {
        require(whitelist[msg.sender], "NOT_IN_WHITELIST");
    }

   
    function startTimer() public{
        start = block.timestamp;
    }

    function endTimer() public {
        end = 60 + start;
    }

    function timeLefts() public view returns(uint){
        return( block.timestamp - end);
    }

    function callThisWhenTimeIsUp() public {
            startTimer();
            endTimer();
            resetVIPs();
            
    }


    function mint() external payable {
        require(isMintEnabled, 'MINTING_NOT_ENABLED');
        require(whitelist[msg.sender], 'NOT_IN_WHITELIST');
        require(mintedWalletes[msg.sender] < 100, 'REARD_BEEN_CLAIMED_ALREADY');
        require(monthlyVIP[msg.sender] , 'YOU_NOT_MONTHLY_VIP');
        
        require(maxSupply > totalSupply, 'SOLD_OUT');
        mintedWalletes[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply; 
        _safeMint(msg.sender, tokenId);   
    }
}
