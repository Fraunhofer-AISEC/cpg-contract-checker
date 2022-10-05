contract Contract {

struct A {
  int a;
}

struct B {
  A[] as;
}

mapping(address => B[]) bs;

function addB(B memory b) {
  bs[msg.sender].push(...???...);
}

}
