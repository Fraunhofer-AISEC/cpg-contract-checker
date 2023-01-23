struct A { ... }
struct B { A a; }

A[] aa;
B[] bb;

function createB(uint256 aIndex) {
  A storage a = aa[aIndex];
  B memory b = B({a: a});

  bb.push(b);
}
