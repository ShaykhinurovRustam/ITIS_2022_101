//
//  Car.swift
//  homework-6
//
//  Created by Рустам Шайхинуров on 21.10.2022.
//

import Foundation

let carModels = [
	"Honda Accord",
	"Ford F-Series Pickup",
	"Honda Civic",
	"Toyota Camry",
	"Nissan Altima",
	"Toyota Corolla",
	"Chevrolet Silverado",
	"Chevrolet Malibu",
	"Ford Fusion",
	"Hyundai Sonata"
]

struct Car {
	let model: String
	let weight: Int
	let price: Int
	let maxSpeed: Int
	let fuelConsumptionPerKm: Int
	let numOfAccidents: Int
}

extension Car {
	static func getCars() -> [Car] {
		var cars: [Car] = []
		
		for carModel in carModels.shuffled() {
			let car = Car(
				model: carModel,
				weight: Int.random(in: 4000..<6000),
				price: Int.random(in: 1000000..<10000000),
				maxSpeed: Int.random(in: 200..<310),
				fuelConsumptionPerKm: Int.random(in: 1..<4),
				numOfAccidents: Int.random(in: 1..<12)
			)
			
			cars.append(car)
		}
		
		return cars
	}
}
