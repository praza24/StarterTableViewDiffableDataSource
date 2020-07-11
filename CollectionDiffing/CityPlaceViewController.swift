import UIKit

//MARK: Subclassing is neccessary in order to override the section headers
class CityPlaceTableViewDiffableDataSource: UITableViewDiffableDataSource<City, Place> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section].rawValue.uppercased()
    }
}


class CityPlaceViewController: UITableViewController {
    
    var diffableDataSource: CityPlaceTableViewDiffableDataSource!
    var citiesWithPlaces = City.stubCitiesWithPlaces
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupTableView()
        buildAndApplySnapshot() //Initialises the first snapshot to act as a basline
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        diffableDataSource = CityPlaceTableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, place) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlaceTableViewCell
            cell.setup(with: place)
            return cell
        }
    }
    
    private func buildAndApplySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<City, Place>()
        citiesWithPlaces.forEach { (landscapes) in
            let (landscape, places) = landscapes
            snapshot.appendSections([landscape])
            snapshot.appendItems(places, toSection: landscape)
        }
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    
    private func setupNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .done, target: self, action: #selector(shuffleTapped(_:)))
    }
    
    @objc func shuffleTapped(_ sender: Any) {
        self.citiesWithPlaces = citiesWithPlaces.map {
            ($0.city, $0.places.shuffled())
        }.shuffled()
        
        buildAndApplySnapshot()
    }
    
}
