import UIKit

class InitialPageWithNSLayoutConstraintMethod: UIViewController, UITextFieldDelegate, UITextViewDelegate
{
    
    private lazy var itemNameLabel: UILabel = UILabel()
    private lazy var itemNameField: UITextField = UITextField()
    
    private lazy var itemPriceLabel: UILabel = UILabel()
    private lazy var itemPriceField: UITextField = UITextField()
    
    private lazy var itemDescriptionLabel: UILabel = UILabel()
    private lazy var itemDescriptionView: UITextView = UITextView()
    
    private lazy var addButton: UIButton = UIButton()
    
    private lazy var resultView: UITextView = UITextView()
    
    private let horizontalSpacing: CGFloat = 20
    private let verticalSpacing: CGFloat = 50
    
    private let width: CGFloat = 350
    private let height: CGFloat = 40

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        itemNameLabel = createLabel("Item Name")
        NSLayoutConstraint(item: itemNameLabel, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemNameLabel, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: itemNameLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemNameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        
        itemNameField = createTextField()
        NSLayoutConstraint(item: itemNameField, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemNameField, attribute: .topMargin, relatedBy: .equal, toItem: itemNameLabel, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: itemNameField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemNameField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        
        itemPriceLabel = createLabel("Item Price")
        NSLayoutConstraint(item: itemPriceLabel, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemPriceLabel, attribute: .topMargin, relatedBy: .equal, toItem: itemNameField, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: itemPriceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemPriceLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        
        itemPriceField = createTextField()
        NSLayoutConstraint(item: itemPriceField, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemPriceField, attribute: .topMargin, relatedBy: .equal, toItem: itemPriceLabel, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: itemPriceField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemPriceField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        
        itemDescriptionLabel = createLabel("Item Description")
        NSLayoutConstraint(item: itemDescriptionLabel, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemDescriptionLabel, attribute: .topMargin, relatedBy: .equal, toItem: itemPriceField, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: itemDescriptionLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemDescriptionLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        
        itemDescriptionView = createTextView()
        NSLayoutConstraint(item: itemDescriptionView, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: itemDescriptionView, attribute: .topMargin, relatedBy: .equal, toItem: itemDescriptionLabel, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: itemDescriptionView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: itemDescriptionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200).isActive = true
        
        resultView = createTextView()
        NSLayoutConstraint(item: resultView, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .bottomMargin, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -80).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 100).isActive = true
        
        addButton = createButton(
            "Add Item",
            perform: UIAction { action in
                
                // Self is provided here, to differentiate from the capture list of the Closure
                let (code, message) = self.validateInput(
                    itemName: self.itemNameField.text,
                    itemPrice: self.itemPriceField.text,
                    itemDescription: self.itemDescriptionView.text
                )
                
                if (code == 200)
                {
                    self.resultView.text = """
                        Item Name: \(self.itemNameField.text!)
                        Item Price: \(self.itemPriceField.text!)
                        Item Description: \(self.itemDescriptionView.text!)
                    """
                    
                    self.itemNameField.text = nil
                    self.itemPriceField.text = nil
                    self.itemDescriptionView.text = nil
                    
                } else
                {
                    self.resultView.text = message
                }
                
            }
        )
        NSLayoutConstraint(item: addButton, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: addButton, attribute: .bottomMargin, relatedBy: .equal, toItem: itemDescriptionView, attribute: .bottomMargin, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: addButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: addButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40).isActive = true
        
    }
    
    private func createLabel(_ text: String) -> UILabel
    {
        let label = UILabel()
        
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        return label
    }
    
    private func createTextField() -> UITextField
    {
        let textField = UITextField()
        
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.borderStyle = .roundedRect
        self.view.addSubview(textField)
        
        return textField
        
    }
    
    private func createTextView() -> UITextView
    {
        let textView = UITextView()
        
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.font = .systemFont(ofSize: 20)
        self.view.addSubview(textView)
        
        return textView
        
    }
    
    private func createButton(
        _ buttonName: String,
        perform action: UIAction
    ) -> UIButton
    {
        let button = UIButton()
        
        button.setTitle(buttonName, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.addAction(action, for: .touchUpInside)
        button.backgroundColor = .systemBlue
        self.view.addSubview(button)
        
        return button
    }
    
    private func validateInput (itemName name: String?, itemPrice price: String?, itemDescription description: String) -> (Int, String)
        {
            
            guard let itemName = name else
            {
                return (201, "All the fields are required")
            }
            
            guard let itemPrice = price else
            {
                return (201, "All the fields are required")
            }
            
            if (itemName.isEmpty || itemPrice.isEmpty)
            {
                return (201, "All the fields are required")
            }
            
            if (notMatches(pattern: "[a-zA-Z/s]{2,}", text: itemName))
            {
                return (202, "Name is invalid, for example, Pen, Notebook")
            }
            
            if (notMatches(pattern: "^[0-9]+[/.0-9]*$", text: itemPrice))
            {
                return (203, "Price is invalid, for example, 10, 12.5")
            }
            
            if (notMatches(pattern: "^[a-zA-Z0-9.,%$/s]*", text: description))
            {
                return (204, "Name is invalid, for example, Pen, Notebook")
            }
            
            return (200, "All the inputs are perfect")
        }
        
        private func notMatches (pattern: String, text: String) -> Bool {
            do {
                let regex = try NSRegularExpression(pattern: pattern)
                let range = NSRange(location: 0, length: text.utf16.count)
                return regex.firstMatch(in: text, range: range) == nil
            } catch {
                return true
            }
        }

}

