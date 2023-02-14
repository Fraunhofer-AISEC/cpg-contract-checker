contract Test {
  struct Child { } 
  struct Parent { 
      mapping(uint => Child) children;
      uint childrenSize;
  }

  Parent[] parents;

  function testWithEmptyChildren() public {
      parents.push(Parent({childrenSize: 0}));
  }

  function testWithChild(uint index) public {
      Parent storage p = parents[index];

      p.children[p.childrenSize] = Child();
      p.childrenSize++;
  }
}
