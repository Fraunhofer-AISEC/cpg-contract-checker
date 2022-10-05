from solc import compile_source, compile_files, link_code

    source = """
    pragma solidity ^0.4.2;
    contract Example {
        string s="Hello World!";
        function set_s(string new_s) {
            s = new_s;
        }
        function get_s() returns (string) {
            return s;
        }
    }"""

compiled = compile_source(source)
