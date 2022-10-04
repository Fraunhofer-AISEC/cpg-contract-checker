pragma solidity ^0.4.24;
contract Test {

    uint timeStamp = 4;

    event beforeTimeStamp();

    modifier NotTooLate() {
      require(timeStamp > 2);
      emit beforeTimeStamp();  
      _;
    }

    function sample() NotTooLate  external {

    }

}
