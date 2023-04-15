//
//  BooksView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/12/23.
//

import SwiftUI

struct BooksView: View {
    @Environment(\.dismiss) var dismiss

    @State private var isExpanded = false
    
    @ObservedObject var vm: BibleViewModel
    
    var body: some View {
            List {
                Section {
                    ForEach(Book.allCases, id: \.self) {b in
                        
                        // make each of these a button that animates another view with the chapters
                        // when you press the chapter it actually changes the binding vars
                        SingleBookView(b: b, vm: vm)
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

struct SingleBookView: View {
    var b: Book
    @State private var isExpanded = false
    
    @ObservedObject var vm: BibleViewModel
    
    var body: some View {
        Button {
            withAnimation(.linear) {
                isExpanded.toggle()
            }
        } label: {
            HStack {
                Text(b.getFormattedBook())
                Spacer()
                Image(systemName: "chevron.right")
                    .rotationEffect(Angle(degrees: isExpanded ? 90: 0))
            }
        }
        .buttonStyle(.plain)
        
        if(isExpanded) {
            ChapterDisplayView(b: b, vm: vm)
                .transition(.slide)
        }
    }
}

struct ChapterDisplayView: View {
    @Environment(\.dismiss) var dismiss
    
    var b: Book
    let columns = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    @ObservedObject var vm: BibleViewModel
    
    var body: some View {
        let chapters = (1...b.numChapters()).map {"\($0)"}
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(chapters, id: \.self) {c in
                Button {
                    vm.book = b
                    vm.chapterNum = Int(c) ?? 1
                    dismiss()
                } label: {
                    Rectangle()
                        .fill(Color.gray)
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(Text(c).font(.title3))
                }
                .buttonStyle(.plain)
                
                    
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
