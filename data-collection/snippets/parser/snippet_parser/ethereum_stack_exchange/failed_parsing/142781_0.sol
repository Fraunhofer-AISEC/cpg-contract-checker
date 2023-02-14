import {contractA} from "<path to contract A>";
import {contractB} from "<path to contract B>";
contract C {
    function execute() external {
        contractA A = contractA(<address of A>);
    
        bool success = A.functionYouWantToCall();

        require(success, "functionYouWantToCall not successful");

        contractB B = contractB(<address of B>);

        B.transferOwnership(<new address>);
    }

}
