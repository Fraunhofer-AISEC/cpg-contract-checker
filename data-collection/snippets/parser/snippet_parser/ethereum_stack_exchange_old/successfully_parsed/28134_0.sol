pragma solidity ^0.4.0;

interface Letter {
    function f() 
        public 
        returns (uint);
}

contract A is Letter {
    function f() 
        public 
        returns (uint) {
        return 1;
    }
}

contract B is A {
}

contract C is Letter {
    function f() 
        public 
        returns (uint) {
        return 2;
    }
}

contract Alphabet {
    Letter[] letters;

    event printer(uint);

    
    function Alphabet() 
        public {
        letters.push(new A());
        letters.push(new B());
        letters.push(new C());
    }

    
    function alphabetFromAddresses(address _addrA, address _addrB, 
                                   address _addrC)
        public{
        letters.push(A(_addrA));
        letters.push(B(_addrB));
        letters.push(C(_addrC));
    }

    function getLetters() 
        public {
        for(uint i = 0; i < letters.length; i++) {
            printer(letters[i].f());
        }
    }
}
