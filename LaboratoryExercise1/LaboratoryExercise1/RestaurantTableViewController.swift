//
//  RestaurantTableViewController.swift
//  LaboratoryExercise1
//
//  Created by student on 2/27/23.
//

import UIKit

struct Restaurant{
    var imageName: String
    var name: String
    var isTextHidden: Bool = false
    var isCellHorizontal: Bool = false
}

class RestaurantTableViewController: UITableViewController {

    private static let restaurantTableReuseIdentifier = "Andok's Chicken"

    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(
            RestaurantTableViewCell.self,
            forCellReuseIdentifier: RestaurantTableViewController.restaurantTableReuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RestaurantTableViewController.restaurantTableReuseIdentifier,
            for: indexPath
        ) as? RestaurantTableViewCell
        else { return UITableViewCell() }

        let restaurant = restaurants[indexPath.row]
        cell.stackView.axis = restaurant.isCellHorizontal ? .horizontal : .vertical
        cell.restaurantLabel.isHidden = restaurant.isTextHidden
        cell.restaurantLabel.text = restaurant.name
        let restoimage = UIImage(named: restaurant.imageName)
        cell.myImageView.image = restoimage
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let restaurant = restaurants[indexPath.row]
        goToDetailsViewController(restaurant: restaurant)
    }

    func goToDetailsViewController(restaurant: Restaurant) {
        let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsViewControllerIdentifier") as? DetailsViewController else { return }
        detailsViewController.restaurant = restaurant
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
}
