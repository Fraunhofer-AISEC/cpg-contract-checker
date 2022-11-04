function assetTransfer (string memory  order_id,string memory  state) public payable {
 DeliveryClause memory dc = DeliveryClause.getClauseByOrderId(order_id);
 CrowdTask memory ct = CrowdTask.getTaskByOrderId(order_id);
 address dAddress = ct.drone;
 
 if(compareStr(state, "sucessful")){
     dc.station.transfer(dc.loss_money + dc.fee);
     dAddress.transfer(ct.loss_money + ct.fee);
 }
 
 if(compareStr(state, "lost")){
     dc.receiver.transfer(dc.loss_money+ dc.fee);
     dc.station.transfer(ct.loss_money + ct.fee);
 }

 if(compareStr(state, "timeout")){
     dc.receiver.transfer(dc.overtime_money);
     dc.station.transfer(dc.loss_money + dc.fee-dc.overtime_money/2);
     dAddress.transfer(ct.loss_money + ct.fee-dc.overtime_money/2);
        
  }
}
