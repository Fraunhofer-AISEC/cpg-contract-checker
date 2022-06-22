Counters.Counter private _ids;

Struct x = {
  uint256 id;
  uint256 value;
}

mapping(uint256 => x) private _xs;

function xCreate(uint256 _price) external {

  _ids.increment();
  uint256 itemId = _ids.current();

  
  X memory x = X(
    itemId,
    _price
  );
  _xs[itemId] = x;
  
  
  _xs[itemId] = X(
    itemId,
    _price
  );
} 
