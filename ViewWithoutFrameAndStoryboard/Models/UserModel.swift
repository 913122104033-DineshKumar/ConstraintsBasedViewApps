class Item
{
    private(set) var itemName: String?
    private(set) var itemPrice: Double?
    private(set) var itemDescription: String?
    private(set) var errorMessage: String?
    
    init (_ itemName: String?, _ itemPrice: Double?, _ itemDescription: String?)
    {
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
    }
    
    convenience init (_ errorMessage: String)
    {
        self.init(nil, nil, nil)
        self.errorMessage = errorMessage
    }    
}
