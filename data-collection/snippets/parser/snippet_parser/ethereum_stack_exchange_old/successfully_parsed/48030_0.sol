    contract myContract {

        bytes16 public myName;

        function myContract(bytes16 _myName) public {
            myName = _myName;
        } 

        function foo() public view returns (bytes16){
            return fooName;
        }
}
