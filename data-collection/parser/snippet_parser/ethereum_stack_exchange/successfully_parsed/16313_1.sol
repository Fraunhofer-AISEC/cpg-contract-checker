contract Product{
  address public owner;
  string public title;
  mapping (address => uint) quantity;

  event Transferred(address from, address to, uint quantity);

  
  function Product(string _title, uint _quantity){
    owner = msg.sender;
    title = _title;
    quantity[msg.sender] = _quantity;
  }

  function getQuantity(address _user) constant returns (uint _quantity){
    return quantity[_user];
  }

  function changeQuantity(uint _quantity) returns (bool success){
    quantity[msg.sender] = _quantity;
    return true;
  }

  function transfer(address _to, uint _quantity) returns (bool success){
    if (quantity[msg.sender] < _quantity){
      return false;
    }

    owner = _to;
    quantity[msg.sender] -= _quantity;
    quantity[_to] += _quantity;
    Transferred(msg.sender, _to, _quantity);
    return true;
  }
}
