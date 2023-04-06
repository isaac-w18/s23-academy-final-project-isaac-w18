//
//  BibleView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/5/23.
//

import SwiftUI

struct BibleView: View {
    @StateObject var vm = BibleViewModel()
    
    var body: some View {
        // MARK: Call getChapter(version: Version) with the default version. Then change BibleViewModel to have version be mandatory
        let chapter = vm.getChapter()
        
//        let printa = print("BibleView ran")
        let verseAsStringArr = vm.verseAsStringArr()
//        let print = print("\(verseAsStringArr.count)")
        
        if(!verseAsStringArr.isEmpty) {
            ScrollView {
                ForEach(0...verseAsStringArr.count-1, id: \.self) {index in
                    Text(verseAsStringArr[index])
                    
                }
            }
            .navigationTitle(vm.book.rawValue + " \(vm.chapterNum)")
            .navigationBarTitleDisplayMode(.inline)
            
            Picker("Book", selection: $vm.book) {
                ForEach(Book.allCases, id: \.self) {b in
                    Text(b.rawValue)
                }
            }
        }
        
        

        
//         Problem: ForEach does not await data, so it runs with the array still empty
        
        
        
    }
}

//struct BibleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BibleView()
//    }
//}
