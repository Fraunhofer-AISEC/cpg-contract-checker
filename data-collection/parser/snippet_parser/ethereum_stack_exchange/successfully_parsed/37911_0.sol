function() payable {
    require(tx.gasprice<30000000000); 
                                      
    doOtherProcessing();
}
