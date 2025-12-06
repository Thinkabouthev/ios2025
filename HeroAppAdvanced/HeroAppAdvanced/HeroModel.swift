
struct HeroModel: Decodable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let images: HeroImage
}

struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Appearance: Decodable {
    let gender: String
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
}

struct HeroImage: Decodable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
