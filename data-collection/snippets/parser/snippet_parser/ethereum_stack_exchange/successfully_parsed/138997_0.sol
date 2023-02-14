
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Test {
    function transferToken(address _contract,address to ,uint256 _tokenId) public{
        
        IERC721(_contract).transferFrom(msg.sender, to, _tokenId);
    }
    function transferToContract(address _contract,uint256 _tokenId) public{
        IERC721 token = IERC721(_contract);
        token.safeTransferFrom(msg.sender,address(this), _tokenId, "");
    }
    function approveNFT(address _contract, address operator, bool approved) public{
        IERC721 token = IERC721(_contract);
        
        token.setApprovalForAll(operator, approved);
    }
    function checkName(address _contract) public view returns (string memory){
        ERC721 token = ERC721(_contract);
        return token.name();
    }
    function checkSender() public view returns (address,address){
        return (msg.sender,address(this));
    }
    function isItApprovedForAll(address _contract,address owner) public view returns (bool){
        IERC721 token = IERC721(_contract);
        return token.isApprovedForAll(owner,_contract);
    }
}
