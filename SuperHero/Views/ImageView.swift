//
//  ImageView.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
         imageLoader = ImageLoader(urlString:url)
    }
    var body: some View {
        VStack {
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable().frame(minWidth: 375 ,minHeight: 300)
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.horizontal)
            
        }.padding(.leading,0)
        
    }
}

class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

// ImageView

func imageFromData(_ data:Data) -> UIImage {
    UIImage(data: data) ?? UIImage()
}
