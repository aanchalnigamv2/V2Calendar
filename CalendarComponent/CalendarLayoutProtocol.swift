//
//  CalendarLayoutProtocol.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

import Foundation
import UIKit

protocol CalendarLayoutProtocol: class {
    var minimumInteritemSpacing: CGFloat {get set}
    var minimumLineSpacing: CGFloat {get set}
    var sectionInset: UIEdgeInsets {get set}
    var scrollDirection: UICollectionViewScrollDirection {get set}
}

extension UICollectionViewFlowLayout: CalendarLayoutProtocol {

}
