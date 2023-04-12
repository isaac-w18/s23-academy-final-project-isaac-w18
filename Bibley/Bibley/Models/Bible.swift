//
//  Bible.swift
//  Bibley
//
//  Created by Isaac Frank on 4/5/23.
//

import Foundation

struct Bible {
    var book: Book
    var chapterNum: Int
    var version: Version
}

enum Book: String, CaseIterable, Hashable {
    case Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, Samuel1, Samuel2, Kings1, Kings2, Chronicles1, Chronicles2, Ezra, Nehemiah, Esther, Job, Psalms, Proverbs, Ecclesiastes, SongOfSolomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah,Micah, Nahum ,Habakkuk, Zephaniah, Haggai, Zechariah, Malachi
    case Matthew, Mark, Luke, John, Acts, Romans, Corinthians1, Corinthians2, Galatians, Ephesians, Philipians, Colossians, Thessalonians1, Thessalonians2, Timothy1, Timothy2, Titus, Philemon, Hebrews, James, Peter1, Peter2, John1, John2, John3, Jude, Revelation
    
    func getFormattedBook() -> String {
        var bookString = self.rawValue
        if(bookString[bookString.count-1].isNumber) {
            let bookNumber = bookString.suffix(1)
            let bookSubstring = bookString.prefix(bookString.count-1)
            bookString = bookNumber + " " + bookSubstring
        } else if(bookString == "SongOfSolomon") {
            bookString = "Song of Solomon"
        }
        
        return bookString
    }
    
}

enum Version: String {
    case cherokee, bbe, kjv, web, oebcw, webbe, oebus, clementine, almeida, rccv
}
