//
//  Extension+View.swift
//  ImageGallery
//
//  Created by Charles on 31/12/24.
//

import SwiftUI

extension View {
    
    func gridDimension(count:Int) -> CGFloat {
        return (UIScreen.main.bounds.width / CGFloat(count))
    }
}
