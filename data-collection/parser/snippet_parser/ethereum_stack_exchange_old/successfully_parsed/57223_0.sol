pragma solidity ^0.4.22;

import "../CheckERC165.sol";
import "../standard/ERC721.sol";
import "../standard/ERC721TokenReceiver.sol";
import "../libraries/SafeMath.sol";



contract TokenERC721 is ERC721, CheckERC165{
    using SafeMath for uint256;


    
    address internal creator;
    
    uint256 internal maxId;
    mapping(address => uint256) internal balances;
    mapping(uint256 => bool) internal burned;
    mapping(uint256 => address) internal owners;
    mapping (uint256 => address) internal allowance;
    mapping (address => mapping (address => bool)) internal authorised;


    
    
    constructor(uint _initialSupply) public CheckERC165(){
        creator = msg.sender;
        balances[msg.sender] = _initialSupply;
        maxId = _initialSupply;

        
        supportedInterfaces[
            this.balanceOf.selector ^
            this.ownerOf.selector ^
            
            
            bytes4(keccak256("safeTransferFrom(address,address,uint256"))^
            bytes4(keccak256("safeTransferFrom(address,address,uint256,bytes"))^
            this.transferFrom.selector ^
            this.approve.selector ^
            this.setApprovalForAll.selector ^
            this.getApproved.selector ^
            this.isApprovedForAll.selector
        ] = true;
    }

    
    
    
    
    function isValidToken(uint256 _tokenId) internal view returns(bool){
        return _tokenId != 0 && _tokenId <= maxId && !burned[_tokenId];
    }


    
    
    
    
    
    function balanceOf(address _owner) external view returns (uint256){
        return balances[_owner];
    }

    
    
    
    
    
    function ownerOf(uint256 _tokenId) public view returns(address){
        require(isValidToken(_tokenId));
        if(owners[_tokenId] != 0x0 ){
            return owners[_tokenId];
        }else{
            return creator;
        }
    }

    
    
    
    
    
    
    function issueTokens(uint256 _extraTokens) public{
        require(msg.sender == creator);
        balances[msg.sender] = balances[msg.sender].add(_extraTokens);

        
        for(uint i = maxId.add(1); i <= maxId.add(_extraTokens); i++){
            emit Transfer(0x0, creator, i);
        }

        maxId += _extraTokens; 
    }

    function burnToken(uint256 _tokenId) external{
        address owner = ownerOf(_tokenId);
        require ( owner == msg.sender             
            
            || allowance[_tokenId] == msg.sender      
            || authorised[owner][msg.sender]          
        );
        burned[_tokenId] = true;
        balances[owner]--;

        
        emit Transfer(owner, 0x0, _tokenId);
    }


    
    
    
    
    
    
    function approve(address _approved, uint256 _tokenId)  external{
        address owner = ownerOf(_tokenId);
        require( owner == msg.sender                    
            || authorised[owner][msg.sender]                
        );
        emit Approval(owner, _approved, _tokenId);
        allowance[_tokenId] = _approved;
    }

    
    
    
    
    function getApproved(uint256 _tokenId) external view returns (address) {
        require(isValidToken(_tokenId));
        return allowance[_tokenId];
    }

    
    
    
    
    function isApprovedForAll(address _owner, address _operator) external view returns (bool) {
        return authorised[_owner][_operator];
    }




    
    
    
    
    
    function setApprovalForAll(address _operator, bool _approved) external {
        emit ApprovalForAll(msg.sender,_operator, _approved);
        authorised[msg.sender][_operator] = _approved;
    }


    
    
    
    
    
    
    
    
    
    
    function transferFrom(address _from, address _to, uint256 _tokenId) public {
        
        
        address owner = ownerOf(_tokenId);

        require ( owner == msg.sender             
            
            || allowance[_tokenId] == msg.sender      
            || authorised[owner][msg.sender]          
        );
        require(owner == _from);
        require(_to != 0x0);
        

        emit Transfer(_from, _to, _tokenId);

        owners[_tokenId] = _to;
        balances[_from]--;
        balances[_to]++;
        
        if(allowance[_tokenId] != 0x0){
            delete allowance[_tokenId];
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) public {
        transferFrom(_from, _to, _tokenId);

        
        uint32 size;
        assembly {
            size := extcodesize(_to)
        }
        if(size > 0){
            ERC721TokenReceiver receiver = ERC721TokenReceiver(_to);
            require(receiver.onERC721Received(msg.sender,_from,_tokenId,data) == bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")));
        }

    }

    
    
    
    
    
    
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external {
        safeTransferFrom(_from,_to,_tokenId,"");
    }


}
