import Foundation

struct HeroService {
    
    func fetchRandomhero() async throws -> HeroModel {
        let id = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
                
        let(data, _) = try await URLSession.shared.data(from: url)
        let hero = try JSONDecoder().decode(HeroModel.self, from: data)
        return hero
    }
}
