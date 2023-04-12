//
//  BooksView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/12/23.
//

import SwiftUI

struct BooksView: View {
    @Binding var book: Book
    @Binding var chapterNum: Int
    
    var body: some View {
        ForEach(Book.allCases, id: \.self) {b in
            Text(b.getFormattedBook())
        }
    }
}



//struct BooksView_Previews: PreviewProvider {
//    static var previews: some View {
//        BooksView()
//    }
//}
