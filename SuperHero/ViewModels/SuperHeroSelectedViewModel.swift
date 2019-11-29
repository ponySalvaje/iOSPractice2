//
//  SuperHeroSelectedViewModel.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class SuperHeroSelectedViewModel: ObservableObject {
  
    @Published var superHero = SuperHeroViewModel(superHero: SuperHero())
  
  init() {
    SuperHeroService().getSuperHero { superHero in
      if let superHero = superHero {
        self.superHero = SuperHeroViewModel(superHero: superHero)
      }
      
    }
  }
  
}
