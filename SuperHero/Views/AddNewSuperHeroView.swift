//
//  AddNewSuperHeroView.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct AddNewSuperHeroView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @ObservedObject private var superHeroSelectedViewModel = SuperHeroSelectedViewModel()
    
    @State private var mention=""
    
    var body: some View {
        Section(header: Text("Add Super Hero"))
        {
            HStack{
                Text("Id: \(self.superHeroSelectedViewModel.superHero.id)")
                TextField("Mention",text: self.$mention)
                Button(action:{
                    let superHeroItem = SuperHeroItem(context: self.managedObjectContext)
                    superHeroItem.id=self.superHeroSelectedViewModel.superHero.id as NSNumber
                    superHeroItem.name=self.superHeroSelectedViewModel.superHero.name
                    superHeroItem.mention=self.mention
                    superHeroItem.createdAt=Date()
                    
                    do {
                        try self.managedObjectContext.save()
                        
                    } catch {
                        print(error)
                    }
                    
                    self.mention=""
                    
                }){
                    Image(systemName:"plus.circle.fill").foregroundColor(.green)
                    .imageScale(.large)
                }
            }
        }.font(.headline)
    }
}

struct AddNewSuperHeroView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSuperHeroView()
    }
}
