function submit(string memory key) public {
     Provider storage provider = providers[msg.sender];
     Status storage st = provider.jobStatus[key].push();
     st.cost = 100;
}
