
import Foundation
struct Data : Codable {
	let vehicleRepairServices : [VehicleRepairServices]?

	enum CodingKeys: String, CodingKey {

		case vehicleRepairServices = "vehicleRepairServices"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		vehicleRepairServices = try values.decodeIfPresent([VehicleRepairServices].self, forKey: .vehicleRepairServices)
	}

}
