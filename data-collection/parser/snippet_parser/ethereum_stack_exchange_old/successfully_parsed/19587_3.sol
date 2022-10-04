
function _fromToken(bytes memory data) internal pure returns(IERC20 token) {
    assembly {
        token := mload(add(data, 36))
    }
}


function _destToken(bytes memory data) internal pure returns(IERC20 token) {
    assembly {
        token := mload(add(data, 68))
    }
}
