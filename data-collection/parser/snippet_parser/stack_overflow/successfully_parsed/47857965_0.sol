    contract HelperContract {
        function foo() public pure returns(uint) {
            return(0);
        }
    }

    contract MainContract {
        HelperContract helperContract;

        function MainContract(address helperAddress) public {
            helperContract = HelperContract(helperAddress);
        }

        function bar() public view returns(uint) {
            return helperContract.foo();
        }
    }
