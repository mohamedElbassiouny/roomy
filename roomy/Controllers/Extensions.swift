//
//  Extensions.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/20/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import Foundation

extension String{
    var trimmed: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
