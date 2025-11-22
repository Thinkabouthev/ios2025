import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let music: [MovieItem] = [
        MovieItem(title: "Wiped Out!", subtitle: "The Neighbourhood",
                  review: "Dark and atmospheric", image: .theNeighbourhood),

        MovieItem(title: "Diamond Eyes", subtitle: "Deftones",
                  review: "Energetic and emotional", image: .deftones),

        MovieItem(title: "Demon Days", subtitle: "Gorillaz",
                  review: "Unique, creative", image: .gorillaz),

        MovieItem(title: "West Coast", subtitle: "Lana Del Rey",
                  review: "Dreamy and nostalgic", image: .lana),

        MovieItem(title: "Midnights", subtitle: "Taylor Swift",
                  review: "Timeless", image: .taylor),
        
        MovieItem(title: "Wiped Out!", subtitle: "The Neighbourhood",
                  review: "Dark and atmospheric", image: .theNeighbourhood),

        MovieItem(title: "Diamond Eyes", subtitle: "Deftones",
                  review: "Energetic and emotional", image: .deftones),

        MovieItem(title: "Demon Days", subtitle: "Gorillaz",
                  review: "Unique, creative", image: .gorillaz),

        MovieItem(title: "West Coast", subtitle: "Lana Del Rey",
                  review: "Dreamy and nostalgic", image: .lana),

        MovieItem(title: "Midnights", subtitle: "Taylor Swift",
                  review: "Timeless", image: .taylor)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! MovieTableViewCell

        cell.configure(item: music[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = music[indexPath.row]

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = selected

        navigationController?.pushViewController(vc, animated: true)
    }
}
