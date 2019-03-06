

import Foundation


import RxSwift

internal enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

private struct Status: Decodable {
    let code: Int
    let message: String

}

extension Decodable {
    func validate(success: (() ->Void) ){
        success()
        return
    }
}

final internal class WebService {
    private let session = URLSession(configuration: .default)
    private lazy var baseURL: URL = {
        if PersistentData.shared.baseURL.value != "" {
            return URL(string: PersistentData.shared.baseURL.value)!
        } else {
            return URL(string: Constants.Network.base_url)!
        }
    }()
    
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .deferredToDate
    }
    
    func load<T>(modelType type: T.Type, from endpoint: Endpoint) -> Observable<T> where T: Decodable {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL)
        return session.rx.data(request: request)
            .map {
                let result = try decoder.decode(T.self, from: $0)
                return result
            }
            .catchError { error in
                guard let webServiceError = error as? WebServiceError else {
                    throw error
                }
                
                guard case let .badStatus(_, data) = webServiceError else {
                    throw error
                }
                
                guard let status = try? decoder.decode(Status.self, from: data) else {
                    throw error
                }
                throw WebServiceError.api(status.code, status.message)
        }
    }
}

private extension Reactive where Base: URLSession {
    func data(request: URLRequest) -> Observable<Data> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        fatalError("Unsupported protocol")
                    }
                    
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        if let data = data {
                            observer.onNext(data)
                        }
                        observer.onCompleted()
                    } else {
                        observer.onError(WebServiceError.badStatus(httpResponse.statusCode, data ?? Data()))
                    }
                }
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
