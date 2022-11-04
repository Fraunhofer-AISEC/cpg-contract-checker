function toggleActiveState() 
    public
    isCreator()
    returns (bool)
    {
        if (active)
        {
           active = false;
        } else {
           active = true;
        }
        logMessage('State has been updated', 0);
        return true;
    }
