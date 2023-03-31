modifier foo {
    require(msg.value > 100, "Boo");
    _;
    globVar = 1010;
}
