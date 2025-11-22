import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    var movie: MovieItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let movie = movie else { return }

        movieImageView.image = movie.image
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        reviewLabel.text = movie.review
    }
}
