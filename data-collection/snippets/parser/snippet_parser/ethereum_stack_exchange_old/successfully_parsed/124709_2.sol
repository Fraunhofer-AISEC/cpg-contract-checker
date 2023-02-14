
pragma solidity ^0.8.0;

interface iToken {
        function transfer() external view; 
}

contract Token is iToken {
        function transfer() public override view {
                return;
        }
}

contract Test1 {

        address token;

        constructor(address _token) {
                token = _token;
        }

        function test() public view {
                iToken(token).transfer();             
        }
}

contract Test2 {

        iToken token;

        constructor(iToken _token) {
                token = _token;
        }

        function test() public view {
                token.transfer();
        }
}

contract Test3 {

        Token token;

        constructor(Token _token) {
                token = _token;
        }

        function test() public view {
                token.transfer();
        }
}
