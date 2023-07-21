vrf_coordinator = VRFCoordinatorV2Mock.deploy(
    config["networks"][network.show_active()]["fee"],
    GAS_PRICE_LINK,
    {"from": account},
)
tx = vrf_coordinator.createSubscription()
tx.wait(1)
event = tx.events[0]
print(event)
sub_id = event['subId']
print(sub_id)
