



function _getRevertMsg(bytes memory _res) internal pure returns (string memory) {
    
    if (_res.length < 68) return 'Transaction reverted silently';
    bytes memory revertData = _res.slice(4, _res.length - 4); 
    return abi.decode(revertData, (string)); 
}
