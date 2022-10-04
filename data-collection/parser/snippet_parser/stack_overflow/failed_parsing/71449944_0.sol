  final access = await ethereum!.requestAccount();
  if (access.isNotEmpty) currentAddress = access.first;
