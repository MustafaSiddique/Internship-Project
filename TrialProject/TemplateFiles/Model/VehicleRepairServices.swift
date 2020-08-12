
import Foundation
struct VehicleRepairServices : Codable {
	let _id : String?
	let address : Address?
	let notes : String?
	let type : String?
	let date : String?
	let price : Double?
	let image : String?
	let mileage : String?
	let vehicleID : String?
	let __v : Int?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case address = "address"
		case notes = "notes"
		case type = "type"
		case date = "date"
		case price = "price"
		case image = "image"
		case mileage = "mileage"
		case vehicleID = "vehicleID"
		case __v = "__v"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		address = try values.decodeIfPresent(Address.self, forKey: .address)
		notes = try values.decodeIfPresent(String.self, forKey: .notes)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		mileage = try values.decodeIfPresent(String.self, forKey: .mileage)
		vehicleID = try values.decodeIfPresent(String.self, forKey: .vehicleID)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
	}

}
