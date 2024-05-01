//
//  MovieList.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import Foundation

struct MovieList: Codable {
    let categories: [MovieList.Category]
    let titles: [MovieList.Title]
}

extension MovieList {
    struct Category: Codable {
        let id: Int
        let name: String
    }

    struct Title: Codable {
        let categoryId: Int
        let name: String
    }

}

extension MovieList {
    static func createExample() -> MovieList? {
        let jsonString = """
        {
        "categories": [
        {"id": 1, "name": "Classic Literature"},
        {"id": 2, "name": "Fantasy"},
        {"id": 3, "name": "Science Fiction"},
        {"id": 4, "name": "Mystery"},
        {"id": 5, "name": "Thriller"}
        ],
        "titles": [
        {"categoryId": 1, "name": "The Great Gatsby"},
        {"categoryId": 1, "name": "To Kill a Mockingbird"},
        {"categoryId": 1, "name": "1984"},
        {"categoryId": 1, "name": "The Catcher in the Rye"},
        {"categoryId": 1, "name": "Pride and Prejudice"},
        {"categoryId": 2, "name": "The Lord of the Rings"},
        {"categoryId": 2, "name": "Harry Potter and the Philosopher's Stone"},
        {"categoryId": 2, "name": "A Game of Thrones"},
        {"categoryId": 2, "name": "The Hobbit"},
        {"categoryId": 2, "name": "The Name of the Wind"},
        {"categoryId": 3, "name": "Dune"},
        {"categoryId": 3, "name": "Foundation"},
        {"categoryId": 3, "name": "Neuromancer"},
        {"categoryId": 3, "name": "Ender's Game"},
        {"categoryId": 3, "name": "Brave New World"},
        {"categoryId": 4, "name": "The Girl with the Dragon Tattoo"},
        {"categoryId": 4, "name": "The Hound of the Baskervilles"},
        {"categoryId": 4, "name": "Gone Girl"},
        {"categoryId": 4, "name": "Murder on the Orient Express"},
        {"categoryId": 4, "name": "The Da Vinci Code"},
        {"categoryId": 5, "name": "The Silence of the Lambs"},
        {"categoryId": 5, "name": "The Girl on the Train"},
        {"categoryId": 5, "name": "The Bourne Identity"},
        {"categoryId": 5, "name": "Gone Baby Gone"},
        {"categoryId": 5, "name": "Before I Go to Sleep"}
        ]
        }
        """
        
        do {
            let jsonData = jsonString.data(using: .utf8) ?? Data()
            let decoder = JSONDecoder()
            let movieList = try decoder.decode(MovieList.self, from: jsonData)
            return movieList
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        return nil
    }
}
