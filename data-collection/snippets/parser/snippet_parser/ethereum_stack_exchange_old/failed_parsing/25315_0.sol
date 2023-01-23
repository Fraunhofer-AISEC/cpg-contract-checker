class A {
public:
    A() {}
    virtual void aFunction(void) { printf("Hello"); }
    virtual void bFunction(void) = 0;
};

class B : public A {
public:
    B() : A() {}
};
