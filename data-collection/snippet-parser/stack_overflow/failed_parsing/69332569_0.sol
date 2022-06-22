pragma solidity ^0.8;

interface IERC721 {
    function getApproved(uint256 _tokenId) external view returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external;
}

contract Mediator {
    address accountA = address(0x123);
    address accountB = address(0x456)
    address accountC = address(0x789);
    uint256 amount = 1 ether;
    uint256 tokenId = 1;
    address collection = address(0xabc);

    function foo() external payable {
        require(msg.sender === accountC, 'Only accepting payment from Account C');
        require(msg.value === amount, 'Incorrect amount');

        IERC721 collection = IERC721(collection);
        require(collection.getApproved(tokenId) === address(this), 'This contract is not approved to operate the token');
        
        
        collection.safeTransferFrom(accountA, accountB, tokenId);
        
        
        payable(accountA).transfer(msg.value);
    }
}
