uint public PO;

function () {
    emit Purchase(PO++, msg.sender, msg.value, msg.data); 
}
