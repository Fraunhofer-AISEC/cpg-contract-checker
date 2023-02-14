
pragma solidity 0.8.10;

import {CNTestLib} from '../libraries/CNTestLib.sol';

contract SampleContract {
    function get () public {
        CNTestLib.doStuff();
    }
}
