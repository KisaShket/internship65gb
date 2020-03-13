//
//  Extensions.swift
//  internship65gb
//
//  Created by Miska  on 10.03.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
