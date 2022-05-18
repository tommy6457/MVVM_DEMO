//
//  AddViewController.swift
//  MVVM_DEMO
//
//  Created by FETC_iMac2 on 2022/5/17.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func reloadTableView()
}

class AddViewController: UIViewController {


    @IBOutlet weak var titletf: UITextField!
    @IBOutlet weak var contenttf: UITextField!

    weak var delegate: AddViewControllerDelegate?

    var addViewModel: AddViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinding()
    }

    init?(addViewModel: AddViewModel,coder: NSCoder) {
        self.addViewModel = addViewModel
        super.init(coder: coder)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupBinding(){

        addViewModel.updateModel = { [weak self] in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if self.addViewModel.isupdate {
                    self.delegate?.reloadTableView()
                    self.navigationController?.popViewController(animated: true)
                }else{
                    self.showAlert(title: "請輸入標題/內文")
                }
            }
        }
    }

    @IBAction func clickSave(_ sender: Any) {

        var model: Model? = nil

        if let titleText = titletf.text,
           let contentText = contenttf.text,
           !titleText.isEmpty,
           !contentText.isEmpty{

            model = Model(title: titleText, detail: Model.Detail(detailText: contentText))
        }

        addViewModel.addModel(model: model)

    }

    func showAlert(title: String){

        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
