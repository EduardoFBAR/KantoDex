//
//  BaseTableViewCell.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import UIKit

open class BaseTableViewCell : UITableViewCell {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    open func setData(_ data: Any?) {
        self.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1)
        self.textLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        self.textLabel?.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {}
    
}
