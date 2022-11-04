(bool success, bytes memory data) = address(token).call(abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
require(success && (data.length == 0 || abi.decode(data, (bool))), 'token transfer from sender failed');
