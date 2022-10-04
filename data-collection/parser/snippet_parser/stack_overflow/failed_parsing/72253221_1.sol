pragma solidity 0.8.11;
...
contract adminContract is Ownable{
...
    function _callAdminBurn(address _ERC721, uint256 id) internal {
        bytes memory payload = abi.encodeWithSignature("adminBurn(uint256)",id);
        (bool success, bytes memory result) = _ERC721.call(payload);
        emit adminBurnByCall(_acceptedERC1155, success, result);
    }

    function _delegatecallAdminBurn(address _ERC721, uint256 id) internal {
        bytes memory payload = abi.encodeWithSignature("adminBurn(uint256)",id);
        (bool success, bytes memory result) = _ERC721.delegatecall(payload);
        emit adminBurnByCall(_acceptedERC1155, success, result);
    }


}
