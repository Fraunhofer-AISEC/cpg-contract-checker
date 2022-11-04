arr = contractInstance.functions.getVariables().call()
print('arr[4] in str()= '+ str(arr[4]))#must be converted to string
b2= arr[4].decode('utf8')
print('b2.decode("utf8")= '+ b2)
arr[4] = ''
print('after arr[4] = "", arr[4]= '+ arr[4])
arr[4] = b2
print('after arr[4] = b2, arr[4]= '+ arr[4])
arr[0] = 'What man?'
print('after arr[0] = "What man?", arr[0]= '+ arr[0])
print('\nget many variables: {}'.format(arr))
