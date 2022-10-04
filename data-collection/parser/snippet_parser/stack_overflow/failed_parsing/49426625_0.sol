pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

contract InvoiceSettlement {

struct PurchaseOrderStruct {

    uint8 requisitionNumber;
    uint8 poNumber;

}

PurchaseOrderStruct[10] public PurchaseOrderStructArray;


function InvoiceSettlement()
{
        for (uint i = 0; i < purchaseOrderLength; i++) {

                PurchaseOrderStructArray[i].requisitionNumber = 1;
                PurchaseOrderStructArray[i].poNumber = 1;

        }
}


function  getPurchaseOrderForVendor(string vendorNameInput) constant returns (struct[])
{


    struct[] memory y = new struct[](16);

    for (uint i = 0; i < purchaseOrderLength; i++)
    {
        y[i] = PurchaseOrderStructArray[i];
    }
    return (y);

}


}
