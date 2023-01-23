pragma solidity ^0.5.12;  
import "./ERC721.sol";  
contract abcToken is ERC721 { 

    struct Item{
        uint id;
        bytes name; 
        uint creationTime; 
        uint tokenType;  
        uint expiryduration;
    }

    Item[] public items; 

    struct User {
        uint[][] tokenId;
    }

    mapping (address => User) usersByAddr;
    address[] users;
    address public owner;
    address[] public owners;
    uint[] public tokenCount;
    uint[] public tokenCountInSupply;
    bytes transactionSymbol = "MTXN";
    bytes reputationSymbol = "MREP";
    bytes attentionSymbol = "MATT";

    event tokenCreated(address _to, uint _tokenType, uint _amount, uint timeCreated, uint[] _tokenId);
    event tokenDestroyed(address _from, uint _tokenType, uint _amount, uint timeDestroyed, uint[] _tokenId, bool penalty);
    event tokenTransfer(address _from, address _to, uint _tokenType, uint _amount, uint transferTime, uint[] _tokenId);
    event ownerAdded(address _primaryOwner, address _secondaryOwner);
    event ownerRemoved(address _primaryOwner, address _secondaryOwner);

    constructor() public {
        owner == msg.sender; 
        owners.push(msg.sender); 
        for(uint i = 0; i < 3; i++) {
            tokenCount[i] = 0;
            tokenCountInSupply[i] = 0;
        }
    }
    
    function isOwner() public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                return true;
            }
        }
        return false;
    }

    
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    function createItem(address _to, uint _tokenType, uint _expiryduration, uint quantity) public onlyOwner() {
        
        
        bytes memory tokenSymbol;
        if(_tokenType == 0) tokenSymbol = transactionSymbol;
        if(_tokenType == 1) tokenSymbol = reputationSymbol;
        if(_tokenType == 2) tokenSymbol = attentionSymbol;
        bytes memory _name = tokenSymbol; 
        uint[] memory _tokenIds;
        uint _creationTime = block.timestamp;
        bool firstTimeUser = true;
        for(uint j = 0; j < users.length; j++) {
            if (users[j] == _to) {
                firstTimeUser = false;
                break;
            }
        }
        for (uint i = 0; i < quantity; i++) {
            uint id = items.length; 
            items.push(Item(id,_name, _creationTime, _tokenType, _expiryduration));
            _tokenIds[i] = id;
            if(!firstTimeUser) {
                uint usertokenlength = usersByAddr[_to].tokenId[_tokenType].length;
                usersByAddr[_to].tokenId[_tokenType][usertokenlength] = id;
            }
            if (firstTimeUser) {
                uint[][] memory usersTokens;
                usersTokens[_tokenType][0] = id;
                User memory newuser = User(usersTokens);
                usersByAddr[_to] = newuser;
                users.push(_to);
                firstTimeUser = false;
            }
            _mint(_to,id); 
            tokenCount[_tokenType] += 1;
            tokenCountInSupply[_tokenType] += 1;
        }
        emit tokenCreated(_to, _tokenType, quantity, _creationTime, _tokenIds);
    }

    function getUsers() public view returns (address[] memory _users) {
        return users;
    }

    function tokenDetails(uint _tokenId) public view returns (uint _id, bytes memory _tokenName, uint _creationTime, uint _tokenType, uint _expiryduration) { 
        for(uint i = 0; i < items.length; i++) {
            if(items[i].id == _tokenId) {
                _id = items[i].id;
                _tokenName = items[i].name;
                _creationTime = items[i].creationTime;
                _tokenType = items[i].tokenType;
                _expiryduration = items[i].expiryduration;
            }
        }
        return (_id, _tokenName, _creationTime, _tokenType, _expiryduration);
    }

    function getUserTokens(address _userAddress, uint _tokenType) public returns (uint[] memory _tokens) { 
        burnToken(_userAddress);
        return usersByAddr[_userAddress].tokenId[_tokenType];
    }

    function getUserBalance(address _userAddress) public view returns(uint txnBlanace, uint repBalance, uint attBalance) {
        txnBlanace = usersByAddr[_userAddress].tokenId[0].length;
        repBalance = usersByAddr[_userAddress].tokenId[1].length;
        attBalance = usersByAddr[_userAddress].tokenId[2].length;
        return (txnBlanace, repBalance, attBalance);
    }

    function burnTokenPenalty(address _userAddress, uint _tokenType, uint quantity) public onlyOwner() returns (uint _tokenBurntQuantity) {
        uint[] memory tokensDeletedPosition;
        uint[] memory _tokenIds;
        for(uint j = 0; j < usersByAddr[_userAddress].tokenId[_tokenType].length; j++) {
            if(_tokenIds.length < quantity && items[usersByAddr[_userAddress].tokenId[_tokenType][j]].creationTime + items[usersByAddr[_userAddress].tokenId[_tokenType][j]].expiryduration >= block.timestamp) {
                _burn(_userAddress, items[usersByAddr[_userAddress].tokenId[_tokenType][j]].id);
                _tokenIds[j] = items[usersByAddr[_userAddress].tokenId[_tokenType][j]].id;
                delete usersByAddr[_userAddress].tokenId[_tokenType][j];
                tokensDeletedPosition[tokensDeletedPosition.length] = j;
            }
        }
        shiftUserTokens(_userAddress, _tokenType,tokensDeletedPosition);
        emit tokenDestroyed(_userAddress, _tokenType, tokensDeletedPosition.length, block.timestamp, _tokenIds, true);
        return _tokenIds.length;
    }

    
    function burnToken(address _userAddress) public onlyOwner() {
        for(uint i = 0; i < 3; i++) {
            uint[] memory tokensDeletedPosition;
            uint[] memory _tokenIds;
            for(uint j = 0; j < usersByAddr[_userAddress].tokenId[i].length; j++) {
                if(items[usersByAddr[_userAddress].tokenId[i][j]].creationTime + items[usersByAddr[_userAddress].tokenId[i][j]].expiryduration <= block.timestamp) {
                    _burn(_userAddress, items[usersByAddr[_userAddress].tokenId[i][j]].id);
                    _tokenIds[j] = items[usersByAddr[_userAddress].tokenId[i][j]].id;
                    delete usersByAddr[_userAddress].tokenId[i][j];
                    tokensDeletedPosition[tokensDeletedPosition.length] = j;
                }
            }
            shiftUserTokens(_userAddress,i,tokensDeletedPosition);
            emit tokenDestroyed(_userAddress, i, tokensDeletedPosition.length, block.timestamp, _tokenIds, false);
        }
    }

    function shiftUserTokens(address _userAddress, uint _tokenType, uint[] memory deletedPositions) public onlyOwner() {
        uint tokenListLength = usersByAddr[_userAddress].tokenId[_tokenType].length;
        for (uint i = 0; i < deletedPositions.length; i++) {
            if (deletedPositions[i] < tokenListLength-1 ) {
                usersByAddr[_userAddress].tokenId[_tokenType][deletedPositions[i]] = usersByAddr[_userAddress].tokenId[_tokenType][tokenListLength -1];
                delete usersByAddr[_userAddress].tokenId[_tokenType][tokenListLength -1];
                tokenListLength = usersByAddr[_userAddress].tokenId[_tokenType].length;
                tokenCountInSupply[_tokenType] -= 1;
            }
        }
    }

    function transferToken(address _from, address _to, uint _tokenType, uint _amount, uint _expiryTime, bytes memory _reason) public returns (uint[] memory tokens, uint[] memory tokenPositions) {
        require(msg.sender == owner || msg.sender == _from);
        uint validTokensCount = 0;
        uint[] memory validTokens;
        uint[] memory validTokenPositions;
        for (uint i = 0; i < usersByAddr[_from].tokenId[_tokenType].length; i++) {
            uint itemNo = usersByAddr[_from].tokenId[_tokenType][i];
            if (items[itemNo].creationTime + items[itemNo].expiryduration >= _expiryTime ) {
                validTokens[validTokensCount] = usersByAddr[_from].tokenId[_tokenType][i];
                validTokenPositions[validTokensCount] = i;
                validTokensCount += 1;
            }
        }
        if (validTokensCount >= _amount) {
            uint _toTokenLength = usersByAddr[_to].tokenId[_tokenType].length ;
            for (uint i = 0; i < validTokens.length; i++) {
                safeTransferFrom(_from, _to, validTokens[i], _reason);
                delete usersByAddr[_from].tokenId[_tokenType][validTokenPositions[i]];
                usersByAddr[_to].tokenId[_tokenType][_toTokenLength] = validTokens[i];
                _toTokenLength += 1;
            }
            emit tokenTransfer(_from, _to, _tokenType, _amount, block.timestamp, validTokens);
            return (validTokens, validTokenPositions);
        } else {
            delete validTokens;
            delete validTokenPositions;
            return (validTokens, validTokenPositions);
        }

    }

    function addOwner(address _secondaryOwner) public onlyOwner() {
        owners.push(_secondaryOwner);
        emit ownerAdded(msg.sender, _secondaryOwner);
    }

    function removeOwner(address _secondaryOwner) public onlyOwner() {
        bool ownerRemovedflag = false;
        uint removedPosition;
        for( uint i = 0; i < owners.length; i++) {
            if(owners[i] == _secondaryOwner) {
                delete owners[i];
                ownerRemovedflag = true;
                removedPosition = i;
                emit ownerRemoved(msg.sender, _secondaryOwner);
            }
        }
        if(ownerRemovedflag) {
            if(removedPosition < owners.length-1) {
                owners[removedPosition] = owners[owners.length-1];
                delete owners[owners.length-1];
            }
        }
    }
}
