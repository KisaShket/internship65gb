
import Foundation
struct GdOrganization : Codable {
	let rel : String?
	let primary : String?
	let gdOrgTitle : GdOrgTitle?

	enum CodingKeys: String, CodingKey {

		case rel = "rel"
		case primary = "primary"
		case gdOrgTitle = "gd$orgTitle"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rel = try values.decodeIfPresent(String.self, forKey: .rel)
		primary = try values.decodeIfPresent(String.self, forKey: .primary)
		gdOrgTitle = try values.decodeIfPresent(GdOrgTitle.self, forKey: .gdOrgTitle)
	}

}
