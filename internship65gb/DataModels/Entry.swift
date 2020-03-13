
import Foundation
struct Entry : Codable {
	let title : Title?
	let link : [Link]?
	let galType : GalType?
	let gdName : GdName?
	let gdWhere : GdWhere?
	let gdOrganization : [GdOrganization]?
	let gdEmail : [GdEmail]?
	let gdPhoneNumber : [GdPhoneNumber]?

	enum CodingKeys: String, CodingKey {
		case title = "title"
		case link = "link"
		case galType = "gal$type"
		case gdName = "gd$name"
		case gdWhere = "gd$where"
		case gdOrganization = "gd$organization"
		case gdEmail = "gd$email"
		case gdPhoneNumber = "gd$phoneNumber"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(Title.self, forKey: .title)
		link = try values.decodeIfPresent([Link].self, forKey: .link)
		galType = try values.decodeIfPresent(GalType.self, forKey: .galType)
		gdName = try values.decodeIfPresent(GdName.self, forKey: .gdName)
		gdWhere = try values.decodeIfPresent(GdWhere.self, forKey: .gdWhere)
		gdOrganization = try values.decodeIfPresent([GdOrganization].self, forKey: .gdOrganization)
		gdEmail = try values.decodeIfPresent([GdEmail].self, forKey: .gdEmail)
		gdPhoneNumber = try values.decodeIfPresent([GdPhoneNumber].self, forKey: .gdPhoneNumber)
	}

}
