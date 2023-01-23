    function _msgSender() internal view virtual override returns (address sender) {
        if (isTrustedForwarder(msg.sender)) {
            
            assembly { sender := shr(96, calldataload(sub(calldatasize(), 20))) }
        } else {
            return super._msgSender();
        }
    }
