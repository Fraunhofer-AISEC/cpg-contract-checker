contract c {
        function test() public {
                bytes foo = new bytes(1);

                foo[0] = 128;
                foo.push(64);

                assert(foo.length == 2);

                assert(foo[1] == 64);

                assert(64 == foo.pop());

                assert(foo.length == 1);
        }
         }
