//
//  Extensions.swift
//  Netflix Clone
//
//  Created by c.toan on 22.10.2022.
//

import Foundation

extension String {
    func capitalizeFirstLatter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
