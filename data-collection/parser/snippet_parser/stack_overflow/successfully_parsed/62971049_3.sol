pragma solidity ^0.4.17;

contract OperatorTutorial {

    function booleanOperatorTest(bool foo, bool bar) public pure
        returns (bool negation, bool conjunction, bool disjunction, bool equality, bool inequality) {

        
        
           negation = !foo;
        
        
           conjunction  = (foo && bar);
        
        
           disjunction = (foo || bar);
        
        
           equality = (foo  == bar);
        
        
           inequality = (foo != bar);
    }
}