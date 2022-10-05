struct signature {
    string value;
    uint rate;
    address sender_acc;
    
}

signature[5] public unverified_sig; 
                                    


function add_signature(string rec_signature) public {
    unverified_sig[0].sender_acc=msg.sender;
    unverified_sig[0].value=rec_signature;
    unverified_sig[0].rate=0;
}
