//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Training: APIModel {

    public var name: String

    public var trainerId: String

    public var startTime: String

    public var description: String

    public var sections: [TrainingSection]

    public var id: Int?

    public init(name: String, trainerId: String, startTime: String, description: String, sections: [TrainingSection], id: Int? = nil) {
        self.name = name
        self.trainerId = trainerId
        self.startTime = startTime
        self.description = description
        self.sections = sections
        self.id = id
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        name = try container.decode("name")
        trainerId = try container.decode("trainer_id")
        startTime = try container.decode("start_time")
        description = try container.decode("description")
        sections = try container.decodeArray("sections")
        id = try container.decodeIfPresent("id")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(name, forKey: "name")
        try container.encode(trainerId, forKey: "trainer_id")
        try container.encode(startTime, forKey: "start_time")
        try container.encode(description, forKey: "description")
        try container.encode(sections, forKey: "sections")
        try container.encodeIfPresent(id, forKey: "id")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Training else { return false }
      guard self.name == object.name else { return false }
      guard self.trainerId == object.trainerId else { return false }
      guard self.startTime == object.startTime else { return false }
      guard self.description == object.description else { return false }
      guard self.sections == object.sections else { return false }
      guard self.id == object.id else { return false }
      return true
    }

    public static func == (lhs: Training, rhs: Training) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}