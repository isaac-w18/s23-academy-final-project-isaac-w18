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

enum Book: String {
    case Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, Samuel1, Samuel2, Kings1, Kings2, Chronicles1, Chronicles2, Ezra, Nehemiah, Esther, Job, Psalms, Proverbs, Ecclesiastes, SongofSolomon ,Isaiah, Jeremiah, Lamentations, Ezekiel ,Daniel, Hosea, Joel, Amos ,Obadiah, Jonah,Micah, Nahum ,Habakkuk ,Zephaniah, Haggai, Zechariah, Malachi
    case Matthew, Mark, Luke, John, Acts, Romans, Corinthians1, Corithians2, Galatians, Ephesians, Phillipians, Colossians, Thessalonians1, Thessalonians2, Timothy1, Timothy2, Titus, Philemon, Hebrews, James, Peter1, Peter2, John1, John2, John3, Jude, Revelation
}

enum Version: String {
    case cherokee, bbe, kjv, web, oebcw, webbe, oebus, clementine, almeida, rccv
}
