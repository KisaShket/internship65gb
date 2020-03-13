
import Foundation
struct GdName : Codable {
	let gdFullName : GdFullName?
	let gdGivenName : GdGivenName?
	let gdFamilyName : GdFamilyName?

	enum CodingKeys: String, CodingKey {

		case gdFullName = "gd$fullName"
		case gdGivenName = "gd$givenName"
		case gdFamilyName = "gd$familyName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gdFullName = try values.decodeIfPresent(GdFullName.self, forKey: .gdFullName)
		gdGivenName = try values.decodeIfPresent(GdGivenName.self, forKey: .gdGivenName)
		gdFamilyName = try values.decodeIfPresent(GdFamilyName.self, forKey: .gdFamilyName)
	}

}
