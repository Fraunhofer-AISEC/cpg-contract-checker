pragma solidity ^0.4.0;

    contract C {
        uint someVariable;
        uint[] data;

        function f() {
            uint[] x = data;
            x.push(2);
        }
    }
