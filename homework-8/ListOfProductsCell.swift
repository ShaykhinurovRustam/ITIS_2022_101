import UIKit

class ListOfProductsCell: UICollectionViewCell {
	
	func set(label: String, imageUrl: URL) {
			loadImage(url: imageUrl)
			title.text = label
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
	private let title: UILabel = .init()
	private var dataTask: URLSessionDataTask?
	
	private func setup() {
		contentView.addSubview(imageView)
		contentView.addSubview(title)

	    imageView.translatesAutoresizingMaskIntoConstraints = false
	    title.translatesAutoresizingMaskIntoConstraints = false
	    NSLayoutConstraint.activate([
		    imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
		    imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
		    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

		    title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
		    title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		    title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
	    ])

		title.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		title.numberOfLines = 0
		title.textColor = .black
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
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
