//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension FitnessAPI {

    /** Create training */
    public enum PostApiV1Trainings {

        public static let service = APIService<Response>(id: "postApiV1Trainings", tag: "", method: "POST", path: "/api/v1/trainings", hasBody: true, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** value should be bearer: #{token_id} */
                public var authorization: String

                public init(authorization: String) {
                    self.authorization = authorization
                }
            }

            public var options: Options

            public var body: CreateTrainingBody

            public init(body: CreateTrainingBody, options: Options, encoder: RequestEncoder? = nil) {
                self.body = body
                self.options = options
                super.init(service: PostApiV1Trainings.service) { defaultEncoder in
                    return try (encoder ?? defaultEncoder).encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(authorization: String, body: CreateTrainingBody) {
                let options = Options(authorization: authorization)
                self.init(body: body, options: options)
            }

            override var headerParameters: [String: String] {
                var headers: [String: String] = [:]
                headers["authorization"] = options.authorization
                return headers
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Ok, training created */
            case status200

            public var success: Void? {
                switch self {
                case .status200: return ()
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = .status200
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
