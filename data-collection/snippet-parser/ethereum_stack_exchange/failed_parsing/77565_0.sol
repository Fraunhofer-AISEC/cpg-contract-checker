function abiExpr()
{
for(i=0; i<sources.length; i++){ 

  if(!getterFunctionsObject[i])
    getterFunctionsObject[i] = [] 

  if(!constrObject[i])
    constrObject[i] = [] 

  if(!setterFunctionsObject[i])
  setterFunctionsObject[i] = [] 

  if(!settersParameters[i])
  settersParameters[i] = []
  if(!settersParameters[i][i])
  settersParameters[i][i] = [] 

  for (let item of sources[i].abi) {

    if (item.type === "constructor") 
    {
      constrObject[i].push(item.inputs)

    }

    if (item.type === "function") 
    {
      if((item.inputs).length ==0 && item.stateMutability==='view')
     getterFunctionsObject[i].push(item.name)
    }

    if (item.type === "function") 
    {
      if((item.inputs).length>0)
          {

            for(t=0 ; t<(item.inputs).length; t++)
            {
              if ((item.inputs[t].name).length>0)
              {
                setterFunctionsObject[i].push(item.name)
                settersParameters[i][t].push(item.inputs[t].name)
              }
            }
          }
    }
}
}
}
