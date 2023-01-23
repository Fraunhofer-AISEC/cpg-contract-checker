contract Test {
  struct Child { } 
  struct Parent { Child[] children; }

  Parent[] parents;

  function test() public {
      parents.length++;
      Parent storage p = parents[parents.length - 1];

      Child memory c;

      p.children.push(c);
  }
}
