Config = Config or {}

Config.itemList = {
    { -- Use ITEM on "damageItem" to replace the item
    ['item'] = 'phone',
    ['damageItem'] = 'phone-damaged'
}, { -- Use NIL on "damageItem" to make the item disappear
    ['item'] = 'rolling_paper',
    ['damageItem'] = nil
}}
