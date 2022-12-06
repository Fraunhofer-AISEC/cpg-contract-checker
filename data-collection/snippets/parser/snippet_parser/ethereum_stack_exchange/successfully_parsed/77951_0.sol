pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721BasicToken.sol";


contract Ticket is Ownable, ERC721BasicToken {

    
    address public eventAddress;

    
    struct TicketData {
        uint256 eventId;
        bool redeemed;
    }

    constructor(address _eventAddress) public {
        eventAddress = _eventAddress;
    }

    
    
    TicketData[] public tickets;

    
    mapping(address => uint256[]) internal ownedTokens;

    
    mapping(uint256 => uint256) internal ownedTokensIndex;

    
    modifier onlyEventContract() {
        require(msg.sender == eventAddress, "Sender must be Event contract");
        _;
    }

    
    function updateEventAddress(address _eventAddress) external onlyOwner {
        eventAddress = _eventAddress;
    }

    
    function isValid(
        uint256 eventId,
        uint256 ticketId,
        bytes32 msgHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public view returns (uint8) {
        
        if (ticketId >= tickets.length) return 2;

        
        if (recovery(msgHash, v, r, s) != tokenOwner[ticketId]) return 3;

        
        if (tickets[ticketId].eventId != eventId) return 4;

        return 5;
    }

    
    function isRedeemable(
        uint256 eventId,
        uint256 ticketId,
        bytes32 msgHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public view returns (uint8) {
        
        
        if (ticketId >= tickets.length) return 2;

        if (tickets[ticketId].redeemed) return 1;

        return isValid(eventId, ticketId, msgHash, v, r, s);
    }

    
    function recovery(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) private pure returns (address) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, msgHash));
        return ecrecover(prefixedHash, v, r, s);
    }

    
    function redeem(uint256 ticketId, uint256 eventId) external onlyEventContract {
        require (ticketId < tickets.length, "Ticket does not exist");
        require (tickets[ticketId].eventId == eventId, "Ticket does not belong to the event");

        tickets[ticketId].redeemed = true;
    }

    
    function buy(address buyer, uint256 eventId) external onlyEventContract returns (uint256) {
        uint256 id = tickets.push(TicketData(eventId, false)) - 1;
        _mint(buyer, id);

        return id;
    }

    
    function tokenOfOwner(address _owner)
        public
        view
        returns (uint256[])
    {
        return ownedTokens[_owner];
    }

    

    
    function tokenOfOwnerByIndex(address _owner, uint256 _index)
        public
        view
        returns (uint256)
    {
        require(_index < balanceOf(_owner), "Token index out of owners token list bounds");
        return ownedTokens[_owner][_index];
    }

    
    function addTokenTo(address _to, uint256 _tokenId) internal {
        super.addTokenTo(_to, _tokenId);
        uint256 length = ownedTokens[_to].length;
        ownedTokens[_to].push(_tokenId);
        ownedTokensIndex[_tokenId] = length;
    }

    
    function removeTokenFrom(address _from, uint256 _tokenId) internal {
        super.removeTokenFrom(_from, _tokenId);

        uint256 tokenIndex = ownedTokensIndex[_tokenId];
        uint256 lastTokenIndex = ownedTokens[_from].length.sub(1);
        uint256 lastToken = ownedTokens[_from][lastTokenIndex];

        ownedTokens[_from][tokenIndex] = lastToken;
        ownedTokens[_from][lastTokenIndex] = 0;
        
        
        

        ownedTokens[_from].length--;
        ownedTokensIndex[_tokenId] = 0;
        ownedTokensIndex[lastToken] = tokenIndex;
    }
}
