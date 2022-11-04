abstract ERC20 {
    function _transfer(
        address _from,
        address _to,
        uint256 _value
    ) internal {}

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}

contract ERC1155 {
    function buyNFT(uint256 _NFTPrice, address _to)
        public
        returns (bytes memory)
    {
        (bool success, bytes memory returnData) = 0x00...00.delegatecall(
            abi.encodeWithSelector(HRC20.transfer.selector, _to, _NFTPrice)
        );

        if (!success) {
            if (returnData.length == 0) revert("here");

            assembly {
                revert(add(32, returnData), mload(returnData))
            }
        }

        return returnData;
    }

}
