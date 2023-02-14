using StringConverter for *;
...
uint minLevel = getStorageUint(
    r,
    ("_conf_").strConcat(pSetting),
    pSettingIndex,
    0
);
