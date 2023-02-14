Thing1 memory t1 = Thing1({ foo: true, bar: 42 });
Thing2 memory t2 = Thing2({
    foo: t1.foo,
    bar: t1.bar
});
