//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: Error, LocalizedError{
        case invalidResponse(url: URL)
        case invalidData
        case unknownError
        
        var errorDescription: String?{
            switch self{
            case .invalidResponse(let url):
                return "Invalid URL Response: \(url)"
            case .invalidData:
                return "Invalid JSON Data"
            case .unknownError:
                return "An unknown error occured!"
            }
        }
        
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error>{
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleURLResponse(output: $0, url: url) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode <= 300 else {
            throw NetworkingError.invalidResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
