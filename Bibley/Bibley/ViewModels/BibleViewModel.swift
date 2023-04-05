//
//  BibleViewModel.swift
//  Bibley
//
//  Created by Isaac Frank on 4/5/23.
//

import Foundation
import SwiftUI

class BibleViewModel: ObservableObject {
    private let service = BibleService()

    @Published var chapter: Chapter = Chapter(reference: "", verses: [], text: "", translationID: "", translationName: "", translationNote: "")
    
    @Published var book: Book = Book.John
    @Published var chapterNum: Int = 1
    @Published var version: Version? = nil
    
    @Published var errorMessage: String? = nil
    
    var printH = print("BibleVM Ran")
    
    
    // MARK: Create a func getChapter(version: Version)
    func getChapter() {
        Task {
            do {
                let chapter = try await service.fetchBibleChapter(book: book, chapterNum: chapterNum, version: version)
                self.chapter = chapter
//                print("getChapter did!")
            } catch {
//                self.errorMessage = "Errorrrr"
                print("errorrr at getChapter")
            }
        }
    }
    
    func verseAsStringArr() -> [String] {
        let verseArr: [String] = chapter.verses.map {
            $0.text
        }
        
        
        return verseArr
    }
}

struct BibleService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    let printa = print("BibleService ran")
    
    public func fetchBibleChapter(book: Book, chapterNum: Int, version: Version?) async throws -> Chapter {
        // TODO: Implement this method
        print("fetchBibleChapter ran")
        
        var url = URL(string: "https://bible-api.com/")
        var urlComponents = URLComponents(string: "https://bible-api.com/")
        
        if let version = version {
            urlComponents?.queryItems = [URLQueryItem(name: "", value: book.rawValue + "\(chapterNum)"), URLQueryItem(name: "translation", value: version.rawValue)]
//            components?.queryItems = [URLQueryItem(name: nil, value: book.rawValue + "\(chapterNum)"), URLQueryItem(name: nil, value: version.rawValue)]
        } else {
            url = url?.appendingPathComponent(book.rawValue + "\(chapterNum)")
            print("got components, not version")
        }
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        print("url was valid: " + url.absoluteString)
        
        
        let (data, _) = try await session.data(from: url)
        print("data ig was a thing")
        print(data)
        
        let chapter = try JSONDecoder().decode(Chapter.self, from: data)
        
        print("chapter returned!")
        return chapter
    }
}
