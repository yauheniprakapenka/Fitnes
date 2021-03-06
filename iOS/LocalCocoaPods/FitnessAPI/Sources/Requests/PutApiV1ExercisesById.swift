//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension FitnessAPI {

    /** Used to edit exercise. Body required only fields that needs change */
    public enum PutApiV1ExercisesById {

        public static let service = APIService<Response>(id: "putApiV1ExercisesById", tag: "", method: "PUT", path: "/api/v1/exercises/{id}", hasBody: true, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** id */
                public var id: Int

                /** value should be bearer: #{token_id} */
                public var authorization: String

                public init(id: Int, authorization: String) {
                    self.id = id
                    self.authorization = authorization
                }
            }

            public var options: Options

            public var body: ExerciseEditingBody

            public init(body: ExerciseEditingBody, options: Options, encoder: RequestEncoder? = nil) {
                self.body = body
                self.options = options
                super.init(service: PutApiV1ExercisesById.service) { defaultEncoder in
                    return try (encoder ?? defaultEncoder).encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: Int, authorization: String, body: ExerciseEditingBody) {
                let options = Options(id: id, authorization: authorization)
                self.init(body: body, options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }

            override var headerParameters: [String: String] {
                var headers: [String: String] = [:]
                headers["authorization"] = options.authorization
                return headers
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ExerciseCreationEditingSuccessResponse

            /** Return info about exercises */
            case status200(ExerciseCreationEditingSuccessResponse)

            public var success: ExerciseCreationEditingSuccessResponse? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
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
                case 200: self = try .status200(decoder.decode(ExerciseCreationEditingSuccessResponse.self, from: data))
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
