import UIKit

class CompositionalLayoutController: UIViewController, UICollectionViewDataSource {
	
	private lazy var collectionView: UICollectionView = {
			let configuration = UICollectionViewCompositionalLayoutConfiguration()
			let layout = UICollectionViewCompositionalLayout(
				sectionProvider: { [weak self] section, environment in
					guard let self else { fatalError("Self is nil") }
					guard let section = Section(rawValue: section) else {
						fatalError("This section: (\(section)) does not exist")
					}

					switch section {
					case .promotedProducts:
						return self.promotedCellsSection()
					case .listOfProducts:
						return self.listOfProductsCellSection()
					case .headerPromoted, .headerList:
						return self.headerCellSection()
					}
				},
				configuration: configuration
			)
			return UICollectionView(
				frame: .zero, collectionViewLayout: layout
			)
		}()
	
	private func headerCellSection() -> NSCollectionLayoutSection {
			 let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
			 let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitem: item, count: 1)
			 let section = NSCollectionLayoutSection(group: group)
			 return section
		 }
	
	private func promotedCellsSection() -> NSCollectionLayoutSection {
		let item = NSCollectionLayoutItem(
			layoutSize: NSCollectionLayoutSize(
				widthDimension: .fractionalWidth(0.5),
				heightDimension: .fractionalHeight(1)
			)
		)
		 let group = NSCollectionLayoutGroup
			.horizontal(
				layoutSize: NSCollectionLayoutSize(
					widthDimension: .fractionalWidth(1),
					heightDimension: .absolute(250)),
				subitem: item,
				count: 2
			)
		 let section = NSCollectionLayoutSection(group: group)
		 section.orthogonalScrollingBehavior = .groupPaging
		 return section
	}
	
	private func listOfProductsCellSection() -> NSCollectionLayoutSection {
		let item = NSCollectionLayoutItem(
			layoutSize: NSCollectionLayoutSize(
				widthDimension: .fractionalWidth(1),
				heightDimension: .absolute(240)
			)
		)
		 let group = NSCollectionLayoutGroup
			.vertical(
				layoutSize: NSCollectionLayoutSize(
					widthDimension: .fractionalWidth(1),
					heightDimension: .estimated(240)),
				subitem: item,
				count: 1
			)
		 let section = NSCollectionLayoutSection(group: group)
		 let spacing: CGFloat = 20
		 section.interGroupSpacing = spacing
		 section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
		 return section
	}
	
	struct TitledImage {
		let title: String
		let url: URL
	}
	
	struct Image {
		let url: URL
	}
	
	private var dataTask: URLSessionDataTask?
	
	private let titledImages: [TitledImage] = [
		.init(title: "Апельсины", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/daf89f0c-4cbd-4a6a-a81a-3afa55752dcf.webp?1656467250.3508")!),
		.init(title: "Баранки «Молочные»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/aaa1bbd8-1c8a-43d9-8b84-de431f63e35f.webp?1656480474.7944")!),
		.init(title: "Батон «Молодежный», нарезка", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/70625c3f-4d44-4417-9710-09b1cd013f72.webp?1656419657.1438")!),
		.init(title: "Батон нарезной, половинка", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/9129cdbc-d461-4979-93b3-460b6ea4ee55.webp?1658584092.8423")!),
		.init(title: "Батончик «Кокос-кешью»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/76b2fada-df26-4e7b-8e5f-3e9d79fca488.webp?1664740091.5802")!),
		.init(title: "Арахис жареный, соленый", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/72cbde83-b462-4fcc-9ec0-c999d1b4b01d.webp?1663184424.2639")!),
		.init(title: "Баранки «Горчичные»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/8e17aa28-72d7-4a09-b00a-0df2520b41c0.webp?1656486847.9264")!),
		.init(title: "Десерт веганский «Суфле с малиной»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/bc8f32df-58d0-43b5-9bb0-1b496bbe2b51.webp?1656515890.2976")!),
		.init(title: "Десерт «Зефирное эскимо»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/23b4ba06-de6c-44e5-84c2-f47bc8b0caa7.webp?1656528586.8284")!),
		.init(title: "Десерт «Веррин карамельный»", url: URL(string: "https://img.vkusvill.ru/pim/images/site_MiniWebP/6bf612a8-8472-4966-b603-57e065438fbb.webp?1656462178.4761")!),
	]
	
	private let images: [Image] = [
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/eefc301f-5f35-4a71-82d5-0d858ca66d05.webp?1656443775.1066")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/85b739ab-d22a-4f29-9ea9-c7381252e054.webp?1656422889.6138")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/cb6c2c78-23b7-4996-9e0c-1c67bb959829.webp?1659294012.7206")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/bd6829b7-00a8-4765-b5a5-72b7dd9a0d09.webp?1660322358.2293")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/2bf1a6f3-73e1-4965-8ccf-50daff932f04.webp?1656428066.8168")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/015e0768-d38a-47d3-b182-4eac7b0cc4a7.jpg?1655228953.7795")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/7c0804ad-3bdd-4f7c-bcaf-5a018ba6422e.webp?1656415412.8776")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/7c0804ad-3bdd-4f7c-bcaf-5a018ba6422e.webp?1656415412.8776")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_MiniWebP/309e87ef-cb15-4ade-9a7b-0f9ce64ef790.webp?1656419319.5365")!),
		.init(url: URL(string:
			"https://img.vkusvill.ru/pim/images/site_BigWebP/393618d9-43d8-4e57-9239-8b2fed463a1b.webp?1656479133.9592")!),
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
		view.backgroundColor = .systemBackground

		collectionView.contentInsetAdjustmentBehavior = .always
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])

		collectionView.dataSource = self
		
		collectionView.register(PromotedProductsCell.self, forCellWithReuseIdentifier: "\(Section.promotedProducts)")
		 collectionView.register(ListOfProductsCell.self, forCellWithReuseIdentifier: "\(Section.listOfProducts)")
		 collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.headerPromoted)")
		 collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.headerList)")
		}
	
	enum Section: Int, CaseIterable {
		case headerPromoted
		case promotedProducts
		case headerList
		case listOfProducts
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		Section.allCases.count
	}
	
	func collectionView(
		_ collectionView: UICollectionView,
		numberOfItemsInSection section: Int
	) -> Int {
		guard let section = Section(rawValue: section) else { return 0 }
		
		switch section {
			case .headerPromoted: return 1
			case .promotedProducts: return titledImages.count
			case .headerList: return 1
			case .listOfProducts: return images.count
		}
	}
	
	private func cellContentConfiguration(section: Section) -> UIContentConfiguration {
			 var configuration = UIListContentConfiguration.cell()
			 switch section {
				 case .headerPromoted:
					 configuration.text = "Promoted Products"
					 configuration.textProperties.font = .boldSystemFont(ofSize: 24)
				 case .headerList:
					 configuration.text = "List of products"
					 configuration.textProperties.font = .boldSystemFont(ofSize: 24)
				 default:
					 return UIListContentConfiguration.cell()
				 }
				 return configuration
		 }
	
	func collectionView(
		_ collectionView: UICollectionView,
		cellForItemAt indexPath: IndexPath
	) -> UICollectionViewCell {
		guard let section = Section(rawValue: indexPath.section) else { fatalError() }
		switch section {
		   case .promotedProducts:
			   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath) as? PromotedProductsCell else {fatalError("Could not deque cell of \(section)")}
			   let image = images[indexPath.row]
			   cell.set(imageUrl: image.url)
			   return cell
		   case .listOfProducts:
			   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath) as? ListOfProductsCell else {fatalError("Could not deque cell of \(section)")}
			   let image = titledImages[indexPath.row]
			   cell.set(label: image.title, imageUrl: image.url)
			   return cell
		   default:
			   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath)
			   cell.contentConfiguration = cellContentConfiguration(section: section)
			   cell.contentView.backgroundColor = .clear
			   return cell
		}
   }
}
