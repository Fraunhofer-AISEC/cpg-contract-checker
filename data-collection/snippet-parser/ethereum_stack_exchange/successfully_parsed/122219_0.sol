function verify(
bool success,
bytes memory returndata,
string memory errorMessage
) internal pure returns (bytes memory) {
    if (success) {
        return returndata;
    } else {
        
        if (returndata.length > 0) {
            

            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }
}