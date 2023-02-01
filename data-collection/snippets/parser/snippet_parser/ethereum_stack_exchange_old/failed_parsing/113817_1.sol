type = "directrequest"
schemaVersion = 1
name = "example eth request event spec"
contractAddress = "0xCcbB32b820799DDCadCFeEE472B9804a1397005E"
maxTaskDuration = "0s"
observationSource = """
    ds          [type="http" method=GET url="https:
    ds_parse    [type="jsonparse" path="FIRE_NUMBE"]
    

    ds -> ds_parse 
"""
externalJobID = "37ab8f92-090e-4d23-9b08-96495f96899f"
