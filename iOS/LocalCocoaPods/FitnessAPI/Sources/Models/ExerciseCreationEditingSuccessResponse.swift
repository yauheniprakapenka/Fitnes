//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class ExerciseCreationEditingSuccessResponse: APIModel {

    public var id: Int

    public var name: String

    public var description: String?

    public var videoUrl: String?

    public var equipment: String?

    public var createdAt: String

    public var updatedAt: String

    public init(id: Int, name: String, description: String?, videoUrl: String?, equipment: String?, createdAt: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.description = description
        self.videoUrl = videoUrl
        self.equipment = equipment
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        id = try container.decode("id")
        name = try container.decode("name")
        description = try container.decodeIfPresent("description")
        videoUrl = try container.decodeIfPresent("videoUrl")
        equipment = try container.decodeIfPresent("equipment")
        createdAt = try container.decode("created_at")
        updatedAt = try container.decode("updated_at")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(id, forKey: "id")
        try container.encode(name, forKey: "name")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(videoUrl, forKey: "videoUrl")
        try container.encodeIfPresent(equipment, forKey: "equipment")
        try container.encode(createdAt, forKey: "created_at")
        try container.encode(updatedAt, forKey: "updated_at")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ExerciseCreationEditingSuccessResponse else { return false }
      guard self.id == object.id else { return false }
      guard self.name == object.name else { return false }
      guard self.description == object.description else { return false }
      guard self.videoUrl == object.videoUrl else { return false }
      guard self.equipment == object.equipment else { return false }
      guard self.createdAt == object.createdAt else { return false }
      guard self.updatedAt == object.updatedAt else { return false }
      return true
    }

    public static func == (lhs: ExerciseCreationEditingSuccessResponse, rhs: ExerciseCreationEditingSuccessResponse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
