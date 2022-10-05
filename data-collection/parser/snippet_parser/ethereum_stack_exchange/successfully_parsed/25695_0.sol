function toggleActiveState() 
    public
    isCreator()
    returns (bool)
    {
        active = !active;
        logMessage('State has been updated', 0);
        return true;
    }
