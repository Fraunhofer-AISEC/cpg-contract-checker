uint splitValue = uint(msg.value/beneficiaryList.length);
uint l = beneficiaryList.length;
for (uint index = 0; index < l; index++) { 
    address b = beneficiaryList[index];
    if (b != msg.sender) {
        b.transfer(splitValue);
    }
}
