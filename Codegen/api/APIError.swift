//
//  APIError.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit
import SwaggerClient
import Alamofire

class APIError: Error {
    
    var code: Int
    var message: String
    var detail: String
    
    init(code: Int, message: String, detail: String) {
        self.code = code
        self.message = message
        self.detail = detail
    }
    
    init(_ errorResponse: ErrorResponse) {
        switch errorResponse {
        case .error(let code, _, let error):
            self.code = code
            message = "Erro não identificado"
            detail = ""
            switch code {
            case 401:
                message = "Credenciais inválidas."
                return
            case 403:
                message = "Sessão expirada."
                return
            default:
                break
            }
            switch error {
            case is AlamofireDecodableRequestBuilderError:
                guard let requestError = error as? AlamofireDecodableRequestBuilderError else { return }
                switch requestError {
                case .emptyDataResponse:
                    self.message = "Nenhum dado retornado"
                case .nilHTTPResponse:
                    self.message = "Nenhuma resposta retornada"
                case .jsonDecoding(let decodingError):
                    self.message = decodingError.localizedDescription
                    self.detail = decodingError.errorDescription ?? ""
                case .generalError(let generalError):
                    self.message = generalError.localizedDescription
                }
            case is AFError:
                guard let afError = error as? AFError else { return }
                switch afError {
                case .invalidURL(let url):
                    message = "URL inválida: \(url)"
                case .parameterEncodingFailed(let reason):
                    switch reason {
                    case .missingURL:
                        message = "Requisição sem URL."
                    case .jsonEncodingFailed(let error):
                        message = "Falha no encoding do objeto."
                        detail = error.localizedDescription
                    case .propertyListEncodingFailed(let error):
                        message = "Falha no encoding da property list."
                        detail = error.localizedDescription
                    }
                case .multipartEncodingFailed(let reason):
                    switch reason {
                    case .bodyPartURLInvalid(let url):
                        message = "URL inválida: \(url)"
                    case .bodyPartFilenameInvalid(let url):
                        message = "Nome do arquivo inválido: \(url)"
                    case .bodyPartFileNotReachable(let url):
                        message = "Arquivo não acessível: \(url)"
                    case .bodyPartFileNotReachableWithError(let url, let error):
                        message = "Arquivo não acessível e com erro: \(url)"
                        detail = error.localizedDescription
                    case .bodyPartFileIsDirectory(let url):
                        message = "O arquivo é um diretório: \(url)"
                    case .bodyPartFileSizeNotAvailable(let url):
                        message = "Tamanho do arquivo não disponível: \(url)"
                    case .bodyPartFileSizeQueryFailedWithError(let url, let error):
                        message = "Consulta do tamanho do arquivo falhou: \(url)"
                        detail = error.localizedDescription
                    case .bodyPartInputStreamCreationFailed(let url):
                        message = "Falha ao criar stream de entrada: \(url)"
                    case .outputStreamCreationFailed(let url):
                        message = "Falha ao criar stream de saída: \(url)"
                    case .outputStreamFileAlreadyExists(let url):
                        message = "Stream de saída já existe: \(url)"
                    case .outputStreamURLInvalid(let url):
                        message = "Stream de saída inválido: \(url)"
                    case .outputStreamWriteFailed(let error):
                        message = "Erro ao escrever no stream de saída."
                        detail = error.localizedDescription
                    case .inputStreamReadFailed(let error):
                        message = "Erro ao fazer a leitura do stream de saída"
                        detail = error.localizedDescription
                    }
                case .responseValidationFailed(let reason):
                    switch reason {
                    case .dataFileNil:
                        message = "O arquivo enviado está vazio."
                    case .dataFileReadFailed(let url):
                        message = "Falha ao ler arquivo na URL \(url.absoluteURL)."
                    case .missingContentType(let acceptableContentTypes):
                        message = "Um ou mais tipos de dados não foram enviados na requisição. Os tipos aceitos são: \(acceptableContentTypes)."
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        message = "Tipos de dados não aceitos na requisição. Os tipos aceitos são: \(acceptableContentTypes). Os tipos de dados da resposta são: \(responseContentType)."
                    case .unacceptableStatusCode(let code):
                        switch code {
                        case 401, 403:
                            break
                        default:
                            message = "API retornou um código inaceitável: \(code)."
                        }
                    }
                case .responseSerializationFailed(let reason):
                    switch reason {
                    case .inputDataNil:
                        message = "Dados de entrada vazios."
                    case .inputDataNilOrZeroLength:
                        message = "Dados de entrada vazios ou de tamanho zero."
                    case .inputFileNil:
                        message = "Arquivo de entrada vazio."
                    case .inputFileReadFailed(let url):
                        message = "Falha ao ler arquivo de entrada: \(url)"
                    case .stringSerializationFailed(let encoding):
                        message = "Falha ao serializar string: \(encoding)"
                    case .jsonSerializationFailed(let error):
                        message = "Falha ao serializar json."
                        detail = error.localizedDescription
                    case .propertyListSerializationFailed(let error):
                        message = "Falha ao serializar property list."
                        detail = error.localizedDescription
                    }
                }
            default:
                break
            }
        }
    }

}
