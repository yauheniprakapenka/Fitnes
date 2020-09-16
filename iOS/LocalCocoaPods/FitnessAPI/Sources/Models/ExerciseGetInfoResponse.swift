//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class ExerciseGetInfoResponse: APIModel {

    public var data: DataType

    public class DataType: APIModel {

        public var id: String

        public var attribures: Attribures?

        public class Attribures: APIModel {

            public var name: String

            public var description: String?

            public var videoURL: String?

            public var equipment: String?

            public init(name: String, description: String?, videoURL: String?, equipment: String?) {
                self.name = name
                self.description = description
                self.videoURL = videoURL
                self.equipment = equipment
            }

            public required init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: StringCodingKey.self)

                name = try container.decode("name")
                description = try container.decodeIfPresent("description")
                videoURL = try container.decodeIfPresent("video-url")
                equipment = try container.decodeIfPresent("equipment")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: StringCodingKey.self)

                try container.encode(name, forKey: "name")
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(videoURL, forKey: "video-url")
                try container.encodeIfPresent(equipment, forKey: "equipment")
            }

            public func isEqual(to object: Any?) -> Bool {
              guard let object = object as? Attribures else { return false }
              guard self.name == object.name else { return false }
              guard self.description == object.description else { return false }
              guard self.videoURL == object.videoURL else { return false }
              guard self.equipment == object.equipment else { return false }
              return true
            }

            public static func == (lhs: Attribures, rhs: Attribures) -> Bool {
                return lhs.isEqual(to: rhs)
            }
        }

        public init(id: String, attribures: Attribures? = nil) {
            self.id = id
            self.attribures = attribures
        }

        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StringCodingKey.self)

            id = try container.decode("id")
            attribures = try container.decodeIfPresent("attribures")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: StringCodingKey.self)

            try container.encode(id, forKey: "id")
            try container.encodeIfPresent(attribures, forKey: "attribures")
        }

        public func isEqual(to object: Any?) -> Bool {
          guard let object = object as? DataType else { return false }
          guard self.id == object.id else { return false }
          guard self.attribures == object.attribures else { return false }
          return true
        }

        public static func == (lhs: DataType, rhs: DataType) -> Bool {
            return lhs.isEqual(to: rhs)
        }
    }

    public init(data: DataType) {
        self.data = data
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        data = try container.decode("data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(data, forKey: "data")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ExerciseGetInfoResponse else { return false }
      guard self.data == object.data else { return false }
      return true
    }

    public static func == (lhs: ExerciseGetInfoResponse, rhs: ExerciseGetInfoResponse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}