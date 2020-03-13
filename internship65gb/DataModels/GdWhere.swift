
import Foundation
struct GdWhere : Codable {
	let valueString : String?

	enum CodingKeys: String, CodingKey {

		case valueString = "valueString"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		valueString = try values.decodeIfPresent(String.self, forKey: .valueString)
	}

}
