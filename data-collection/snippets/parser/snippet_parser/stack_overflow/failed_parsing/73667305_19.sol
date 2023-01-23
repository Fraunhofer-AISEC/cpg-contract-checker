const App: React.FC = () => {
  const [count, setCount] = useState(0);
  const [outOfSyncCount, setOutOfSyncCount] = useState(0);
  const [syncCount, setSyncCount] = useState(0);

  const handleOnClick = async () => {
    setCount(count + 1);

    
    setOutOfSyncCount(count);

    
    const newCount = await getState(setCount);
    setSyncCount(newCount);
  };

  return (
    <>
      <h2>Count = {count}</h2>
      <h2>Synced count = {syncCount}</h2>
      <h2>Out of sync count = {outOfSyncCount}</h2>
      <button onClick={handleOnClick}>Increment</button>
    </>
  );
};
