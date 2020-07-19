//
//  API.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit
import SwaggerClient

class API {
    
    func handleResponse<T>(response: T?, error: Error?, complete: @escaping (Result<T, APIError>) -> Void) {
        if let error = error {
            let handledError = handleError(error)
            complete(.failure(handledError))
        } else if let response = response {
            complete(.success(response))
        } else {
            fatalError("Unable to handle API response. Both response and error are nil.")
        }
    }
    
    func handleError(_ error: Error) -> APIError {
        if let errorResponse = error as? ErrorResponse {
            return APIError(errorResponse)
        } else {
            return APIError(code: 999, message: "Erro não identificado", detail: "Erro não identificado")
        }
    }

}
