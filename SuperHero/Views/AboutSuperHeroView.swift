//
//  AboutSuperHeroView.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct AboutSuperHeroView: View {
    var superHero: SuperHeroViewModel
    
    var body: some View {
        NavigationView {
          VStack(alignment: .leading) {
            // Spacer()
            ImageView(withURL: superHero.imageURL)
            HStack(alignment: .top) {
              Text("Super Hero Id: ").bold()
              Text("\(superHero.id)")
            }
            HStack {
              Text("Mention: ").bold()
                Text("\(superHero.mention)")
            }
            HStack {
              Text("Created At: ").bold()
                Text("\(superHero.createdAt)")
            }
            Spacer()
          }
          .navigationBarTitle("About \(superHero.name)")
        }
    }
}

