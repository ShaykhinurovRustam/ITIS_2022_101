import UIKit

class PromotedProductsCell: UICollectionViewCell {
	
	func set(imageUrl: URL) {
		 loadImage(url: imageUrl)
	 }
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		setup()
	}
	
	private let imageView: UIImageView = .init()
	private var dataTask: URLSessionDataTask?

	private func setup() {
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .systemGray3
		contentView.addSubview(imageView)

		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
		
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 30
		imageView.contentMode = .scaleAspectFill
		
	}

	private func loadImage(url: URL) {
		 imageView.image = nil
		 dataTask?.cancel()
		 let urlRequest = URLRequest(
			 url: url,
			 cachePolicy: .returnCacheDataElseLoad
		 )
		 dataTask = URLSession.shared
			 .dataTask(with: urlRequest) { [imageView] data, _, _ in
				 guard let data else {
					 print("could not load image")
					 return
				 }
				 let image = UIImage(data: data)
				 DispatchQueue.main.async { [imageView] in
					 guard let image else { return }
					 imageView.image = image
				 }
			 }
		 dataTask?.resume()
	 }
}
