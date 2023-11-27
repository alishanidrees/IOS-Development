//
//  NetworkManager.swift
//  IOSecondProject
//
//  Created by Ali Shan on 20/11/2023.
//

import Foundation
import Moya

typealias NetworkManagerCompletion<T:Codable> = ((_ response:APIBaseResponse<T>?, _ error:String?) -> ())

class NetworkManager<APIType:TargetType> {
    
    var provider = MoyaProvider<APIType>(plugins: [NetworkLoggerPlugin()])
 
    // @escaping it stop the control flow till response not received.
    func request<T:Codable>(target:APIType,completion: @escaping NetworkManagerCompletion<T>){
        
        provider.request(target){ result in
            switch result {
            case .success(let response):
              //  let mydecode =  JSONDecoder().decode(T.self, from: response.data)
                let decodedData: (decodedType: APIBaseResponse<T>?, error: Error?) = decode(response.data)
                    //try JSONDecoder().decode(APIBaseResponse<T>.self, from: response.data)
                if let type = decodedData.decodedType{
                    if type.status {
                        completion(type,nil)
                    }else {
                        completion(type, type.message)
                    }
                }else {
                    completion(nil, decodedData.error?.localizedDescription)
                }
                  //  completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
                self.printResponse(response)
              //  print("api success \(response.mapJSON(failsOnEmptyData: true))")
            case .failure(let error):
                print("api failed \(error.localizedDescription)")
            }
        }
    }
    
    func printResponse(_ response: Response) {
        debugPrint("=========================================================")
        print("\(response.request?.url?.absoluteString ?? "") response:")
        do { try print(response.mapJSON(failsOnEmptyData: true))
        } catch {
          print("exception")
        }
        debugPrint("=========================================================")
      }
}
