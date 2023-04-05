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
        let _ = vm.getChapter()
        
        let printa = print("BibleView ran")
        let verseAsStringArr = vm.verseAsStringArr()
        let print = print("\(verseAsStringArr.count)")
        Text("Jesus is Lord!")

        
        // Problem: ForEach does not await data, so it runs with the array still empty
//        ForEach(0...verseAsStringArr.count-1, id: \.self) {index in
//            Text(verseAsStringArr[index])
//        }
        
    }
}

//struct BibleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BibleView()
//    }
//}
