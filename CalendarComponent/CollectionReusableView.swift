//
//  CollectionReusableView.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

/// The header view class of the calendar

import UIKit

open class CollectionReusableView: UICollectionReusableView {
    
    /// Initializes and returns a newly allocated view object with the specified frame rectangle.
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    /// self, initialized using the data in decoder.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
