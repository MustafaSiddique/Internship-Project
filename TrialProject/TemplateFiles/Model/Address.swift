
import Foundation
struct Address : Codable {
	let coordinates : [Double]?
	let address : String?

	enum CodingKeys: String, CodingKey {

		case coordinates = "coordinates"
		case address = "address"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		coordinates = try values.decodeIfPresent([Double].self, forKey: .coordinates)
		address = try values.decodeIfPresent(String.self, forKey: .address)
	}

}
