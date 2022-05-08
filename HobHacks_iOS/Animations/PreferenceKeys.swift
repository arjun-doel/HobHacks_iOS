//
//  PreferenceKeys.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
