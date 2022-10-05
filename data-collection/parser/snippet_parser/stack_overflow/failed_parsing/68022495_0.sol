bytes4 private constant SELECTOR_TRANSFER = bytes4(keccak256(bytes('transfer(address,uint256)')));
bytes4 private constant SELECTOR_TRANSFERFROM = bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));


  function _myTokenTransfer(uint256 amount) private {
      _safeTransfer(myToken_addr, _msgSender(), amount);
  }
  
  function _busdTransfer(uint256 amount) private {
      _safeTransferFrom(busd_addr, _msgSender(), address(this), amount);
  }

  function _safeTransferFrom(address token, address from, address to, uint value) private {
      (bool success, bytes memory data) = token.call(abi.encodeWithSelector(SELECTOR_TRANSFERFROM, from , to, value));
      require(success && (data.length == 0 || abi.decode(data, (bool))), 'myTokenPrivateSale: TRANSFERFROM_FAILED');
  }
  

  function _safeTransfer(address token, address to, uint value) private {
      (bool success, bytes memory data) = token.call(abi.encodeWithSelector(SELECTOR_TRANSFER, to, value));
      require(success && (data.length == 0 || abi.decode(data, (bool))), 'myTokenPrivateSale: TRANSFER_FAILED');
  }
  
}

