import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powerstatsLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    var service = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let hero = try await service.fetchRandomhero()
            updateUI(with: hero)
        }
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        Task{
            do {
                let hero = try await self.service.fetchRandomhero()
                updateUI(with: hero)
            } catch {
                print( "error: \(error)")
            }
        }
    }
    
    func updateUI(with hero: HeroModel) {
        nameLabel.text = hero.name
        
        powerstatsLabel.text = """
            Intelligence: \(hero.powerstats.intelligence)
            Strength: \(hero.powerstats.strength)
            Speed: \(hero.powerstats.speed)
            Durability: \(hero.powerstats.durability)
            Power: \(hero.powerstats.power)
            Combat: \(hero.powerstats.combat)
            """
        appearanceLabel.text = """
            Gender: \(hero.appearance.gender)
            Race: \(hero.appearance.race ?? "Unkown")
            Height: \(hero.appearance.height.last ?? "")
            Weight: \(hero.appearance.weight.last ?? "")
            EyeColor: \(hero.appearance.eyeColor)
            HairColor: \(hero.appearance.hairColor)
            """
        if let url = URL(string: hero.images.md) {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    heroImageView.image = UIImage(data: data)
                } catch {
                    print( "image loading error: \(error)")
                }
            }
        }
    }

}

