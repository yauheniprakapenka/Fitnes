//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class EmomTrainingSection: APIModel {

    public var sectionType: String

    public var startMinute: Double

    public var duration: Double

    public var actions: [Actions]?

    public var sectionName: String?

    public class Actions: APIModel {

        public var exerciseId: Int

        public var minute: Int

        public var defaultValueMan: Double?

        public var defaultValueWoman: Double?

        public var distance: Double?

        public var profileIndex: String?

        public var ratio: Int?

        public var reps: Int?

        public init(exerciseId: Int, minute: Int, defaultValueMan: Double? = nil, defaultValueWoman: Double? = nil, distance: Double? = nil, profileIndex: String? = nil, ratio: Int? = nil, reps: Int? = nil) {
            self.exerciseId = exerciseId
            self.minute = minute
            self.defaultValueMan = defaultValueMan
            self.defaultValueWoman = defaultValueWoman
            self.distance = distance
            self.profileIndex = profileIndex
            self.ratio = ratio
            self.reps = reps
        }

        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StringCodingKey.self)

            exerciseId = try container.decode("exercise_id")
            minute = try container.decode("minute")
            defaultValueMan = try container.decodeIfPresent("default_value_man")
            defaultValueWoman = try container.decodeIfPresent("default_value_woman")
            distance = try container.decodeIfPresent("distance")
            profileIndex = try container.decodeIfPresent("profile_index")
            ratio = try container.decodeIfPresent("ratio")
            reps = try container.decodeIfPresent("reps")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: StringCodingKey.self)

            try container.encode(exerciseId, forKey: "exercise_id")
            try container.encode(minute, forKey: "minute")
            try container.encodeIfPresent(defaultValueMan, forKey: "default_value_man")
            try container.encodeIfPresent(defaultValueWoman, forKey: "default_value_woman")
            try container.encodeIfPresent(distance, forKey: "distance")
            try container.encodeIfPresent(profileIndex, forKey: "profile_index")
            try container.encodeIfPresent(ratio, forKey: "ratio")
            try container.encodeIfPresent(reps, forKey: "reps")
        }

        public func isEqual(to object: Any?) -> Bool {
          guard let object = object as? Actions else { return false }
          guard self.exerciseId == object.exerciseId else { return false }
          guard self.minute == object.minute else { return false }
          guard self.defaultValueMan == object.defaultValueMan else { return false }
          guard self.defaultValueWoman == object.defaultValueWoman else { return false }
          guard self.distance == object.distance else { return false }
          guard self.profileIndex == object.profileIndex else { return false }
          guard self.ratio == object.ratio else { return false }
          guard self.reps == object.reps else { return false }
          return true
        }

        public static func == (lhs: Actions, rhs: Actions) -> Bool {
            return lhs.isEqual(to: rhs)
        }
    }

    public init(sectionType: String, startMinute: Double, duration: Double, actions: [Actions]? = nil, sectionName: String? = nil) {
        self.sectionType = sectionType
        self.startMinute = startMinute
        self.duration = duration
        self.actions = actions
        self.sectionName = sectionName
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        sectionType = try container.decode("section_type")
        startMinute = try container.decode("start_minute")
        duration = try container.decode("duration")
        actions = try container.decodeArrayIfPresent("actions")
        sectionName = try container.decodeIfPresent("section_name")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(sectionType, forKey: "section_type")
        try container.encode(startMinute, forKey: "start_minute")
        try container.encode(duration, forKey: "duration")
        try container.encodeIfPresent(actions, forKey: "actions")
        try container.encodeIfPresent(sectionName, forKey: "section_name")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? EmomTrainingSection else { return false }
      guard self.sectionType == object.sectionType else { return false }
      guard self.startMinute == object.startMinute else { return false }
      guard self.duration == object.duration else { return false }
      guard self.actions == object.actions else { return false }
      guard self.sectionName == object.sectionName else { return false }
      return true
    }

    public static func == (lhs: EmomTrainingSection, rhs: EmomTrainingSection) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
