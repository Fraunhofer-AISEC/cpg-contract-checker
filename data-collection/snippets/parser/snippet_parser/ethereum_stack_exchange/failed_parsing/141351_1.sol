def test_can_withdraw():

   # ARRANGE
   buy_coffee = deploy_buycoffee()  # works fine as contract is deployed

   # ACT
   print("Before: ", buy_coffee.balance())  # Before:  0

   tx = send_money()  # works fine as tested by sending {"from": get_account(account_index=1)}

   tx.wait(1)
   print("During: ", buy_coffee.balance())  # During:  1000000000000000

   tx = buy_coffee.withdrawMoney({"from": get_account(account_index=0)})  # BROKEN!

   tx.wait(1)
   print("After: ", buy_coffee.balance())  # should be 0 but is 1000000000000000

   # ASSERT
   assert buy_coffee.balance() == 0
