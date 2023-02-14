turtle_deployed = Turtles.deploy(
        "Turtles",
        "Turtle",
        "ipfs://bafybeiczsscdsbs7ffqz55asqdf3smv6klcw3gofszvwlyarci47bgf354/",
        [100, 10, 20000, 20, 10, 1655480363, 1655473254, 100],
        "ea58dfa481a0c08b4af0417e3f62244215a1ab1eae0a100da48407be5cdd94b7",
        addresses,
        [10, 15],
        addresses,  <-- **THIS is suppose to be an Address, not a list of Address**
        700,
        {"from": account},
        publish_source=True,
    )
