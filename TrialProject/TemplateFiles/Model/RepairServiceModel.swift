
import Foundation
struct Json4Swift_Base : Codable {
	let status : String?
	let totalRepairServicesCost : Double?
	let count : Int?
	let data : Data?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case totalRepairServicesCost = "totalRepairServicesCost"
		case count = "count"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		totalRepairServicesCost = try values.decodeIfPresent(Double.self, forKey: .totalRepairServicesCost)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
	}

}
