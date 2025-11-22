import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let books: [MovieItem] = [
        MovieItem(title: "A Good Girl's Guide to Murder", subtitle: "Holly Jackson",
                  review: "Clever mystery", image: .agggtm),

        MovieItem(title: "Call of Cthulhu", subtitle: "H.P. Lovecraft",
                  review: "Classic horror", image: .cc),

        MovieItem(title: "The Hunger Games", subtitle: "Suzanne Collins",
                  review: "Strong dystopian", image: .thg),

        MovieItem(title: "Harry Potter", subtitle: "J.K. Rowling",
                  review: "Magical and nostalgic", image: .hpbook),

        MovieItem(title: "Frankenstein", subtitle: "Mary Shelley",
                  review: "Dark, emotional", image: .frankenstein),
        
        MovieItem(title: "A Good Girl's Guide to Murder", subtitle: "Holly Jackson",
                  review: "Clever mystery", image: .agggtm),

        MovieItem(title: "Call of Cthulhu", subtitle: "H.P. Lovecraft",
                  review: "Classic horror", image: .cc),

        MovieItem(title: "The Hunger Games", subtitle: "Suzanne Collins",
                  review: "Strong dystopian", image: .thg),

        MovieItem(title: "Harry Potter", subtitle: "J.K. Rowling",
                  review: "Magical and nostalgic", image: .hpbook),

        MovieItem(title: "Frankenstein", subtitle: "Mary Shelley",
                  review: "Dark, emotional", image: .frankenstein)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! MovieTableViewCell

        cell.configure(item: books[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = books[indexPath.row]

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = selected

        navigationController?.pushViewController(vc, animated: true)
    }
}
