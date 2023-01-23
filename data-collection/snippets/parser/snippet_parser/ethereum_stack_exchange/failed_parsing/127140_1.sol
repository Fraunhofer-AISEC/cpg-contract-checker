pragma solidity >=0.8.1;

import {AppStorage} from "../libraries/LibAppStorage.sol";

function submitApplication(
        address _grant
    ) external {
        require(!AppStorage.applicantGrant[msg.sender][_grant], "XXX");
......
        }
