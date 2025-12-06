import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powerstatsLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    var service = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.loadAllHeroes { success in
            if success {
                self.loadLastOrRandomHero()
            }
        }
    }
    func loadLastOrRandomHero() {
        if let lastID = UserDefaults.standard.value(forKey: "lastHeroID") as? Int { service.fetchHeroByID(lastID) { hero in
            if let hero {
                self.updateUI(with: hero)
                return }
            self.showRandomHero() }
        } else {
            self.showRandomHero()
        }
    }
    func showRandomHero() {
        guard let hero = service.randomHero() else { return }
        updateUI(with: hero)
        UserDefaults.standard.set(hero.id, forKey: "lastHeroID")
    }
    func updateUI(with hero: HeroModel) {
        DispatchQueue.main.async {
            self.nameLabel.text = hero.name
            
            self.powerstatsLabel.text = """
            Intelligence: \(hero.powerstats.intelligence)
            Strength: \(hero.powerstats.strength)
            Speed: \(hero.powerstats.speed)
            Durability: \(hero.powerstats.durability)
            Power: \(hero.powerstats.power)
            Combat: \(hero.powerstats.combat)
            """

            self.appearanceLabel.text = """
            Gender: \(hero.appearance.gender)
            Race: \(hero.appearance.race ?? "Unknown")
            Height: \(hero.appearance.height.last ?? "")
            Weight: \(hero.appearance.weight.last ?? "")
            EyeColor: \(hero.appearance.eyeColor)
            HairColor: \(hero.appearance.hairColor)
            """

            self.heroImageView.kf.setImage(with: URL(string: hero.images.md))
        }
    }
    @IBAction func rollButtonTapped(_ sender: Any) {
        showRandomHero()
    }
    

}

