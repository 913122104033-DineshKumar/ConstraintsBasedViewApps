//
//  ViewController.swift
//  ViewWithoutFrameAndStoryboard
//
//  Created by Dinesh Kumar K K on 07/08/25.
//

import UIKit

class InitialPageWithNSLayoutOptions: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
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
        let itemNameLabelConstraints = [
            itemNameLabel.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemNameLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20),
            itemNameLabel.widthAnchor.constraint(equalToConstant: width),
            itemNameLabel.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemNameLabelConstraints)
        
        itemNameField = createTextField()
        let itemNameFieldConstraints = [
            itemNameField.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemNameField.topAnchor.constraint(equalTo: itemNameLabel.layoutMarginsGuide.topAnchor, constant: verticalSpacing),
            itemNameField.widthAnchor.constraint(equalToConstant: width),
            itemNameField.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemNameFieldConstraints)
        
        itemPriceLabel = createLabel("Item Price")
        let itemPriceLabelConstraints = [
            itemPriceLabel.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemPriceLabel.topAnchor.constraint(equalTo: itemNameField.layoutMarginsGuide.topAnchor, constant: verticalSpacing),
            itemPriceLabel.widthAnchor.constraint(equalToConstant: width),
            itemPriceLabel.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemPriceLabelConstraints)
        
        itemPriceField = createTextField()
        let itemPriceFieldConstraints = [
            itemPriceField.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemPriceField.topAnchor.constraint(equalTo: itemPriceLabel.layoutMarginsGuide.topAnchor, constant: verticalSpacing),
            itemPriceField.widthAnchor.constraint(equalToConstant: width),
            itemPriceField.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemPriceFieldConstraints)
        
        itemDescriptionLabel = createLabel("Item Description")
        let itemDescriptionLabelConstraints = [
            itemDescriptionLabel.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemDescriptionLabel.topAnchor.constraint(equalTo: itemPriceField.layoutMarginsGuide.topAnchor, constant: verticalSpacing),
            itemDescriptionLabel.widthAnchor.constraint(equalToConstant: width),
                       itemDescriptionLabel.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemDescriptionLabelConstraints)
        
        itemDescriptionView = createTextView()
        let itemDescriptionViewConstraints = [
            itemDescriptionView.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            itemDescriptionView.topAnchor.constraint(equalTo: itemDescriptionLabel.layoutMarginsGuide.topAnchor, constant: verticalSpacing),
            itemDescriptionView.widthAnchor.constraint(equalToConstant: width),
            itemDescriptionView.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(itemDescriptionViewConstraints)
        
        resultView = createTextView()
        let resultViewConstraints = [
            resultView.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            resultView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -80),
            resultView.widthAnchor.constraint(equalToConstant: width),
            resultView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(resultViewConstraints)
        
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
        let addButtonConstraints = [
            addButton.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: horizontalSpacing),
            addButton.bottomAnchor.constraint(equalTo: itemDescriptionView.layoutMarginsGuide.bottomAnchor, constant: 80),
            addButton.widthAnchor.constraint(equalToConstant: width),
            addButton.heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(addButtonConstraints)
        
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

