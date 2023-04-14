//
//  BooksView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/12/23.
//

import SwiftUI

struct BooksView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var book: Book
    @Binding var chapterNum: Int
    
    var body: some View {
            List {
                Section {
                    ForEach(Book.allCases, id: \.self) {b in
                        Text(b.getFormattedBook())
                    }
                } header: {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        .buttonStyle(.plain)
                        Spacer()
                        Text("Books").bold()
                        Spacer()
                        Text("History")
                    }
                }
            }
            
        
    }
}



//struct BooksView_Previews: PreviewProvider {
//    @State private var book = Book.John
//    @State private var chapterNum = 1
//
//    static var previews: some View {
//        BooksView(book: $book, chapterNum: $chapterNum)
//    }
//}
