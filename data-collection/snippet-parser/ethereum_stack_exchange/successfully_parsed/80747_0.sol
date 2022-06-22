 function proceed() returns (bool success) {

if (msg.sender != owner) return false;

        return important_function();
    }
