//
//  BibleView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/5/23.
//

import SwiftUI

struct BibleView: View {
    @StateObject var vm = BibleViewModel()
    
    @State private var bookSheetPresented = false
    
    // MARK: have this fetch on load
    
    
    var body: some View {
        // MARK: Call getChapter(version: Version) with the default version. Then change BibleViewModel to have version be mandatory
        
//        let printa = print("BibleView ran")
//        let print = print("\(verseAsStringArr.count)")
        
        
            ScrollView {
                ForEach(vm.verseAsStringArr, id: \.self) {index in
                    Text(index)
                }
            }
            .navigationTitle("")
            .toolbar {
                Button {
                    bookSheetPresented.toggle()
                } label: {
                    HStack {
                        Text(vm.book.getFormattedBook())
                        Text("\(vm.chapterNum)")
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $bookSheetPresented) {
                    BooksView(book: $vm.book, chapterNum: $vm.chapterNum)
                }
            }
                
            
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                vm.getChapter()
            }
        

        
        
    }
}

struct BibleView_Previews: PreviewProvider {
    static var previews: some View {
        BibleView()
    }
}
