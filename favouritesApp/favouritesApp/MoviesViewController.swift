import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let movies: [MovieItem] = [
        MovieItem(title: "Harry Potter 3", subtitle: "Alfonso Cuarón",
                  review: "Dark, atmospheric", image: .hp),

        MovieItem(title: "The Hunger Games", subtitle: "Gary Ross",
                  review: "Very emotional", image: .hungerGames),

        MovieItem(title: "Supernatural", subtitle: "Eric Kripke",
                  review: "Mystery and emotional depth", image: .supernatural),

        MovieItem(title: "Now You See Me 2", subtitle: "Jon M. Chu",
                  review: "Fun, stylish and plot twist", image: .nysm),

        MovieItem(title: "Sherlock", subtitle: "Moffat & Gatiss",
                  review: "Brilliant writing", image: .sherlock),
        
        MovieItem(title: "Harry Potter 3", subtitle: "Alfonso Cuarón",
                  review: "Dark, atmospheric", image: .hp),

        MovieItem(title: "The Hunger Games", subtitle: "Gary Ross",
                  review: "Very emotional", image: .hungerGames),

        MovieItem(title: "Supernatural", subtitle: "Eric Kripke",
                  review: "Mystery and emotional depth", image: .supernatural),

        MovieItem(title: "Now You See Me 2", subtitle: "Jon M. Chu",
                  review: "Fun, stylish and plot twist", image: .nysm),

        MovieItem(title: "Sherlock", subtitle: "Moffat & Gatiss",
                  review: "Brilliant writing", image: .sherlock)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! MovieTableViewCell

        cell.configure(item: movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = movies[indexPath.row]

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = selected

        navigationController?.pushViewController(vc, animated: true)
    }
}
