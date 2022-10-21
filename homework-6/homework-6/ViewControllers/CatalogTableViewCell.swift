//
//  CarTableViewCell.swift
//  homework-6
//
//  Created by Рустам Шайхинуров on 21.10.2022.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		setup()
	}
	
	private let carImage: UIImageView = .init()
	private let modelLabel: UILabel = .init()
	private let weightLabel: UILabel = .init()
	private let priceLabel: UILabel = .init()
	private let maxSpeedLabel: UILabel = .init()
	private let fuelConsumptionPerKmLabel: UILabel = .init()
	
	public func set(car: Car) {
		carImage.image = UIImage(systemName: "car.fill")
		modelLabel.text = car.model
		weightLabel.text = "Вес: \(car.weight) кг"
		priceLabel.text = "Цена: \(car.price) ₽"
		maxSpeedLabel.text = "Максимальная скорость: \(car.maxSpeed) км/ч"
		fuelConsumptionPerKmLabel.text = "Расход топлива: \(car.fuelConsumptionPerKm)л. на километр"
	}
	
	public func toString() -> String {
		let information = """
Вес: \(weightLabel.text ?? "null")
Цена: \(priceLabel.text ?? "null")
Максимальная скорость: \(maxSpeedLabel.text ?? "null")
Расход топлива: \(fuelConsumptionPerKmLabel.text ?? "null")
"""
		return information
	}
	
	private func setup() {
		modelLabel.font = .boldSystemFont(ofSize: 20)
		weightLabel.font = .systemFont(ofSize: 10)
		priceLabel.font = .systemFont(ofSize: 10)
		maxSpeedLabel.font = .systemFont(ofSize: 10)
		fuelConsumptionPerKmLabel.font = .systemFont(ofSize: 10)

		let headerStackView = UIStackView(arrangedSubviews: [
			carImage, modelLabel
		])
		
		let infoStackView = UIStackView(arrangedSubviews: [
			weightLabel, priceLabel, maxSpeedLabel,
			fuelConsumptionPerKmLabel
		])
		infoStackView.axis = .vertical
		infoStackView.alignment = .leading
		
		contentView.addSubview(headerStackView)
		contentView.addSubview(infoStackView)
		headerStackView.translatesAutoresizingMaskIntoConstraints = false
		infoStackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
			headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			infoStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 5),
			infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
		])
	}
}
