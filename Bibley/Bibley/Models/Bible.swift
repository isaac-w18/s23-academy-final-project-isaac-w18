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
    
    func numChapters() -> Int {
        switch self {
        case .Genesis:
            return 50
        case .Exodus:
            return 40
        case .Leviticus:
            return 27
        case .Numbers:
            return 36
        case .Deuteronomy:
            return 34
        case .Joshua:
            return 24
        case .Judges:
            return 21
        case .Ruth:
            return 4
        case .Samuel1:
            return 31
        case .Samuel2:
            return 24
        case .Kings1:
            return 22
        case .Kings2:
            return 25
        case .Chronicles1:
            return 29
        case .Chronicles2:
            return 36
        case .Ezra:
            return 10
        case .Nehemiah:
            return 13
        case .Esther:
            return 10
        case .Job:
            return 42
        case .Psalms:
            return 150
        case .Proverbs:
            return 31
        case .Ecclesiastes:
            return 12
        case .SongOfSolomon:
            return 8
        case .Isaiah:
            return 66
        case .Jeremiah:
            return 52
        case .Lamentations:
            return 5
        case .Ezekiel:
            return 48
        case .Daniel:
            return 12
        case .Hosea:
            return 14
        case .Joel:
            return 3
        case .Amos:
            return 9
        case .Obadiah:
            return 1
        case .Jonah:
            return 4
        case .Micah:
            return 7
        case .Nahum:
            return 3
        case .Habakkuk:
            return 3
        case .Zephaniah:
            return 3
        case .Haggai:
            return 2
        case .Zechariah:
            return 14
        case .Malachi:
            return 4
            
        case .Matthew:
            return 28
        case .Mark:
            return 16
        case .Luke:
            return 24
        case .John:
            return 21
        case .Acts:
            return 28
        case .Romans:
            return 16
        case .Corinthians1:
            return 16
        case .Corinthians2:
            return 13
        case .Galatians:
            return 5
        case .Ephesians:
            return 6
        case .Philipians:
            return 4
        case .Colossians:
            return 4
        case .Thessalonians1:
            return 5
        case .Thessalonians2:
            return 3
        case .Timothy1:
            return 6
        case .Timothy2:
            return 4
        case .Titus:
            return 3
        case .Philemon:
            return 1
        case .Hebrews:
            return 13
        case .James:
            return 5
        case .Peter1:
            return 5
        case .Peter2:
            return 3
        case .John1:
            return 5
        case .John2:
            return 1
        case .John3:
            return 1
        case .Jude:
            return 1
        case .Revelation:
            return 22
        }
    }
    
}

enum Version: String {
    case cherokee, bbe, kjv, web, oebcw, webbe, oebus, clementine, almeida, rccv
}
