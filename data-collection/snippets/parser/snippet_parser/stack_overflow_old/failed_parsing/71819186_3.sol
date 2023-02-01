from brownie import TestLoop, NoLoop, Loop, accounts

def function_calls():
    contract = TestLoop.deploy({'from': accounts[0]})
    print('set array in loop')
    contract.setArrayWithLoop([1, 2, 3, 4], {'from': accounts[1]})
    print('array ', contract.show(), '\n\n')

    print('set array by copy from memory to storage')
    contract.setArrayWithoutLoop([10, 9, 8, 7], {'from': accounts[2]})
    print('array ', contract.show(), '\n\n')

def deploy_no_loop():
    print('deploy NoLoop contract')
    contract = NoLoop.deploy([21, 22, 23, 24], {'from': accounts[3]})
    print('array ', contract.show(), '\n\n')

def deploy_loop():
    print('deploy Loop contract')
    contract = Loop.deploy([31, 32, 33, 34], {'from': accounts[3]})
    print('array ', contract.show(), '\n\n')

def main():
    function_calls()
    deploy_no_loop()
    deploy_loop()
