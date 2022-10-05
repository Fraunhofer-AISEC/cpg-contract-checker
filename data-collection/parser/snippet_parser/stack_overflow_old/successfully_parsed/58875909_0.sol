function createProject( uint _pid, string memory _name, 
                        string memory _description, 
                        uint _deadline)  OnlyClient public  payable{
   require(msg.value >= 50,"insufficient funds");
  project storage prj = projects[_pid];
  prj.pid = _pid;
  prj.clientAddr = msg.sender;
  prj.name = _name;
  prj.bidAmount = msg.value;
  prj.description = _description;
  prj.deadline = _deadline;
  prj.isOpen = true;
  prj.isSubmitted = false;
  prj.isAccepted = false;

  projectIDs.push(_pid) -1;
  listProjects.push(_name) -1;

  emit LogRegisterProject(_pid, prj.clientAddr, _name, prj.bidAmount, _description, _deadline, prj.isOpen);
}