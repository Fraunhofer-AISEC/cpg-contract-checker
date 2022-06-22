constructor(string _name, uint size, string _color) public {
  Shoe memory newShoe = Shoe({
    name: _name,
    size: _size,
    color: _color
  })

  data = newShoe;
}
