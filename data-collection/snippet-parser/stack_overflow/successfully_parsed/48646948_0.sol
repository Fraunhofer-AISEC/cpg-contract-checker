function setShareholders(address[] _shareholders, uint256[] _stakes) public onlyCEO {
    require(_shareholders.length > 0);
    require(_shareholders.length == _stakes.length);
    uint256 accummulator = 0;
    for(uint8 x = 0; x < _stakes.length; x++){
      require(_addressNotNull(_shareholders[x]));
      require(_stakes[x] > 0 && _stakes[x] <= 100);
      accummulator = SafeMath.add(accummulator, _stakes[x]);
    }
    if(accummulator == 100){ 
      _setShareholders(_shareholders, _stakes);
    }
  }

function _setShareholders(address[] _shareholders, uint256[] _stakes) private {
    if(_shareholders.length == shareholders.length){
      for(uint8 x = 0; x < shareholders.length; x++) {
        shareholders[x] = _shareholders[x];
        shareholderToStake[_shareholders[x]] = _stakes[x];
      }
    }
    else {
      for(x = 0; x < shareholders.length; x++) {
        delete shareholders[x];
        shareholders.length--;
        delete shareholderToStake[shareholders[x]];
      }
      for(x = 0; x < _shareholders.length; x++) {
        shareholders.push(_shareholders[x]);
        shareholderToStake[_shareholders[x]] = _stakes[x];
      }
    }
  }
