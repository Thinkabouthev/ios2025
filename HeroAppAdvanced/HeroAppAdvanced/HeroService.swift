import Foundation
import Alamofire

class HeroService {
    private let allHeroesURL = "https://akabab.github.io/superhero-api/api/all.json"
    private let heroByIdURL = "https://akabab.github.io/superhero-api/api/id/"
    
    var heroes: [HeroModel] = []
    
    func loadAllHeroes(completion: @escaping (Bool) -> Void) {
        AF.request(allHeroesURL).responseDecodable(of: [HeroModel].self) { response in
            switch response.result {
            case .success(let data):
                self.heroes = data
                completion(true)
            case .failure(let error):
                print("Error loading all heroes:", error)
                completion(false)
            }
        }
    }
    func fetchHeroByID(_ id: Int, completion: @escaping (HeroModel?) -> Void) {
        let url = "\(heroByIdURL)\(id).json"
        AF.request(url).responseDecodable(of: HeroModel.self) { response in
            switch response.result {
            case .success(let hero):
                completion(hero)
            case .failure:
                completion(nil)
            }
        }
    }
    
    func randomHero() -> HeroModel? {
        return heroes.randomElement()
    }
}
