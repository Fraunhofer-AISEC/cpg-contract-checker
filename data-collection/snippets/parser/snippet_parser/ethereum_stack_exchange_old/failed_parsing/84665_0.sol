library A {
  struct Storage { ... }
}

library B {
  using A for A.Storage;

  struct Storage { ... }

  function myFunc(
      Storage storage self,
      A.Storage storage a 
  ) public { 
    
    a.someFuncDefinedForA();
  }
}

contract C {
  using A for A.Storage;
  using B for B.Storage;

  A.Storage internal a;
  B.Storage internal b;

  function doIt() public {
    b.myFunc(a);
  }
}
