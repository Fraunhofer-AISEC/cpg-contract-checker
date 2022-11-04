pragma solidity ^0.4.9;


    contract Hello  {

        
        string public greeting;

        
        event GreetingChanged(string _greeting);

        
        function Hello(string _greeting) {

            greeting = _greeting;

        }

        
        function setGreeting(string _greeting) {

            greeting = _greeting;

            
            GreetingChanged(_greeting);
        }

        
        function greet() constant returns (string _greeting) {

            greeting = _greeting;

        }

    }
