 function buyService(uint256 IDService,address ServiceUser,uint256 costService) public  {   
    Status storage s=StatusUsers[IDService][ServiceUser];
    require(s.state == StateService.Init);      
    token.transferFrom(ServiceUser,owner,costService);      
    s.state=StateService.Paid;
    s.cost=costService;
    emit Paid();   
}
