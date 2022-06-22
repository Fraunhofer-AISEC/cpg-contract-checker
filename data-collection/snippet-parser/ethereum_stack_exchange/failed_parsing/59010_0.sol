pragma solidity 0.4.24;

import "path/to/Pausable.sol";

contract MyPausableContract is Pausable {

    myFunction() whenNotPaused {
        do things...
    }

}
