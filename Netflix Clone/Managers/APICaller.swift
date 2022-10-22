//
//  APICaller.swift
//  Netflix Clone
//
//  Created by c.toan on 22.10.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "6e3d5231430a144baac22da327ad03e8"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    
    func getTrendingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complition(.success(results.results))
                
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func getTrendingTv(complition: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
        
    }
    
    func getPopular(complition: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else { return }
        //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    
    func getUpcomingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    
    func getTopRated(complition: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
        //https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
        
    }
    
}

