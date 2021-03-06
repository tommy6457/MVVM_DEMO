//
//  TableViewController.swift
//  MVVM_DEMO
//
//  Created by FETC_iMac2 on 2022/5/18.
//

import UIKit

class TableViewController: UITableViewController {

    lazy var viewModel: TableViewModel = {
        return TableViewModel(modelManager: ModelManager())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinding()
    }

    @IBSegueAction func toAddViewController(_ coder: NSCoder) -> AddViewController? {

        let addVC = AddViewController(addViewModel: AddViewModel(modelManager: viewModel.modelManager),coder: coder)
        addVC?.delegate = self

        return addVC
    }


    @IBAction func clickPlus(_ sender: Any) {

        performSegue(withIdentifier: "toAddViewController", sender: nil)
    }

    func setupBinding(){

        viewModel.reloadTable = { [weak self] in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if self.viewModel.isReload {
                    self.tableView.reloadData()
                }
            }

        }

    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if let addvc = segue.destination as? AddViewController {
//            addvc.addViewModel = AddViewModel(modelManager: viewModel.modelManager)
//            addvc.delegate = self
//        }
//
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.modelManager.model.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.modelManager.model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as! TableViewCell
        cell.updateCell(model: model)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: AddViewControllerDelegate{

    func reloadTableView() {
        viewModel.isReload = true
    }

}
