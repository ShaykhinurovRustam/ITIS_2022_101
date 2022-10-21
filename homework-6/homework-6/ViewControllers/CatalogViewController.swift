//
//  CatalogViewController.swift
//  homework-6
//
//  Created by Рустам Шайхинуров on 21.10.2022.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	private let catalogTableView: UITableView = .init(frame: .zero, style: .insetGrouped)
	private let cars: [Car] = Car.getCars()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
		view.backgroundColor = .systemGray4
		catalogTableView.backgroundColor = .clear
		view.addSubview(catalogTableView)
		catalogTableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			catalogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			catalogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			catalogTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			catalogTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		])
		
		catalogTableView.dataSource = self
		catalogTableView.delegate = self
		catalogTableView.reloadData()
		catalogTableView.register(
			UITableViewCell.self,
			forCellReuseIdentifier: Identifier.models.rawValue)
		catalogTableView.register(
			CatalogTableViewCell.self,
			forCellReuseIdentifier: Identifier.detailedInfo.rawValue)
	}
	
	enum Identifier: String {
		case models = "models"
		case detailedInfo = "detailedInfo"
	}
	
	// MARK: - UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		2
	}
	
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int
	) -> Int {
		switch section {
		case 0:
			return cars.count
		case 1:
			return cars.count
		default:
			return 0
		}
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let car = cars[indexPath.row]
			
			var configuration = UIListContentConfiguration.valueCell()
			configuration.text = car.model
			configuration.image = UIImage(systemName: "car.fill")
			if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 8 {
				configuration.secondaryText = "Количество ДТП: \(car.numOfAccidents)"
			}
			guard let cell = tableView
				.dequeueReusableCell(
					withIdentifier: Identifier.models.rawValue
				) else { return UITableViewCell() }
			
			cell.contentConfiguration = configuration
			cell.selectionStyle = .none
			return cell
		case 1:
			guard let cell = tableView
				.dequeueReusableCell(
					withIdentifier: Identifier.detailedInfo.rawValue
				) as? CatalogTableViewCell
			else {
				fatalError("Could not deque cell of type \(CatalogTableViewCell.self)")
			}
			
			let car = cars[indexPath.row]
			cell.set(car: car)
			
			return cell
		default:
			return UITableViewCell()
		}
	}
	
	func tableView(
		_ tableView: UITableView,
		titleForHeaderInSection section: Int
	) -> String? {
		switch section {
		case 0:
			return "Модель машины"
		case 1:
			return "Детализированная информация"
		default:
			return "Пустая секция"
		}
	}
	
	// MARK: - UITableViewDelegate
	
	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath
	) {
		switch indexPath.section {
		case 1:
			tableView.deselectRow(at: indexPath, animated: true)
			print((tableView.cellForRow(at: indexPath) as? CatalogTableViewCell)!.toString())
		default:
			return
		}
	}
	
	func tableView(
		_ tableView: UITableView,
		heightForRowAt indexPath: IndexPath
	) -> CGFloat {
		UITableView.automaticDimension
	}
	
}
