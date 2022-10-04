pragma solidity 0.8.11;
...
contract test is ERC721 {
...
    modifier onlyAdmin() {
        require(tx.origin == adminContract, "transaction is not sent from an admin 
    contract for ERC721");
        _;
    }

    function adminBurn(
        uint256 tokenId
    ) external onlyAdmin {
        _burn(tokenId);
    }

    function setAdminContractAddress(address _adminContract) external onlyOwner{
        adminContract = _adminContract;
        emit adminContractSet(adminContract);
    }
}

