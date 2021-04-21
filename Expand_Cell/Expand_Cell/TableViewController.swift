//
//  TableViewController.swift
//  Expand_Cell
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit



struct ExpandDataModel {
    var description : String
    var isExpand : Bool
}



class TableViewController: UITableViewController {

    // Properties
    @IBOutlet var tvListView: UITableView!
    
    var dataModels = [ExpandDataModel]()
    
    // 변수 선언을 class 정의 전에 하여야 한다.
    // 화면 띄울 것들
//    var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
//    var itemsImageFile = ["cart.fill","clock","pencil.circle"]
    let textArray = [
        "Short Text",
        "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong",
        "Short Text",
        "longlonglonglonglonglongllonglonglonglonglonglonglongong",
        "Short Text",
        "longlonglonglonglonglongllonglonglonglonglonglonglongong",
        "Short Text",
        "longlonglonglonglonglongllonglonglonglonglonglonglongong",
        "Short TextShort TextShort TextShort TextShort Text",
        "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ediit 버튼을 마들고 삭제 기능 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // enumerated()는 index와 value(안에 들어있는값) 두가지를 가져올수 있음
        for (_,value) in textArray.enumerated(){
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))// false  확장되지않은 산태
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.decriptionLabel.text = dataModels[indexPath.row].description
        
        // 	확장된 상태냐?
        if dataModels[indexPath.row].isExpand == true{
            cell.decriptionLabel.numberOfLines = 0 // 0 -> 이면 다 표현하겠다 , 1 -> 한줄 , 2 -> 두줄 표현하겠다.
            
        }else{
            cell.decriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none //클릭 했을때 깜빡깜빡하는 표시 없애기.
        
//        cell.imgView.image = UIImage(systemName: itemsImageFile[(indexPath as NSIndexPath).row])
//        cell.titleLabel.text = items[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    // 테이블 클릭했을때 사용할 함수.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand // 지금값의 반대 값을 넣는다.
        
        // 1. heightForRowAt에서 정확한 높이를 지정 -> Performance에 지장 없음.
        
        // 2. tableView.reloadData() -> 어느정도 해결
        
        // 3.
//        tableView.estimatedSectionHeaderHeight = 0
//        tableView.estimatedSectionFooterHeight = 0
        
        // 4. Animation 효과 없애는 방법 -> 확실한 해결
//        UIView.setAnimationsEnabled(false)
//        tableView.reloadRows(at: [indexPath], with: .none)
//        UIView.setAnimationsEnabled(true)
        
        
//        tableView.reloadRows(at: [indexPath], with: .none) // animation -> .none : 클릭 했을때 깜빡깜빡하는 표시 없애기.
//        tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
//
    
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
