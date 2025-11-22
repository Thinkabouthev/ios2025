import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let courses: [MovieItem] = [
        MovieItem(title: "iOS Development", subtitle: "Mobile Dev",
                  review: "UIKit, layouts, TableViews", image: .hp),

        MovieItem(title: "Algorithms", subtitle: "CS Core",
                  review: "Logic, structures", image: .thg),

        MovieItem(title: "Software Engineering", subtitle: "CS",
                  review: "Processes, memory", image: .lana),

        MovieItem(title: "Linear Algebra", subtitle: "Math",
                  review: "Vectors, matrices", image: .taylor),

        MovieItem(title: "Databases", subtitle: "CS",
                  review: "Queries and data design", image: .agggtm),
        
        MovieItem(title: "iOS Development", subtitle: "Mobile Dev",
                  review: "UIKit, layouts, TableViews", image: .hp),

        MovieItem(title: "Algorithms", subtitle: "CS Core",
                  review: "Logic, structures", image: .thg),

        MovieItem(title: "Software Engineering", subtitle: "CS",
                  review: "Processes, memory", image: .lana),

        MovieItem(title: "Linear Algebra", subtitle: "Math",
                  review: "Vectors, matrices", image: .taylor),

        MovieItem(title: "Databases", subtitle: "CS",
                  review: "Queries and data design", image: .agggtm)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CoursesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! MovieTableViewCell

        cell.configure(item: courses[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = courses[indexPath.row]

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = selected

        navigationController?.pushViewController(vc, animated: true)
    }
}
