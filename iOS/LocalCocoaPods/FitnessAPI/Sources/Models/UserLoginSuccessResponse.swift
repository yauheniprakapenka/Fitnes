//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class UserLoginSuccessResponse: APIModel {

    public enum TokenType: String, Codable, Equatable, CaseIterable {
        case bearer = "bearer"
    }

    public var accessToken: String

    public var userId: Double

    public var client: Bool?

    public var createdAt: Double?

    public var expiresIn: Double?

    public var tokenType: TokenType?

    public var trainer: Bool?

    public init(accessToken: String, userId: Double, client: Bool? = nil, createdAt: Double? = nil, expiresIn: Double? = nil, tokenType: TokenType? = nil, trainer: Bool? = nil) {
        self.accessToken = accessToken
        self.userId = userId
        self.client = client
        self.createdAt = createdAt
        self.expiresIn = expiresIn
        self.tokenType = tokenType
        self.trainer = trainer
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        accessToken = try container.decode("access_token")
        userId = try container.decode("user_id")
        client = try container.decodeIfPresent("client")
        createdAt = try container.decodeIfPresent("created_at")
        expiresIn = try container.decodeIfPresent("expires_in")
        tokenType = try container.decodeIfPresent("token_type")
        trainer = try container.decodeIfPresent("trainer")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(accessToken, forKey: "access_token")
        try container.encode(userId, forKey: "user_id")
        try container.encodeIfPresent(client, forKey: "client")
        try container.encodeIfPresent(createdAt, forKey: "created_at")
        try container.encodeIfPresent(expiresIn, forKey: "expires_in")
        try container.encodeIfPresent(tokenType, forKey: "token_type")
        try container.encodeIfPresent(trainer, forKey: "trainer")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? UserLoginSuccessResponse else { return false }
      guard self.accessToken == object.accessToken else { return false }
      guard self.userId == object.userId else { return false }
      guard self.client == object.client else { return false }
      guard self.createdAt == object.createdAt else { return false }
      guard self.expiresIn == object.expiresIn else { return false }
      guard self.tokenType == object.tokenType else { return false }
      guard self.trainer == object.trainer else { return false }
      return true
    }

    public static func == (lhs: UserLoginSuccessResponse, rhs: UserLoginSuccessResponse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}