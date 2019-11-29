//
//  SuperHeroItemView.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct SuperHeroItemView: View {
    var superhero: SuperHeroItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(superhero.name!)").font(.headline)
                Text("\(superhero.mention!)").font(.caption)
            }
        }
    }
}
