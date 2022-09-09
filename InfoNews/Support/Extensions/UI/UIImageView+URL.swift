//
//  UIImageView+URL.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageBy(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
