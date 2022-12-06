struct B {
    byte x;
}

struct A {
    byte x;
}
byte x = 0x0;
A memory a = A(x = x);
B memory b = B(x = x);