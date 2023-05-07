import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.isScrollEnabled = true
            tableView.separatorStyle = .singleLine
            tableView.register(UITableViewCell.self, forCellReuseIdentifier:  "Cell")
        tableView.verticalScrollIndicatorInsets = .zero

        
            return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = self
    }
    
    private func setupUI() {
            view.backgroundColor = .blue

            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
}

extension ViewController: UITableViewDataSource {
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.selectionStyle = .none
        return cell
    }
}
