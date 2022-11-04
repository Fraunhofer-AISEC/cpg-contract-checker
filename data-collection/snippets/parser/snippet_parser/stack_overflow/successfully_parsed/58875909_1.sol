function joinProject (uint _pid, address _freelancerAddr) OnlyFreelancer public {
    require(projects[_pid].isOpen=true,"Project is not open yet");
    projects[_pid].isOpen = false;
    projects[_pid].freelancerAddr = _freelancerAddr;
    emit LogJoinProject(msg.sender, _pid);
} 
