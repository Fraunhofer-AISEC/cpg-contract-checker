contract Test {
  struct Child { } 
  struct Parent { Child[] children; }

  Parent[] parents;

  function test() {
    parents.push(Parent(new Child[](0)));
  }
}
