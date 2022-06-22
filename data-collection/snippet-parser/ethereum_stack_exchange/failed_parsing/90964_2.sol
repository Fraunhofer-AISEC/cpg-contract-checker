# This is the correct way of checking permissions
def burnBalance():
    assert msg.sender == owner, "You are not the owner"
    balance[msg.sender] = 0
