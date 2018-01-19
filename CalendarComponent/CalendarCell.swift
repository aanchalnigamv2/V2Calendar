//
//  CalendarCell.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

/// The CalendarCell class defines the attributes and
/// behavior of the cells that appear in CalendarView objects.

import Foundation
import UIKit

open class CalendarCell: UICollectionViewCell {
    
    /// Cell view that will be customized
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
